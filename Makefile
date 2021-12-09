
setup:
	mkdir -p _tmp
	ln -s ${CURDIR} ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
reset:
	unlink ~/.vim
