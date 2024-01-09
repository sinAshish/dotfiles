
#!/bin/bash

# Define the path to the Zsh plugins directory
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
# Check if Oh My Zsh is installed
if [ ! -d "$ZSH_CUSTOM" ]; then
    echo "Oh My Zsh is not installed. Please install Oh My Zsh first."
    exit 1
fi

# install omz
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# install zsh plugins for autocompletion and syntax-highlighting
# Function to install a plugin
install_plugin() {
    local plugin_name="$1"
    local repo_url="$2"

    # Check if the plugin directory already exists
    if [ ! -d "$ZSH_CUSTOM/plugins/$plugin_name" ]; then
        echo "Installing $plugin_name..."
        git clone --quiet "$repo_url" "$ZSH_CUSTOM/plugins/$plugin_name"
        echo "Installation of $plugin_name completed."
    else
        echo "$plugin_name is already installed. Skipping..."
    fi
}


# Install zsh-autosuggestions
install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"

# Install zsh-syntax-highlighting
install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

install_plugin "zsh-vi-mode" "https://github.com/jeffreytse/zsh-vi-mode.git"

echo "All ZSH plugins installed successfully."

#git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions


# Define the target directory for local installations
LOCAL_INSTALL_DIR=~/bin

# Create the target directory if it doesn't exist
mkdir -p "$LOCAL_INSTALL_DIR"

# Function to install Neovim locally



# Install Neovim locally

# Reload the shell configuration to apply changes
exec zsh
source ~/.zshrc
# Function to check if Neovim is installed
is_neovim_installed() {
    command -v nvim &> /dev/null
}
# Install Neovim locally if not installed
#if ! is_neovim_installed; then
#    install_neovim_locally
#fi

# Replace "nvim" aliases with "vim" or "vi" if Neovim is not installed
# Verify Neovim or Vim installation
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Define the path to the Vim plugins directory
VIM_PLUG=~/.vim/autoload/plug.vim

# Check if Vim is installed
if command -v vim &> /dev/null; then
    echo "Vim is installed."
else
    echo "Vim is not installed. Please install Vim first."
    exit 1
fi
# Install vim-plug
if [ ! -f "$VIM_PLUG" ]; then
    echo "Installing vim-plug..."
    curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "vim-plug installation completed."
else
    echo "vim-plug is already installed. Skipping..."
fi


# Function to install a Vim plugin
install_vim_plugin() {
    local plugin_name="$1"
    local repo_url="$2"

    # Check if the plugin directory already exists
    if [ ! -d "$HOME/.vim/plugged/$plugin_name" ]; then
        echo "Installing $plugin_name..."
        git clone --quiet "$repo_url" "$HOME/.vim/plugged/$plugin_name"
        echo "Installation of $plugin_name completed."
    else
        echo "$plugin_name is already installed. Skipping..."
    fi
}


# Install Vim plugins using vim-plug
install_vim_plugin "vim-airline" "https://github.com/vim-airline/vim-airline.git"
install_vim_plugin "nerdtree" "https://github.com/preservim/nerdtree.git"

# Add other plugins as needed
# Example:
# install_vim_plugin "another-vim-plugin" "https://github.com/username/another-vim-plugin.git"

echo "All Vim plugins installed successfully."
# Define the path to the fzf directory
FZF_DIR=~/.fzf

# Set up Vim configuration if needed (e.g., specifying plugins in the .vimrc file)
# Example:
echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
echo "Plug 'vim-airline/vim-airline'" >> ~/.vimrc
echo "Plug 'preservim/nerdtree'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc
# Define the path to the fzf directory
FZF_DIR=~/.fzf

# install vim-plug for vim and nvim (if present on servers)
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# now connect the dotfiles to .dotfiles on current system

# Check if fzf is installed
if [ ! -d "$FZF_DIR" ]; then
    echo "Installing fzf..."
    git clone --quiet --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
    "$FZF_DIR/install" --all --no-update-rc
    echo "fzf installation completed."
else
    echo "fzf is already installed. Skipping..."
fi

# Add fzf to the PATH if not present
if ! command -v fzf &> /dev/null; then
    echo 'export PATH=$PATH:~/.fzf/bin' >> ~/.zshrc
    echo "Added fzf to the PATH."
fi
exec zsh
source ~/.fzf.bash
source ~/.fzf.zsh
echo "FZF properly setup"

# Reload the shell configuration to apply changes
source ~/.zshrc
source ~/.fzf.bash
source ~/.fzf.zsh

#rsync -avz nvim/init.vim ~/.config/nvim/init.vim

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
FILES=("nvim/init.vim" "oh-my-zsh.sh" "*.theme")

# Function to copy files using rsync
copy_files() {
    local file_pattern="$1"
    rsync -av --ignore-existing --include="$file_pattern" --exclude='*' "$SOURCE_DIR/" "$TARGET_DIR/"
}

# Copy each specified file type
# for file_pattern in "${FILES[@]}"; do
#     copy_files "$file_pattern"
# done

#rsync -avz nvim/init.vim ~/.vimrc

#rsync -avz .zshrc ~/.zshrc

#rsync -avz oh-my-zsh.sh ~/.oh-my-zsh/oh-my-zsh.sh

#rsync -avz ./robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme

echo "Now install the vim plugins by opening vim"

echo "Then again execute this command: source ~/.zshrc "

exec zsh
source ~/.zshrc
