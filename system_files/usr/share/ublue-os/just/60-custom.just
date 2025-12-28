# vim: set ft=make :

# Add ublue-os homebrew tap
[group('RunIO')]
setup-runio-brew:
    #!/usr/bin/bash
    set -euo pipefail

    echo "Adding ublue-os homebrew tap..."
    brew tap ublue-os/tap || true

    echo ""
    echo "ublue-os homebrew tap added!"

# Switch to RunIO remote registry
[group('RunIO')]
setup-runio-rebase:
    sudo bootc switch ghcr.io/runio-project/runio:latest

