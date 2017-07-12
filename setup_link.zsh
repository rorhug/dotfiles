unlink ~/.gitconfig
ln -s ~/dotfiles/gitconfig.config ~/.gitconfig

unlink ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
ln -s ~/dotfiles/st3-packages-user ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

unlink ~/.zshrc
ln -s ~/dotfiles/zshrc.zsh ~/.zshrc
