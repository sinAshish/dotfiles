
# install omz
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# install zsh plugins for autocompletion and syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


# install vim-plug for vim and nvim (if present on servers)
<<<<<<< HEAD

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# now connect the dotfiles to .dotfiles on current system

rsync -avz nvim/init.vim ~/.config/nvim/init.vim

=======
>>>>>>> 7dbc9a9b49ae4dca120ea87629282296cf31e716
if [ -d "~/.vim" ];then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  mkdir -p ~/.vim/
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -d ".config/nvim/" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  rsync -avz nvim/init.vim ~/.config/nvim/init.vim
fi

# now connect the dotfiles to .dotfiles on current system

rsync -avz nvim/init.vim ~/.vimrc

rsync -avz .zshrc ~/.zshrc

rsync -avz oh-my-zsh.sh ~/.oh-my-zsh/oh-my-zsh.sh

rsync -avz ./robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

echo "Now install the vim plugins by opening vim"

echo "Then again execute this command: source ~/.zshrc "

exec zsh
source ~/.zshrc
