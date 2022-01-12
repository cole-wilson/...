source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/vimtex.vim
" lua require 'colorizer'

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 :tablast<cr>


let g:mapleader = "\<Space>"
let g:coc_node_path = "/opt/homebrew/bin/node"
let g:python3_host_prog = "/opt/homebrew/bin/python3"
let g:vimspector_enable_mappings='HUMAN'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.htm'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1


syntax enable                           " Enables syntax highlighting
" set timeoutlen=500
set ignorecase
set noruler
set whichwrap+=<,>,[,]
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                          
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set noexpandtab                         " Converts tabs to spaces
set autoindent                          " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continuation of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory
set backspace=indent,eol,start
set showtabline=2
set noshowmode

command JSON execute '%!python3 -m json.tool'
command Gist :w !gh gist create -f % | tail -n 1 | pbcopy

" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

noremap <Space>/ :Commentary<CR>
vnoremap <Space>/ :Commentary<CR>
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Color Schemes and Highlighting
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
highlight Comment cterm=italic gui=italic
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad gui=undercurl guisp=#ff0000

" Autocmd
autocmd BufEnter term://* exec ':startinsert'
autocmd BufRead,BufNewFile *.md,*.txt,*.eml,*.rst setlocal spell
function! BinaryCheck()
    if system('file -ib ' . shellescape(expand('%:p'))) !~# '^text/plain'
		if confirm("open `".expand("%:t")."` as a binary file?", "&yes\n&no")
			exec ':Hexedit'
		endif
	endif
endfun
" autocmd BufRead * call BinaryCheck()


function! PlaySound()
	if col('.') != 1
		silent! exec '!afplay ~/.config/nvim/support/typewriter.aiff &'
	else
		silent! exec '!afplay ~/.config/nvim/support/bell.wav &'
	endif
endfunction
function! TypewriterLayout()
	set laststatus=0
	call system("typewriter on &")
	colorscheme typewriter
endfunction
function! TypewriterLayoutOff()
	set laststatus=1
	call system("typewriter off &")
	colorscheme ayu
endfunction

" autocmd CursorMoved *.txt,*.eml silent! exec '!afplay ~/.config/nvim/support/roll.wav &'
" autocmd CursorMovedI *.txt,*.eml call PlaySound()
autocmd VimEnter *.txt,*.eml call TypewriterLayout()
autocmd FocusLost,VimLeave *.txt,*.eml call TypewriterLayoutOff()

