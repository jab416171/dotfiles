mv * .[^.]* ~
sudo apt-get -y install git vim ack-grep acpi
mkdir -p ~/.vim/bundle/vundle
git clone git@github.com:gmarik/vundle.git ~/.vim/bundle/vundle
rm -rf dotfiles/
vim +BundleInstall +qall
