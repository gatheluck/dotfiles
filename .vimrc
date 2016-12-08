if &compatible
    set nocompatible
endif

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" dein settings {{{
" auto install of dein itself
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" plugins and cache
"let s:toml_file = fnamemodify(expand('<sfile>'), ':h') . '/.cache/dein.toml'
let s:toml_file = fnamemodify(expand('<sfile>'), ':h') . '/.dein.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
    call dein#load_toml(s:toml_file)
    call dein#end()
    call dein#save_state()
endif

" auto install of plugins
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on
" }}}

" key bind
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR> 
\                  :tabedit $MYGVIMRC<CR>   " edit vimrc and gvimrc
nnoremap <F6> :<C-u>source $MYVIMRC<CR>     
\                  :source $MYGVIMRC<CR>    " reload vimrc and gvimrc


