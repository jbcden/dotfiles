#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS 
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d.old
fi
if [ -d .vim/ ]; then
		mv .vim .vim.old
fi
if [ -e .vimrc ]; then
		mv .vimrc .vimrc.old
fi
if [ -e .emacs ]; then
		mv .emacs .emacs.old
fi
if [ -e .bashrc ]; then
		mv .bashrc .bashrc.old
fi
if [ -e .screenrc ]; then
		mv .screenrc .screenrc.old
fi

git clone https://github.com/jbcden/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.vim .

# install vim
sudo apt-get install vim-nox
