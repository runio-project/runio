#!/bin/bash

# strict script: exit on fail, don't allow unset vars, print commands
set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images

# Steam
dnf5 install -y steam

# gamescope for Steam integration and CLI use
dnf5 install -y gamescope
dnf5 install -y --skip-unavailable \
    gamescope-libs \
    gamescope-shaders

# Brave Browser
dnf5 config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
dnf5 install -y brave-browser

# 1Password
rpm --import https://downloads.1password.com/linux/keys/1password.asc
cat <<EOF > /etc/yum.repos.d/1password.repo
[1password]
name=1Password Stable Channel
baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://downloads.1password.com/linux/keys/1password.asc
EOF
dnf5 install -y 1password

# Visual Studio Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
cat <<EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
dnf5 install -y code

# remove cached data
dnf5 clean all