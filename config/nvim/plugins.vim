" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
	Plug 'jamessan/vim-gnupg'
	Plug 'ayu-theme/ayu-vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'lark-parser/vim-lark-syntax'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'rootkiter/vim-hexedit'
	Plug 'tpope/vim-commentary'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	Plug 'mhinz/vim-startify'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'honza/vim-snippets'
	Plug 'sheerun/vim-polyglot'
	Plug 'logico/typewriter-vim'
	Plug 'lervag/vimtex'
	Plug 'liuchengxu/vim-which-key'
call plug#end()
