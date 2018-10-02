DOT_FILES=(.init.vim .config  .zshenv  .zshrc)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done

 sudo apt-get update
 sudo apt-get -y install build-essential curl git python-setuptools ruby

sudo mkdir /home/linuxbrew/
sudo chmod -R 777 /home/linuxbrew/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/linuxbrew/.linuxbrew/lib"
export XDG_CONFIG_HOME="$HOME/.config"
brew install zsh
brew install zplug
brew install neovim
brew install python3
pip3 install -U neovim
chsh -s /bin/bash
zsh
