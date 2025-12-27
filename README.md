# RunIO (Tyrion Keep)

A custom bootc image built on [Aurora](https://getaurora.dev/) from [Universal Blue](https://universal-blue.org/).

## What's Included

On top of Aurora's KDE Plasma desktop:

- **Steam** with Gamescope integration
- **Gamescope CLI**
- **Brave Browser**
- **1Password**
- **Visual Studio Code**

## Installation

### On an existing Fedora Atomic / Universal Blue system

```bash
sudo bootc switch ghcr.io/runio-project/runio:latest
```

For Kionite and non-Universal Blue rebases, after reboot run to enforce container signing:

```
sudo bootc switch --enforce-container-sigpolicy ghcr.io/runio-project/runio:latest
```

Then reboot.

## First Run Setup

After installation, run the setup script:

```bash
ujust setup-runio
```

## Building Locally

Requires [Just](https://github.com/casey/just) and Podman.

```bash
# Build the container image
just build

# Build and run a VM (QCOW2)
just build-qcow2
just run-vm-qcow2

# Build an ISO
just build-iso
```

## Verification

Images are signed with [Cosign](https://github.com/sigstore/cosign). Verify with:

```bash
cosign verify --key cosign.pub ghcr.io/runio-project/runio:latest
```

## Credits

Built on the shoulders of:

- [Aurora](https://getaurora.dev/) - KDE Plasma on Fedora Atomic
- [Universal Blue](https://universal-blue.org/) - Custom Fedora Atomic images
- [KDE Plasma](https://kde.org/plasma-desktop/) - Desktop environment
- [Fedora](https://fedoraproject.org/) - The foundation

## License

Apache-2.0
