" let g:vimtex_view_automatic = 0
let g:vimtex_view_general_viewer = 'sidepreview'
let g:vimtex_view_general_options = 'pdf @pdf'
let g:vimtex_compiler_latexmk = {'build_dir' : '.latexbuild',}


" autocmd! BufRead *.tex VimtexCompile
autocmd! VimLeavePre *.tex call system('sidepreview --close pdf')

