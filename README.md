<div align="center">
  <h1>neovim.config</h1>
  <img src="./assets/banner.png">
</div>
<br>
<div align="center">
  <img alt="Crates.io" src="https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square">
  <br>
  <p>A modular <b>neovim</b> config with a focus on C/C++ and Rust. Python and Lua are supported out of the box.
    Used professionally every day for the last 3 years in the embedded development field.</p>
</div>

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contributing](#contributing)
- [License](#license)

## Install

1. Get Node/Npm via fnm: `curl -fsSL https://fnm.vercel.app/install | bash`
    - `fnm install --latest`

### Arch Linux

1. **Pacman**
```bash
sudo pacman -S base-devel cmake python-pip luarocks wl-clipboard xlclip python-virtualenv clang python-pynvim rustup
```

2. **Paru**
```bash
paru -S cmake-format cmake-language-server
```

3. **Steps 1 and 2 together**
```bash
paru -S cmake-format cmake-language-server base-devel cmake python-pip luarocks wl-clipboard xlclip python-virtualenv clang python-pynvim rustup cmake-format cmake-language-server
```

4. **Npm**
```bash
npm install -g neovim tree-sitter-cli
```

5. **Rustup**
```bash
rustup component add rust-analyzer
```


### Neovim Config

There isn't much to install, just copy the `nvim` directory to `~/.config/nvim`.
But for the sake of commands..

```bash
# clone the repo to home
git clone --depth 1 https://github.com/thebashpotato/neovim.config.git ~/

# make a soft link to the config
ln -s $(pwd)/neovim.config/nvim ~/.config/nvim

# open nvim and let it set up
nvim
```

## Usage

See the [Dap configs](./dap-configs) for per-project language configurations.

> Copy `./dap-configs/nvim-dap-cpp.lua` to `your_project/.nvim-dap.lua` and update
> the dap.configurations.<lang> to match your binary.

## Maintainers

[@thebashpotato](https://github.com/thebashpotato)

## Contributing

PRs accepted.

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

AGPLv3 © 2022 Matt Williams
