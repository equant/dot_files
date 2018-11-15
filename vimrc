" to reload:
" :source ~/.vimrc
set nocompatible              " required
filetype off
set encoding=utf-8
filetype plugin indent on    " required

execute pathogen#infect()

map <Space> <Leader>
"set background=light
"colorscheme solarized
"colorscheme badwolf
colorscheme molokai
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
set wildmenu            " graphical menu for file matches
set hidden              " let me change buffers even if they have unsaved content.

let loaded_matchparen = 1  " fools vim into thinking that this module is already loaded

set autochdir

""" Things recommended by Syntastic...
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['tex'] }

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text         call pencil#init({'wrap': 'soft'})
augroup END

"set iskeyword+=:        " For latex tab completion (e.g. plot:radial_intensity)

au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" For tagbar
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Misc.                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent entire file.
nnoremap @I :normal gg=G''<CR>
" Open Thunar where I am...
nnoremap <leader>t :! thunar &<CR><CR>.
set tags=tags,../tags,../../tags
"set tags=~/research/disk-snowlines/tags;        " ctags -R .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          External Compiler Commands                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au BufEnter,BufNew *.tex nnoremap <leader>c :w<CR>:!rubber --synctex --pdf --unsafe %<CR>
au BufEnter,BufNew *.tex nnoremap <leader>c :w<CR>:!xelatex --synctex=1 %<CR>
au BufEnter,BufNew *.py   nnoremap <leader>c :w<CR>:!python %<CR>
au BufEnter,BufNew *.mkd nnoremap <leader>c :w<CR>:!pandoc % > %:r.html<CR>

"pandoc foo.md \
"       --output=foo.html \
"       --to=html5 \
"       --css=$HOME/.local/share/markdown-css/tufte.css \
"       --highlight-style=haddock \
"       --self-contained \
"       --smart

" compile HTML _and_ pdf...
"au BufEnter,BufNew *.md nnoremap <leader>c :w<CR>:!pandoc % --output=%:r.html --to=html5 --css=$HOME/.local/share/markdown-css/github.css --highlight-style=haddock --self-contained -smart <CR>:!pandoc -s % -o %:r.pdf --self-contained -smart --variable mainfont="DejaVu Sans"<CR>
" Compile just html...
au BufEnter,BufNew *.md nnoremap <leader>c :w<CR>:!pandoc % --output=%:r.html --to=html5 --css=$HOME/.local/share/markdown-css/github.css --highlight-style=haddock --self-contained -smart <CR>
" Compile just pdf...
au BufEnter,BufNew *.md nnoremap <leader>C :w<CR>:!pandoc -s % -o %:r.pdf --self-contained -smart --variable mainfont="DejaVu Sans"<CR>


au BufEnter,BufNew *.txt nnoremap <leader>c :w<CR>:!rst2html5 --stylesheet-path=$HOME/.local/share/markdown-css/nathan.css --math-output=MathJax % %:r.html<CR>:!rst2latex % %:r.tex<CR>:!rubber --synctex --pdf --unsafe %:r.tex<CR>

"au BufEnter,BufNew *.txt nnoremap <leader>c :w<CR>:!rst2html5 --stylesheet-path=$HOME/.local/share/markdown-css/nathan.css --math-output=MathJax % %:r.html<CR>:!rst2xetex % %:r.tex<CR>:!rubber --synctex --pdf --unsafe %:r.tex<CR>
"pandoc --from rst --toc % -o %:r.pdf --latex-engine=xelatex --highlight-style=haddock --self-contained --smart --variable mainfont="DejaVu Sans"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           External Viewer Commands                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter,BufNew *.tex nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>
au BufEnter,BufNew *.py   nnoremap <leader>v :!zathura plot_working.pdf &<CR><CR>
"au BufEnter,BufNew *.mkd nnoremap <leader>v :!chromium --user-data-dir=/home/equant/.config/chromium/vim_profile %:r.html &<CR><CR>
au BufEnter,BufNew *.mkd nnoremap <leader>v :!chromium --user-data-dir=/home/equant/.config/chromium/vim_profile --app=%:r.html &<CR><CR>
" I am using the firefox add-on "Markdown Viewer by Thiht to make the following work:
au BufEnter,BufNew *.md nnoremap <leader>v :!firefox -new-window %:r.html &<CR><CR>
au BufEnter,BufNew *.txt nnoremap <leader>v :!firefox -new-window %:r.html &<CR><CR>
au BufEnter,BufNew *.txt nnoremap <leader>V :!zathura %:r.pdf &<CR><CR>

"map <C-enter> :call Synctex()<cr>
map <leader>z :execute "!zathura --synctex-forward " . line(".") . ":" . col(".") . ":" . bufname('%') . " " . expand("%:r") . ".pdf"<CR><CR>

" gf on a pdf opens zathura
" http://stackoverflow.com/questions/7810845/how-to-open-pdf-files-under-cursor-using-gf-with-external-pdf-readers-in-vim
au BufReadCmd *.pdf silent !/usr/bin/zathura % & 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Worklog Tools                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"iab xdate <c-r>=strftime('%c')<cr>
iab xdate <c-r>=strftime('%a %b %d %Y')<cr>
"nmap <leader>w i## TITLE<esc>:r!pwd<CR>I## xdate<esc>$o<CR>1.<esc>?TITLE<CR>
"nmap <leader>w i## WorklogEntry<CR>#### xdate<esc>$o<CR>1.<esc>?WorklogEntry<CR>cw
nmap <leader>w o<CR>xdate<CR>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<CR><CR>

"Tim's original...
"map <leader>w :silent! badd WORKLOG.md<CR>:b WORKLOG.md<CR>G:r!date<CR>GA 
"map <leader>w :silent! badd ~/research/current/WORKLOG.md<CR>:b ~/research/current/WORKLOG.md<CR>GA<CR>#### xdate<CR><CR>
"map <leader>w :silent! badd ~/research/WORKLOG.md<CR>:b ~/research/WORKLOG.md<CR>GA<CR><CR>#### xdate<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Buffer Navigation                               "
" - I use buftabline.vim                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>d :bd<CR>
"nnoremap <leader>t :tab all<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
noremap <Leader><Leader> <C-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Comment Boxes                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>b :center 50<cr>0r#<space><esc>40A <esc>d50<bar>r#YppVr#kk.
au BufEnter,BufNew *.tex nnoremap <leader>b :center 50<cr>0r%<space><esc>40A <esc>d50<bar>r%YppVr%kk.
au BufEnter,BufNew *.py nnoremap <leader>b :center 50<cr>0r#<space><esc>40A <esc>d50<bar>r#YppVr#kk.
au BufEnter,BufNew .vimrc nnoremap <leader>b :center 50<cr>0r"<space><esc>40A <esc>d50<bar>r"YppVr"kk.
" .in -> MCMax
au BufEnter,BufNew .in nnoremap <leader>b :center 50<cr>0r*<space><esc>40A <esc>d50<bar>r*YppVr*kk.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Old Things Left For Future Reference                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>] gt
"nnoremap <leader>[ gT
"nmap <leader>t :bufdo tab split<CR>
"nnoremap <C-b> :center 80<cr>hhv0r#A<space><esc>40A#<esc>d80<bar>YppVr#kk.
" Doesn't work in .vimrc...
"NoMatchParen            " To turn it on... :DoMatchParen
"set cursorline          " draws a horizontal line on the line your cursor is currently on
"set softtabstop=4
"au BufEnter,BufNew *.mkd nnoremap <leader>v :!firefox -new-window %:r.html &<CR><CR>.
"filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               SYNCTEX Testing                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9>   :exec "!szathura %:r.pdf" line('.')  col('.') "% > /dev/null"<cr><cr>
function! Synctex()
    " remove 'silent' for debugging
    execute "!zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
    "execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

"" virtual tabstops using spaces
"let my_tab=4
"execute "set shiftwidth=".my_tab
"execute "set softtabstop=".my_tab
"set expandtab
"" allow toggling between local and default mode
"function! TabToggle()
"  if &expandtab
"    set shiftwidth=8
"    set softtabstop=0
"    set noexpandtab
"  else
"    execute "set shiftwidth=".g:my_tab
"    execute "set softtabstop=".g:my_tab
"    set expandtab
"  endif
"endfunction
"nmap <F8> mz:execute TabToggle()<CR>'z
