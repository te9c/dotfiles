This is all of my dotfiles.
Everything in one repository.

# How to setup?

1. Install `GNU stow` on your system.
2. Run `install.sh`

> [!IMPORTANT]
> Don't forget to pass `--recurse-submodules` to git clone command
> to download configs that located in other repositories (like [neovim](https://github.com/te9c/AstroNvim-config)).

# Configuration

The `install.sh` script automatically install required config based on your system.
But if you want you can set `auto_options` variable to `false` and select manually which configs to install.
