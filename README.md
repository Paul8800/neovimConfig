# Paul Pasternak's NeoVim Config

## Dependencies
```
sudo apt install ripgrep fd-find bat fzf
```
## Langugae servers
c/c++:
```
sudo apt install clangd
```

python:
```
sudo apt install npm
sudo npm install -g pyright
```

lua:
```
brew install lua-language-server
```

rust:
```
rustup component add rust-analyzer
```


## Plugins
- Telescope
- TreeSitter
- Cmp
- Oil
- NeoScroll
- CodeRunner
- git
- ui

## Install
```
mkdir -p ~/.config
git clone git@github.com:paul8800/neovimConfig.git ~/.config/nvim
cd ~/.config/nvim
rm -rf .git
mkdir -p ~/NeoVimProjects/temp
```
