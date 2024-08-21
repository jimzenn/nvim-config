
" ntpeters/vim-better-whitespace {{{

let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" }}}

" bling/vim-airline {{{

" Always show the status line
set laststatus=2

" Use symbols for airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'night_owl'
let g:airline_skip_empty_sections = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.dirty = '+'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V-',
    \ '' : 'V⌷',
    \ 's'  : 's',
    \ 'S'  : 'S',
    \ '' : '^S',
    \ }

let g:airline_section_z = '(%l,%c) | %L'

let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" }}}

" mhinz/vim-signify {{{

let g:signify_line_highlight = 1

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '⌅'
let g:signify_sign_change            = '~'
let g:signify_sign_changedelete      = '≃'


hi SignifyLineAdd             guifg=NONE  ctermfg=NONE  guibg=#1d3934  ctermbg=114
hi SignifyLineChange          guifg=NONE  ctermfg=NONE  guibg=#12283b  ctermbg=024
hi SignifyLineDelete          guifg=NONE  ctermfg=NONE  guibg=#2c1c25  ctermbg=203
hi SignifyLineChangeDelete    guifg=NONE  ctermfg=NONE  guibg=#282849  ctermbg=134
hi SignifyLineDeleteFirstLine guifg=NONE  ctermfg=NONE  guibg=#12283b  ctermbg=024

nmap <leader>hn <Plug>(signify-next-hunk)
nmap <leader>hN <Plug>(signify-prev-hunk)

nnoremap <leader>hu :SignifyHunkUndo<cr>
nnoremap <leader>hd :SignifyDiff<CR>
nnoremap <silent> <leader>gh :SignifyToggleHighlight<CR>

" }}}

