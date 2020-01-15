DOT_FILES=(.config  .zshenv  .zshrc)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done
	ln -s $HOME/dotfiles/.config/nvim/init.vim $HOME/.init.vim


 sudo apt-get update
 sudo apt-get -y install build-essential curl git python-setuptools ruby

sudo mkdir /home/linuxbrew/
sudo chmod -R 777 /home/linuxbrew/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
export INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
export XDG_CONFIG_HOME="$HOME/.config"
brew install zsh
brew install neovim
brew install python3
pip3 install -U neovim
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
	~/.vim/dein/repos/github.com/Shougo/dein.vim
zsh
