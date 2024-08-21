" packer.nvim {{{

lua << EOF
require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  -- VCS
  use 'mhinz/vim-signify'

  -- Bars, panels, and files
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
      -- If you want icons for diagnostic errors, you'll need to define them somewhere:
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})

      require("neo-tree").setup({
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = "+",
              modified  = "~",
              deleted   = "-",
              renamed   = "R",
              -- Status type
              untracked = "*",
              ignored   = "_",
              unstaged  = "x",
              staged    = "+",
              conflict  = "!",
            }
          },
        }
      })
    end
  }
  use 'bling/vim-airline'

  -- Text manipulation
  use 'ntpeters/vim-better-whitespace'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use 'honza/vim-snippets'

  -- Highlighting
  use {'uarun/vim-protobuf', ft = 'proto'} -- Note the 'ft' key for filetype-specific plugins

  -- Markdown
  use {'vim-pandoc/vim-pandoc', ft = {'markdown', 'pandoc'}}
  use {'vim-pandoc/vim-pandoc-syntax', ft = {'markdown', 'pandoc'}}
  use {'tpope/vim-markdown', ft = {'markdown', 'pandoc'}}

  -- Colorscheme
  use 'haishanh/night-owl.vim'
  use 'vim-airline/vim-airline-themes'

end)
EOF

" }}}

" General {{{

" Specifies the path to the Python 3 interpreter for plugins that require Python
let g:python3_host_prog = '/usr/bin/python3'

set lazyredraw          " Redraw only when necessary to improve performance

set history=700          " Set command history length
set autoread            " Automatically reload file if changed outside of Neovim
set wrap                " Enable line wrapping
set scrolloff=7         " Keep 7 lines visible above/below the cursor
set cursorline          " Highlight the current line
set ruler               " Show the cursor position
set number              " Show line numbers
set cmdheight=1         " Height of the command bar
set showmatch           " Highlight matching [{()}]
set mat=2               " Delay in tenths of a second to show the matching [{()}]
set colorcolumn=81      " Highlight column 81 for line length marking
set textwidth=80        " Set max text width for automatic line breaking

" Indentation
set expandtab           " Convert tabs to spaces
set smarttab            " Smart tab behavior based on 'shiftwidth'
set shiftwidth=2        " Number of spaces to use for each step of (auto)indent
set tabstop=2           " Number of spaces that a tab counts for
set ai                  " Auto-indent new lines
set si                  " Smart indent for new lines

" Backup and swap files
set nobackup            " Don't create backup files
set nowritebackup       " Don't create a backup before overwriting a file
set noswapfile          " Don't create swap files

" Theme
set background=dark     " Use a dark background
set termguicolors       " Enable true color support
syntax enable           " Enable syntax highlighting
colorscheme night-owl   " Set the color scheme
highlight Comment cterm=italic gui=italic " Make comments italic

" Leader Key Configuration
let g:mapleader = get(g:, 'mapleader', ';') " Set leader key to ';' if not set
set timeoutlen=1500     " Leader key timeout length in milliseconds
noremap ,, ,            " Map double ',' to single ',' for normal use

" Mouse and Search
set mouse=a             " Enable mouse support in all modes

" Search
set ignorecase          " Ignore case in search patterns
set smartcase           " Override 'ignorecase' when search pattern contains upper case
set hlsearch            " Highlight search results
set incsearch           " Show incremental search results

" Visual Appearance
set list                " Show invisible characters
set listchars=tab:▏\ ,trail:· " Set characters for tab and trailing spaces
set backspace=eol,start,indent " Make backspace key more powerful
set whichwrap+=<,>,h,l  " Allow <, >, h, and l to move the cursor to the next line
set noerrorbells        " Disable error bells (no beep/flash)

" External Tools and Formatting
set formatprg=par       " Use 'par' for formatting text
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|' " Configuration for 'par' tool

" Enhanced Command-Line Completion
set wildmenu            " Enable 'wildmenu' for visual command-line completions
set wildmode=list:longest,full " Define behavior of command-line completion

" Tag Navigation Configuration
set tags=tags;/         " Set the path for searching tag files, search upwards from current directory


" Folding
set foldmethod=indent  " Sets the method for code folding to 'indent' (indentation levels create folds)
set foldnestmax=5  " Limits the maximum depth of folds for better readability
set foldlevelstart=99  " Starts with all folds open (99 means very deep nesting before folding happens)
set foldcolumn=0  " Hides the fold column (0 width)

" Group for custom folding behavior
augroup rcFold
  autocmd!
  autocmd FileType vim,zsh set foldmethod=marker
  autocmd FileType vim,zsh set foldlevel=0
augroup END

" Disable Ex Mode
nnoremap Q <nop>

" Change cursor shape between insert and normal mode in iTerm.app
let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
let &t_SR = "\<esc>]50;CursorShape=2\x7" " Underline in replace mode

" Force redraw
map <silent> <leader>R :redraw!<CR>

" }}}

" Copy and clipboard {{{

" Allows Vim to use the system clipboard for copy/paste operations

" Requires X11 Forwarding
set clipboard+=unnamedplus

" }}}

" Actions {{{

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Remap jj to escape
ino jj <esc>
cno jj <c-c>

nnoremap <silent> <leader>" :sp<CR>
nnoremap <silent> <leader>% :vsp<CR>

" Return to last edit position when opening files
augroup last_edit
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                      \ | exe "normal! g`\""
                      \ | endif
augroup END

" Remember info about open buffers on close
set viminfo^=%

function! QuitIfLastBuffer()
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val) && !empty(bufname(v:val))')) == 0
        quit
    endif
endfunction

nmap <silent> ZZ :w<bar>bd <bar> :call QuitIfLastBuffer()<CR>
nmap <silent> ZQ :bd! <bar> :call QuitIfLastBuffer()<CR>

" }}}

source plugin_configs.vim
