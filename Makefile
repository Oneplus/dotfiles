TARGET=VIM TMUX

all: ${TARGET}

VIM:
	cp -r .vim ~/.vim
	cp -r vimrc ~/.vimrc

TMUX:
	cp tmux.conf ~/.tmux.conf

PYTHON:
	chomd +x py-modules.sh

R:
	Rscript r-packages.R
