" to reload:
" " :source ~/.vimrc
set nocompatible              " required
execute pathogen#infect()
"filetype off

colorscheme badwolf
syntax enable
set tabstop=4
set shiftwidth=4
"set softtabstop=4
set expandtab
filetype indent on
"set cursorline          " draws a horizontal line on the line your cursor is currently on
set wildmenu            " graphical menu for file matches
set hidden              " let me change buffers even if they have unsaved content.

let loaded_matchparen = 1  " fools vim into thinking that this module is already loaded

" Doesn't work in .vimrc
"NoMatchParen            " To turn it on... :DoMatchParen

"filetype plugin indent on
"set cindent
"set smartindent
"set shiftwidth=4

"set incsearch

"nnoremap <leader>c :w<CR>:!latexmk -pdf %<CR>
"nnoremap <leader>p :w<CR>:!python %<CR>
"nnoremap <leader>c :w<CR>:!rubber --pdf --unsafe %<CR>
"nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>
"nnoremap <leader>v :!zathura plot_working.pdf &<CR><CR>
nnoremap @I :normal gg=G<CR>

"au BufEnter,BufNew *.py  nnoremap <leader>v :rubyf % <CR>.
au BufEnter,BufNew *.tex nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>.
au BufEnter,BufNew *.py  nnoremap <leader>v :!zathura plot_working.pdf &<CR><CR>.

au BufEnter,BufNew *.tex nnoremap <leader>c :w<CR>:!rubber --pdf --unsafe %<CR>
au BufEnter,BufNew *.py  nnoremap <leader>c :w<CR>:!python %<CR>

"open each buffer in its own tabpage
":au BufAdd,BufNewFile * nested tab sball

iab xdate <c-r>=strftime('%c')<cr>
map <Space> <Leader>
nmap <leader>w i# xdate<esc>:r!pwd<CR>I## <esc>$o<CR>1. 
nnoremap <leader>] gt
nnoremap <leader>[ gT
nnoremap <leader>d :bd<CR>
nnoremap <leader>t :tab all<CR>
"nmap <leader>t :bufdo tab split<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
