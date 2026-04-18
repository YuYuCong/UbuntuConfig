# UbuntuConfig

**UbuntuConfig** is a personal dotfiles repo for shell, terminal multiplexer, editors, and IDE settings—easy to sync across Linux and macOS without a heavy framework.

Neovim is configured on top of [LazyVim](https://github.com/LazyVim/LazyVim), powered by [lazy.nvim](https://github.com/folke/lazy.nvim), so you get sensible defaults plus room to extend. Other pieces are plain Vim, Zsh, and Tmux configs you can drop in or symlink as you like.

## ✨ What’s included

- 🐚 **Zsh** — [Oh My Zsh](https://ohmyz.sh/)–based `zshrc` (theme, plugins, PATH)
- 🪟 **Tmux** — prefix, splits, history, and workflow tweaks in `tmux.conf`
- ✏️ **Vim** — `vimrc`
- 🚀 **Neovim** — LazyVim-style layout under `nvim/` (see [`nvim/README.md`](nvim/README.md))
- 🧩 **VS Code / Cursor** — `settings.json` and `keybindings.json`, plus a small script for macOS keymaps

## ⚡️ Requirements

- **Git** — to clone this repo
- **Zsh, [Oh My Zsh](https://ohmyz.sh/)** — if you use the bundled `zshrc`
- **Tmux**
- **Neovim** — LazyVim expects Neovim **≥ 0.11.2** (built with **LuaJIT**); see [LazyVim requirements](https://lazyvim.github.io/installation)
- **[fzf](https://github.com/junegunn/fzf)** — fuzzy finder, sourced in `zshrc` via `~/.fzf.zsh`
- **[thefuck](https://github.com/nvbn/thefuck)** — command corrector, aliased as `fuck` / `cao` in `zshrc`

## 📂 File structure

Configs load from their usual locations once symlinked; you do not need a custom loader for shell/tmux/vim.

```text
UbuntuConfig/
├── LICENSE
├── README.md
├── doc/                 # demo images
├── zshrc
├── tmux.conf
├── vimrc
├── nvim/
│   ├── init.lua
│   ├── lua/
│   │   ├── config/      # options, keymaps, autocmds, lazy bootstrap
│   │   └── plugins/     # plugin specs (lazy.nvim)
│   └── README.md
└── vscode/
    ├── settings.json
    ├── keybindings.json
    └── keybindings-mac.json
```

## ✨ Demos

### VS Code demos

**VS Code using Neovim**

![VS Code using Neovim](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/vscode.gif)

### Tmux demos

**Neovim in Tmux**

![Neovim in Tmux](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/tmux-neovim.png)

**Add windows**

![Tmux: add windows](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/tmux-add-windows.gif)

**Split panes**

![Tmux: split panes](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/tmux-split-windows.gif)

**Switch windows**

![Tmux: switch windows](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/tmux-switch-windows.gif)

**Resize panes**

![Tmux: resize panes](https://raw.githubusercontent.com/YuYuCong/UbuntuConfig/main/doc/tmux-window-size.gif)

---

## 🚀 Getting Started

### 🧩 Quick start

Clone the repository:

#### Branches

| Branch                 | What you get                                                                                                                      |
| ---------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| **`main`**             | Full repository, including the `doc/` folder (GIF/PNG demos for this README, on the order of tens of MiB).                        |
| **`main-without-doc`** | Same configuration files as `main`, but **without** `doc/`. Use this for a smaller, faster clone when you only need the dotfiles. |

#### Clone (fast, dotfiles only)

Recommended on a new machine when you do not need local copies of the demo media:

```sh
git clone --branch main-without-doc --single-branch --depth 1 https://github.com/YuYuCong/UbuntuConfig.git
cd UbuntuConfig
```
#### Clone (full, including `doc/`)

```sh
git clone https://github.com/YuYuCong/UbuntuConfig.git
cd UbuntuConfig
```

### ⚙️ Full Settings

Back up any existing files you are about to replace, then symlink or copy configs. 

```shell
# 安装zsh
sudo apt-get install zsh
# 安装oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cd ~/.oh-my-zsh/tools
./install.sh
# 部署zsh配置文件
cd <path-to-UbuntuConfig>
ln -sf "$(pwd)/zshrc" ~/.zshrc

# 安装tmux
sudo apt-get install tmux
# 部署tmux配置文件
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
# 设置默认启动tmux
cat /etc/shells
chsh -s /usr/bin/tmux
# 重启系统生效

# Vim
sudo apt-get install vim
# 部署Vim配置文件
ln -sf "$(pwd)/vimrc" ~/.vimrc

# Neovim
sudo apt-get install neovim
# 部署Neovim配置文件
ln -sf "$(pwd)/nvim" ~/.config/nvim
# 启动nvim初始化
nvim

# VS Code
# Ubuntu
ln -sf "$(pwd)/vscode/settings.json" ~/.config/Code/User/settings.json
ln -sf "$(pwd)/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
# macOS
ln -sf "$(pwd)/vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "$(pwd)/vscode/keybindings-mac.json" ~/Library/Application\ Support/Code/User/keybindings.json

# fzf（模糊搜索工具）
# Ubuntu
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# macOS
brew install fzf
$(brew --prefix)/opt/fzf/install

# thefuck（命令纠错工具）
# Ubuntu
sudo apt-get install python3-dev python3-pip python3-setuptools
pip3 install thefuck
# macOS
brew install thefuck
```

**Neovim**

This repo’s Neovim setup follows LazyVim conventions: add or override plugin specs under `nvim/lua/plugins/`, and editor options under `nvim/lua/config/`. Full documentation lives at [lazyvim.github.io](https://lazyvim.github.io).

- 配置文件位置`~/.config/nvim/`
- 插件目录`~/.local/share/nvim/`
- 缓存目录`~/.cache/nvim/`


**VS Code**

- **Linux-oriented** shortcuts live in `vscode/keybindings.json` (`ctrl` / `alt`).
- On **macOS**, generate a mac-friendly file:

  ```sh
  python3 vscode/convert_keybindings_mac.py
  ```

  This writes `vscode/keybindings-mac.json` (maps `ctrl` → `cmd`, `alt` → `option`). Merge or copy into your editor’s keybindings JSON as needed.

---

## License

Apache License 2.0 — see [`LICENSE`](LICENSE).
