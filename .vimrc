:set ruler

:filetype on
:filetype plugin on
:syntax enable
:set grepprg=grep\ -nH\ $*
:syntax on
:set title
:set incsearch

"lots of indenting
:set autoindent
:set smartindent
:filetype indent on
:set shiftwidth=2
:set tabstop=2
:set softtabstop=2

"indent everything with one command!
map <C-S-i> mzgg=G`z<CR>

:set expandtab
:set smarttab
:set textwidth=80
"highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

:set number

"Compile with 1 step
set makeprg=./compile
imap <F12> <Esc><F12>
noremap <F12> <Esc>:w<Cr>:make<Cr>
filetype on
au BufNewFile,BufRead *.ums set filetype=ums
