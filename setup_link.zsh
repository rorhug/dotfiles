ln -sf ~/dotfiles/gitconfig.config ~/.gitconfig

/bin/rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
ln -sfh ~/dotfiles/st3-packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages

ln -sf ~/dotfiles/zshrc.zsh ~/.zshrc

/bin/rm -rf ~/Library/Application\ Support/Code/User
ln -sfh ~/dotfiles/vscode/User ~/Library/Application\ Support/Code

