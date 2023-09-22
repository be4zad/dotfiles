STOW_ARGS := --verbose --target=$$HOME vim
YCM_BUILD_ARGS := --clangd-completer --verbose

all:
	@echo 'Run `make install` or `make uninstall`'

vim-install: vim-install-configs vim-plug-install vim-vundle-install vim-install-plugins vim-ycm-build

install: vim-install
uninstall: vim-uninstall-configs

vim-install-configs:
	@echo 'Installing Vim configs and plugins...'
	stow --restow $(STOW_ARGS)

vim-uninstall-configs:
	@echo 'Uninstalling Vim configs...'
	stow --delete $(STOW_ARGS)
	@echo '* Note that Vim configs and vimrc uninstalled, not plugins.'

vim-plug-install:
	@echo 'Installing VimPlug...'
	@if [ -f "$$HOME/.vim/autoload/plug.vim" ]; then \
	    echo 'VimPlug is installed before.'; \
 	else \
		curl -fLo $$HOME/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
	fi

vim-vundle-install:
	@echo 'Installing Vundle...'
	@if [ -d "$$HOME/.vim/bundle/Vundle.vim" ]; then \
	    echo 'Vundle is installed before.'; \
 	else \
	    git clone https://github.com/VundleVim/Vundle.vim.git $$HOME/.vim/bundle/Vundle.vim; \
	fi

vim-install-plugins:
	@echo 'Installing Vim plugins through plugin managers...'
	vim -c InstallAllPlugins

vim-ycm-build:
	@echo "Building YouCompleteMe plugin..."
	sh -c 'cd $$HOME/.vim/bundle/YouCompleteMe/ && git submodule update --init --recursive && python3 install.py $(YCM_BUILD_ARHS)';
