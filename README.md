# Ubuntu Config Backup

个人开发环境配置备份，包含终端、Vim/Neovim、VSCode 等常用工具的配置文件。

```bash
# Tmux
ln -sf "./tmux.conf" ~/.tmux.conf

# Zsh
ln -sf "./zshrc" ~/.zshrc

# Vim
ln -sf "./vimrc" ~/.vimrc

# Neovim
ln -sf "./nvim" ~/.config/nvim

# VSCode
# Ubuntu
ln -sf "./vscode/settings.json" ~/.config/Code/User/settings.json
ln -sf "./vscode/keybindings.json" ~/.config/Code/User/keybindings.json
# macOS
ln -sf "./vscode/settings.json" ~/Library/Application\ Support/Code/User/settings.json
ln -sf "./vscode/keybindings-mac.json" ~/Library/Application\ Support/Code/User/keybindings.json
```
