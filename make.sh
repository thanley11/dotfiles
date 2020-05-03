h
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc bashrc Xresources xinitrc"              # list of files/folders to symlink in homedir
#bashrc vim zshrc oh-my-zsh              # other options  

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

echo "Creating symlinks for i3"
ln -s $dir/i3/i3status.conf ~/.i3status.conf
ln -s $dir/i3/config ~/.config/i3/config

echo "Creating symlinks for mpv"
ln -s $dir/mpv/input.conf ~/.config/mpv/input.conf
ln -s $dir/mpv/lua-settings ~/.config/mpv/lua-settings
ln -s $dir/mpv/mpv.conf ~/.config/mpv/mpv.conf

# Install Pathogen - May change in the future

echo "...done"
