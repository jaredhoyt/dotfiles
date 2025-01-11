# dot-files

These are my personal dotfiles.

## Architecture

This setup is designed to support ad-hoc management of modular packages, where a package may consist of multiple dependencies, configurations, and shell extensions.

This design has a couple of benefits over a traditional dotfile setup:

* **Portability**: A single package can be used by others without needing to install _all_ of the dotfiles. For example, try out my [neovim](packages/nvim) setup with `./install nvim`.

* **Composability**: Different sets of packages can be configured for various environments. For example, you may want to have just your neovim setup on a remote server without installing all of your language packages used in your development environment.

## Installation

Packages are identified by their directory name within [packages](packages).

To install one or more packages manually, include the name(s) as arguments to the install script:

```bash
./install <package1> <package2> ...
```

To configure which packages are automatically installed, update the `install` script to detect your environment and specify a list of packages:

```bash
packages=()
if [ ! $# -eq 0 ]; then
  # Manually selected packages
  packages=$*
elif [[ -n "${GITPOD_WORKSPACE_ID}" ]]; then
  # Gitpod packages
  packages=(
    homebrew
    zsh
  )
elif [[ $(uname) == "Darwin" ]]; then
  # MacOS packages
  packages=(
    elixir
    git
    macos
    mutagen
    nvim
    ruby
    tmux
    wezterm
  )
fi
```

## Packages

Though there are a number of packages already included in this setup, you may want to add your own package(s) or start fresh and just use the package management portion of these dotfiles. To that end, I'll walk through what a package consists of and how to set up a new one. You can also just review the [package.sh](helpers/package.sh) library if you want to skip the exposition.

For our example, we'll be creating a new package called `acme`:

```bash
mkdir packages/acme
```

#### Dependencies

System dependencies are currently handled by [homebrew](https://brew.sh/) since it's semi cross-platform.

To specify homebrew dependencies, create a [Brewfile](https://thoughtbot.com/blog/brewfile-a-gemfile-but-for-homebrew) in the package root:

```bash
touch packages/acme/Brewfile
```

The `Brewfile.lock.json` will automatically be ignored by the included `.gitignore`.

> [!NOTE]
> If a `Brewfile` is detected during package installation, the [homebrew](packages/homebrew) package will be automatically installed before continuing. For this reason, it's not required to include `homebrew` in your list of environment packages unless none of the other packages require homebrew and you would still like it installed.

#### XDG configs

Many dependencies have added support for [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/). In short, this means that they will look for their configuration in the `$XDG_CONFIG_HOME` which defaults to `~/.config`.

To add XDG-compliant configuration, create a `config` folder in the package root. This directory will be symlinked into the `$XDG_CONFIG_HOME` with the package name as the target.

```bash
mkdir packages/acme/config         # symlinked to ~/.config/acme
```

#### dot-files

For files and directories that need to go into directly into your home directory, you can just add a `dot-` prefix to their name. These will be symlinked to your home directory with the `dot-` prefix replaced by a `.`:

```bash
touch packages/acme/dot-file       # symlinked to ~/.file
mkdir packages/acme/dot-directory  # symlinked to ~/.directory
```

#### shell extensions

> [!IMPORTANT]
> These dotfiles are very dependent on zsh at the moment. I plan to loosen this dependency in the future, but this section won't really apply unless you're also using my [zsh package](packages/zsh).

If your package needs to add autoloaded zsh extensions (aliases, autocompletes, etc.), you can add a `zsh` directory in the package root. This directory will be symlinked into the `plugins` directory that my zsh package is [configured to autoload](packages/zsh/config/plugins.zsh):

```bash
mkdir packages/acme/zsh            # symlinked to ~/.config/zsh/plugins/_acme
```

#### custom install

And finally, if you need to run some installation logic, you can create an `install` executable in the package root. This will be executed at the very end, after dependencies and symlinks have been created:

```bash
touch packages/acme/install
chmod +x packages/acme/install
```

There are several bash variables that are available to your script:

* `$name`: the name of the package (e.g. `acme`)
* `$package`: the full path of the package directory (e.g. `packages/acme`)
* `$tmp`: the full path of a temporary directory that can be used for package artifacts (e.g. `.tmp/acme`)

Any artifacts from package installation will remain in the `.tmp` directory and ignored by git.

## Future

Some ideas for future improvements:

* Better cross-platform dependency management instead of homebrew.
* Less dependency on zsh as the specific shell for extensions.
* Smarter shell reloading (it currently reloads zsh even if the plugin symlink already exists)
* A top-level `dot` command to be used in place of executing `./install` directly
* A set of subcommands to be used with `dot` (e.g. `install`, `uninstall`, `package new`, etc.)
* A complete separation of the `dot` package manager with a way to install external packages

## License

Code is under the [BSD 2-clause "Simplified" License](LICENSE.txt).
Documentation is under the [Creative Commons Attribution license](https://creativecommons.org/licenses/by/4.0/).
