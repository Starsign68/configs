echo("| 2021/06/19 | Starsign68 |") 
nnoremap <space> <nop> | let mapleader = " " 
let g:netrw_banner = 0 
let g:netrw_liststyle = 0 
set termencoding=utf-8 
let g:currentmode = { 'n': ['NORMAL','NRM'], 'no': ['N-OP-PEND','NRM'], 'v': ['VISUAL','VIS'], 'V': ['V-LINE','VIS'], '': ['V-BLOCK','VIS'], 's': ['SELECT','OTR'], 'S': ['S-LINE','OTR'], '': ['S-BLOCK','OTR'], 'i': ['INSERT','INS'], 'R': ['REPLACE','INS'], 'Rv': ['V-REPLACE','OTR'], 'c': ['COMMAND','OTR'], 'cv': ['VIM EX','OTR'], 'ce': ['EX','OTR'], 'r': ['PROMPT','OTR'], 'rm': ['MORE','OTR'], 'r?': ['CONFIRM','OTR'], '!': ['SHELL','OTR'], 't': ['TERMINAL','OTR']} 
function! Modetheme(group) 
if g:currentmode[mode()][1]==a:group 
let g:colthm = g:currentmode[mode()][0]  
let g:limeModes = g:colthm 
return "[".g:limeModes."]" 
else 
return ''
endif 
endfunction 
set showtabline=2 
set tabline=%1*\ [%Y]\ %t%1* 
set statusline=%1*                              " Init.
set statusline+=%3*%{(Modetheme('NRM'))}        " Color
set statusline+=%7*%{(Modetheme('VIS'))}        " Color 
set statusline+=%5*%{(Modetheme('INS'))}        " Color
set statusline+=%1*%{(Modetheme('OTR'))}        " Color 
set statusline+=%1*                             " Color
set statusline+=\                               " Space
set statusline+=%(%m\ %)                        " Modified [+] / [-] flag
set statusline+=%1*                             " Color
set statusline+=%=                              " Right align
set statusline+=%1*   	                        " Color
set statusline+=\                               " Space
set statusline+=[%{strftime(\"%H:%M\")}]\       " Time
set statusline+=[%1.5l:%1.5L]                   " 
set statusline+=%1*\                            " {STATUSLINE_END}}}} {{{{SETTINGS_START} 
filetype plugin indent on                       " Enable filetype-specific settings.
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver15-Cursor,o:hor15-Cursor,
set guicursor+=i-ci:ver11-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,
set guicursor+=sm:block-Cursor/lcursor
set backspace=indent,start,eol                  " Use a normal bacspace, not a deadkey 
set hidden                                      " Hide instead of delete 
set noshowmode                                  " Don't show the mode when status line shows it
set number                                      " Show line numbers
set noshowcmd                                   " Don't show the CMD 
" set wrap linebreak showbreak=\ \|\            " Wrap-broken line prefix Break lines at word 
set nowrap sidescroll=1 sidescrolloff=10        " Do not Break lines
set showmatch                                   " Highlight the matching brace
set visualbell                                  " Use visual bell (no beeping)
set noswapfile                                  " Save some space
set incsearch	                                " Searches for strings incrementally
set shiftwidth=3                                " Number of auto-indent spaces (Y)
" set smartindent                               " Enable smart-indent
set smarttab                                    " Enable smart-tabs
set expandtab                                   " Make Tab key insert (Y) spaces, not a tab
set wildmenu                                    " GOOD COMPLETE {SETTINGS_END}}}} {{{{TRIGGERS_START} 
augroup cline
au!
au WinLeave,InsertEnter * set nocursorline 
au VimEnter,WinEnter,InsertLeave * set cursorline
augroup END
augroup numbertoggle 
autocmd!
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber 
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber 
augroup END 
aug COLOR 
au! 
au ColorScheme,FocusGained * hi StatusLineNC   guifg=bg guibg=#5C6370 gui=reverse,bold 
au ColorScheme,FocusGained * hi StatusLine     guifg=NONE guibg=NONE gui=bold 
au ColorScheme,FocusGained * hi User1          guifg=#2E3440 guibg=#5C6370 gui=bold,standout  
au ColorScheme,FocusGained * hi User2          guifg=#909090 guibg=#C8C8C8 gui=bold 
au ColorScheme,FocusGained * hi User3          guifg=#2E3440 guibg=#AFE805 gui=bold 
au ColorScheme,FocusGained * hi User4          guifg=#ECEFF4 guibg=#8BB804 gui=bold 
au ColorScheme,FocusGained * hi User5          guifg=#2E3440 guibg=#F59C00 gui=bold 
au ColorScheme,FocusGained * hi User6          guifg=#ECEFF4 guibg=#FF6B12 gui=bold 
au ColorScheme,FocusGained * hi User7          guifg=#2E3440 guibg=#3BC8F7 gui=bold 
au ColorScheme,FocusGained * hi User8          guifg=#ECEFF4 guibg=#037499 gui=bold 
aug END                                        " {TRIGGERS_END}}}} {{{{THEME_START} 
syntax on 
set termguicolors 
colorscheme tokyonight 
set background=dark                             " {THEME_END}}}}
iabbrev ddate <C-R>=strftime("[%Y\/%m\/%d]")<CR>
iabbrev {; <C-o>i{<CR>};<Esc>O
nnoremap <silent><F1> :set guifont=:h20<CR>
nnoremap <silent><S-F1> :w \| ! %<CR><CR>
nnoremap <F2> :e $MYVIMRC<CR>
nnoremap <S-F2> :wall<CR> :so $MYVIMRC<CR>
nnoremap <F3> :w<CR> :so %<CR>
nnoremap <S-F3> :wall<CR> :export %<CR>
nnoremap <F4> :set scrollbind!<CR>
nnoremap <S-F4> :set hlsearch!<CR>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap Q @@
vnoremap <leader>Y "*y
nnoremap <nowait><leader>P "*p
nnoremap <nowait><leader>p viw"xp 
nnoremap <leader>y viw"xy 
