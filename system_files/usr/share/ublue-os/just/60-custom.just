# vim: set ft=make :

# Add ublue-os homebrew tap
[group('RunIO')]
setup-runio:
    #!/usr/bin/bash
    set -euo pipefail

    # Add ublue-os homebrew tap
    echo "Adding ublue-os homebrew tap..."
    brew tap ublue-os/tap || true

    echo ""
    echo "RunIO setup complete!"
