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
ujust setup-runio-brew
```

## Build an ISO
sudo just rebuild-iso
```

When running RunIO for first time from ISO:

```bash
ujust setup-runio-rebase
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
