" for pathogen
call pathogen#infect()
Helptags
syntax on
filetype plugin indent on


" casual settings {{{
set ruler
set t_Co=256
set term=xterm-256color
colorscheme desert 
set nu
set nocp
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cindent
%retab
set nowrap
set ic       "ignore case when searching
set backspace=indent,eol,start
"set csprg=/emc/zhenga1/bin/cscope/bin/cscope
set incsearch
set laststatus=2
" }}}

"folding settings {{{
set foldmethod=syntax "fold by indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1
let c_no_comment_fold = 1
" }}}

" auto commands {{{
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if exists('+colorcolumn')
  set colorcolumn=80
endif

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
      return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" }}}



map    <F8>             :ChooseWin<CR>
map    <F11>            :MRU<CR>




" CtrlP {{{
map ff <ESC>:CtrlP .<CR>
map fm <ESC>:CtrlPMRU .<CR>
map fb <ESC>:CtrlPBuffer<CR>
let g:ctrlp_use_caching = 1
let g:ctrlp_user_command = 'find -L %s -type f | grep -v -P "\.o$|\.so$|\.exe$"'       " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
let g:ctrlp_max_files = 0  " no limit
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" }}}

" easymotion {{{
map <S-W>   <leader><leader>w
map <S-B>   <leader><leader>b
map <C-l>   <Plug>(easymotion-lineforward)
map <C-j>   <Plug>(easymotion-j)
map <C-k>   <Plug>(easymotion-k)
map <C-h>   <Plug>(easymotion-linebackward)

" }}}

" taglist {{{
map    <F10>            :Tlist<CR>

let Tlist_Use_Right_Window   = 1
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWindow    = 1
let tlist_cpp_settings       = 'c++;c:class;d:constraints;m:member;f:function'
let tlist_c_settings         = 'c;d:macro;s:structure;u:union;f:function'
let Tlist_WinWidth           = 60
" }}}

" tagbar {{{
map    <F9>             :TagbarToggle<CR>

let TagbarAccessProtected    = 1
let g:tagbar_width           = 50
" }}}

" Mark {{{
map    <F12>            :MarkClear<CR>
nmap   <C-M><C-P>       <leader>#
nmap   <C-M><C-N>       <leader>*
let g:mwIgnoreCase           = 0 

highlight  MarkWord7   ctermbg=Gray  ctermfg=Black
highlight  MarkWord8   ctermbg=93    ctermfg=Black
highlight  MarkWord9   ctermbg=94    ctermfg=Black
highlight  MarkWord10  ctermbg=166   ctermfg=Black
" }}}

" locate {{{
let g:locate_global          = 0
let g:locate_focus           = 0
"let g:locate_jump_to         = 'stay'
" }}}

" airline {{{
let g:airline_detect_whitespace = 0
" }}}

" bookmark {{{
let g:vbookmark_bookmarkSaveFile = $HOME.'/.vim/bundle/vbookmark/.vimbookmark'
" }}}




"set tags=/emc/zhenga1/wspaces/kh1/sade/src/dart/tags
":cs add  /emc/zhenga1/wspaces/kh1/sade/src/dart/cscope.out
set tags=/emc/zhenga1/codeRepo/ngfs/tags
:cs add  /emc/zhenga1/codeRepo/ngfs/cscope.out
"set tags=/emc/zhenga1/codeRepo/apps/tags
":cs add  /emc/zhenga1/codeRepo/apps/cscope.out
"set tags=/emc/zhenga1/codeRepo/autoShrink/tags
":cs add  /emc/zhenga1/codeRepo/autoShrink/cscope.out


