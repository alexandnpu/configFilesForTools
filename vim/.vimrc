" for pathogen
call pathogen#infect()
Helptags
syntax on
filetype plugin indent on

set ruler
set t_Co=256
colorscheme desert 
set nu
set nocp
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
%retab
"set autochdir
set ic       "ignore case when searching
"set noic
set backspace=indent,eol,start
set csprg=/emc/zhenga1/bin/cscope/bin/cscope
set incsearch
set laststatus=2
"if exists('+colorcolumn')
  "set colorcolumn=80
"else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

set tags=/emc/zhenga1/build/fc/tags
:cs add  /emc/zhenga1/build/fc/cscope.out
"set tags=/emc/zhenga1/build/spvol/tags
":cs add  /emc/zhenga1/build/spvol/cscope.out
"set tags=/emc/zhenga1/build/mountCursor/tags
":cs add  /emc/zhenga1/build/mountCursor/cscope.out
"set tags=/emc/zhenga1/build/unmount/tags
":cs add  /emc/zhenga1/build/unmount/cscope.out

"fuzzyFinder
map ff <ESC>:FufFile<CR>
map fd <ESC>:FufDir<CR>
let g:FuzzyFinder_IgnoreCase=1
"folding settings
set foldmethod=syntax "fold by indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

map    <F9>             :TagbarToggle<CR>
map    <F10>            :Tlist<CR>
map    <F11>            :MRU<CR>
map    <F12>            :MarkClear<CR>
map    <C-S-N>          :NERDTree<CR>
nmap   <C-M><C-P>       <leader>#
nmap   <C-M><C-N>       <leader>*

let Tlist_Use_Right_Window   = 1
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWindow    = 1
let tlist_cpp_settings       = 'c++;c:class;d:constraints;m:member;f:function'
let tlist_c_settings         = 'c;d:macro;s:structure;u:union;f:function'
let Tlist_WinWidth           = 60
" command-t
let g:CommandTMaxFiles       = 5000
let g:CommandTMaxHeight      = 12
" tagbar
let TagbarAccessProtected    = 1
let g:tagbar_width           = 80
" Mark
let g:mwIgnoreCase           = 0 

highlight MarkWord7 ctermbg=Gray ctermfg=Black guibg=#8CCBEA guifg=Black
highlight MarkWord8 ctermbg=90   ctermfg=Black guibg=#8CCBEA guifg=Black

"let mapleader=","
":autocmd BufEnter * call DoWordComplete()
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
      return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:vbookmark_bookmarkSaveFile = $HOME.'/.vim/bundle/vbookmark/.vimbookmark'

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
