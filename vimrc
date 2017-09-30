" to reload:
" :source ~/.vimrc
set nocompatible              " required
filetype off
set encoding=utf-8
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"execute pathogen#infect()
map <Space> <Leader>
colorscheme jellybeans
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
set wildmenu            " graphical menu for file matches
set hidden              " let me change buffers even if they have unsaved content.

let loaded_matchparen = 1  " fools vim into thinking that this module is already loaded

set autochdir

"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Misc.                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent entire file.
nnoremap @I :normal gg=G''<CR>
" Open Thunar where I am...
nnoremap <leader>t :! thunar &<CR><CR>.
set tags=tags,../tags,../../tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          External Compiler Commands                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter,BufNew *.tex nnoremap <leader>c :w<CR>:!rubber --synctex --pdf --unsafe %<CR>
au BufEnter,BufNew *.py   nnoremap <leader>c :w<CR>:!python %<CR>
au BufEnter,BufNew *.mkd nnoremap <leader>c :w<CR>:!pandoc % > %:r.html<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           External Viewer Commands                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter,BufNew *.tex nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>.
au BufEnter,BufNew *.py   nnoremap <leader>v :!zathura plot_working.pdf &<CR><CR>.
"au BufEnter,BufNew *.mkd nnoremap <leader>v :!chromium --user-data-dir=/home/equant/.config/chromium/vim_profile %:r.html &<CR><CR>.
au BufEnter,BufNew *.mkd nnoremap <leader>v :!chromium --user-data-dir=/home/equant/.config/chromium/vim_profile --app=%:r.html &<CR><CR>.
" I am using the firefox add-on "Markdown Viewer by Thiht to make the following work:
au BufEnter,BufNew *.md nnoremap <leader>v :!firefox -new-window % &<CR><CR>.

"map <C-enter> :call Synctex()<cr>
map <leader>z :execute "!zathura --synctex-forward " . line(".") . ":" . col(".") . ":" . bufname('%') . " " . expand("%:r") . ".pdf"<CR><CR>

" gf on a pdf opens zathura
" http://stackoverflow.com/questions/7810845/how-to-open-pdf-files-under-cursor-using-gf-with-external-pdf-readers-in-vim
au BufReadCmd *.pdf silent !/usr/bin/zathura % & 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Worklog Tools                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime('%c')<cr>
"nmap <leader>w i## TITLE<esc>:r!pwd<CR>I## xdate<esc>$o<CR>1.<esc>?TITLE<CR>
"nmap <leader>w i## WorklogEntry<CR>#### xdate<esc>$o<CR>1.<esc>?WorklogEntry<CR>cw

"Tim's original...
"map <leader>w :silent! badd WORKLOG.md<CR>:b WORKLOG.md<CR>G:r!date<CR>GA 
map <leader>w :silent! badd ~/research/current/WORKLOG.md<CR>:b ~/research/current/WORKLOG.md<CR>GA<CR>#### xdate<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Buffer Navigation                               "
" - I use buftabline.vim                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>d :bd<CR>
"nnoremap <leader>t :tab all<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

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

