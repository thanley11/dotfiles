h
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc"              # list of files/folders to symlink in homedir
#bashrc vim zshrc oh-my-zsh              # other options  
bundle="~/.vim/bundle"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install Pathogen - May change in the future
echo "Installing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install pymode and NerdTree by cloning their repos into ~/.vim/bundle
echo "Changing to $bundle directory"
cd $bundle
echo "...done"

echo "Installing NerdTree"
git clone https://github.com/scrooloose/nerdtree.git

echo "Installing pymode"
git clone git://github.com/klen/python-mode.git

echo "Installing vinegar"
git clone https://github.com/dhruvasagar/vim-vinegar.git
