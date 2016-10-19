" to reload:
" :source ~/.vimrc
set nocompatible              " required
execute pathogen#infect()
"filetype off

colorscheme badwolf
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
set wildmenu            " graphical menu for file matches
set hidden              " let me change buffers even if they have unsaved content.

let loaded_matchparen = 1  " fools vim into thinking that this module is already loaded

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Misc.                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent entire file.
nnoremap @I :normal gg=G''<CR>
" Open Thunar where I am...
nnoremap <leader>t :! thunar &<CR><CR>.

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
au BufEnter,BufNew *.mkd nnoremap <leader>v :!chromium --user-data-dir=/home/equant/.config/chromium/vim_profile %:r.html &<CR><CR>.

"map <C-enter> :call Synctex()<cr>
map <leader>z :execute "!zathura --synctex-forward " . line(".") . ":" . col(".") . ":" . bufname('%') . " " . expand("%:r") . ".pdf"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Worklog Tools                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime('%c')<cr>
map <Space> <Leader>
nmap <leader>w i# xdate<esc>:r!pwd<CR>I## <esc>$o<CR>1. 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Buffer Navigation                               "
" - I use buftabline.vim                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>d :bd<CR>
nnoremap <leader>t :tab all<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Comment Boxes                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>b :center 80<cr>0r#<space><esc>40A <esc>d80<bar>r#YppVr#kk.
au BufEnter,BufNew *.tex nnoremap <leader>b :center 80<cr>0r%<space><esc>40A <esc>d80<bar>r%YppVr%kk.
au BufEnter,BufNew *.py nnoremap <leader>b :center 80<cr>0r#<space><esc>40A <esc>d80<bar>r#YppVr#kk.
au BufEnter,BufNew .vimrc nnoremap <leader>b :center 80<cr>0r"<space><esc>40A <esc>d80<bar>r"YppVr"kk.

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               SYNCTEX Testing                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9>   :exec "!szathura %:r.pdf" line('.')  col('.') "% > /dev/null"<cr><cr>
function! Synctex()
    " remove 'silent' for debugging
    execute "!zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
    "execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction

