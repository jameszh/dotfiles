set nocompatible

call pathogen#infect()
call pathogen#helptags()

let mapleader = ","
syntax enable
"set foldmethod=syntax
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab

nnoremap <leader>ev :vs $MYVIMRC<CR>
inoremap <C-l> <space>=><space>
map <leader>p :Hammer<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>rs :!clear;rspec --color spec<CR>
nnoremap <leader>m :NERDTreeToggle<CR>
nnoremap <leader>gs :Gstatus<CR>

set smartcase
set gdefault
set incsearch
set showmatch

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:▸\ ,eol:¬
set guifont=Menlo:h12
set guioptions=aAc
set guioptions-=Be
set number
set noswapfile
set visualbell

" match ErrorMsg '\%>80v.\+'
set cc=80

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set background=dark
colorscheme solarized

".ru files are Ruby.
au BufRead,BufNewFile *.ru setfiletype ruby

".feature files are Cucumber.
au Bufread,BufNewFile *.feature set filetype=gherkin
au! Syntax gherkin source ~/.vim/syntax/cucumber.vim

" Previewheight for Fugitive's status window
set previewheight=20

" Statusline {{{
" ----------------------------------------------------------------------------------------------------
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

" }}}

set laststatus=2
