This is all of my dotfiles.
Everything in one repository.

Requires `GNU stow` and `python3` to install. Everything is separated into packages
and profiles combines several packages into logical group.

# How to install?

1. Clone this repository. Don't forget the `--recurse-submodules`!
2. Install `stow` and `python3` on your machine. You can do it via `apt` or `brew`.
3. Run `./install.sh <profile>` script with desired profile. You can pass
`--include-packages` with string of additional packages to include. Also
the script supports `--dry-run`.

Example:
```bash
./install.sh linux --include-packages="macos/kitty,linux/i3"
```
