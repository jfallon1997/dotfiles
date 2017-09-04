set spell
syntax enable
set number " line numbering
set cursorline
"set lazyredraw "dont redraw as much in macros
set showmatch " Matching parenthesis are highlighted [ ( { } ) ]
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV '[v']
nnoremap gM :w \| ! make
"pathogen package manager
"execute pathogen#infect()
filetype plugin on  " Enables the ftplugin options

"tabs
set tabstop=4
set shiftwidth=4
set smarttab "delete spaces as a tab
set expandtab "make tabs spaces

"macros
let @v='i\vec{la}'
let @m='i$\begin{pmatrix}\end{pmatrix}$O'

" Markdown Section Folding
"function! MarkdownLevel(maxlevel)
"    if a:maxlevel >= 1 && getline(v:lnum) =~ '^# .*$'
"        return ">1"
"    endif
"    if a:maxlevel >= 2 && getline(v:lnum) =~ '^## .*$'
"        return ">2"
"    endif
"    if a:maxlevel >= 3 && getline(v:lnum) =~ '^### .*$'
"        return ">3"
"    endif
"    if a:maxlevel >= 4 && getline(v:lnum) =~ '^#### .*$'
"        return ">4"
"    endif
"    if a:maxlevel >= 5 && getline(v:lnum) =~ '^##### .*$'
"        return ">5"
"    endif
"    if a:maxlevel >= 6 && getline(v:lnum) =~ '^###### .*$'
"        return ">6"
"    endif
"    return "=" 
"endfunction

au BufEnter *.md  setlocal foldexpr=MarkdownLevel(1)  
au BufEnter *.md  setlocal foldmethod=expr     
au BufEnter *.md  setlocal autoindent

function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()

" fix spell highlight
hi SpellBad ctermfg=007 ctermbg=000 cterm=none guifg=#FFFFFF guibg=#000000 gui=none

" backup directory / swap directory
" set backupdir=~/.vim/tmp,./.backup,/tmp,.
" set directory=~/.vim/tmp,./.backup,/tmp,.

" allow quit via single keypress (Q)
map Q :qa<CR>
