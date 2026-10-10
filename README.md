This is all of my dotfiles.
Everything in one repository.

Requires `GNU stow` to install. Everything is separated into packages
and profiles combines several packages into logical group.

# How to install?

1. Install `stow` on your machine. You can do it via `apt` or `brew`.
2. Run `./install.sh <profile>` script with desired profile. You can pass
`--include-packages` with string of additional packages to include. Also
the script supports `--dry-run`.

Example:
```bash
./install.sh linux --include-packages="macos/kitty,linux/i3"
```