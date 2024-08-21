-- Plugins {{{
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mhinz/vim-signify'

    use 'bling/vim-airline'
    use 'ntpeters/vim-better-whitespace'
    use 'tpope/vim-commentary'
    use 'jiangmiao/auto-pairs'
    use 'honza/vim-snippets'

    -- Highlighting
    use {'uarun/vim-protobuf', ft = 'proto'}

    -- Markdown
    use {'vim-pandoc/vim-pandoc', ft = {'markdown', 'pandoc'}}
    use {'vim-pandoc/vim-pandoc-syntax', ft = {'markdown', 'pandoc'}}
    use {'tpope/vim-markdown', ft = {'markdown', 'pandoc'}}

    -- Colorscheme
    use 'haishanh/night-owl.vim'
    use 'vim-airline/vim-airline-themes'
end)
-- }}}

-- General Options {{{
vim.o.lazyredraw = true     -- Redraw only when necessary to improve performance
vim.o.history = 700         -- Set command history length
vim.o.autoread = true       -- Automatically reload file if changed outside of Neovim
vim.o.wrap = true           -- Enable line wrapping
vim.o.scrolloff = 7         -- Keep 7 lines visible above/below the cursor
vim.o.cursorline = true     -- Highlight the current line
vim.o.ruler = true          -- Show the cursor position
vim.o.number = true         -- Show line numbers
vim.o.cmdheight = 1         -- Height of the command bar
vim.o.showmatch = true      -- Highlight matching [{()}]
vim.o.mat = 2               -- Delay in tenths of a second to show the matching [{()}]
vim.o.colorcolumn = '81'    -- Highlight column 81 for line length marking
vim.o.textwidth = 80        -- Set max text width for automatic line breaking

-- Indentation
vim.o.expandtab = true      -- Convert tabs to spaces
vim.o.smarttab = true       -- Smart tab behavior based on 'shiftwidth'
vim.o.shiftwidth = 2        -- Number of spaces to use for each step of (auto)indent
vim.o.tabstop = 2           -- Number of spaces that a tab counts for
vim.o.autoindent = true     -- Auto-indent new lines
vim.o.smartindent = true    -- Smart indent for new lines

-- Backup and swap files
vim.o.backup = false        -- Don't create backup files
vim.o.writebackup = false   -- Don't create a backup before overwriting a file
vim.o.swapfile = false      -- Don't create swap files

-- Theme
vim.o.background = 'dark'   -- Use a dark background
vim.o.termguicolors = true  -- Enable true color support
vim.cmd('syntax enable')    -- Enable syntax highlighting
vim.cmd('colorscheme night-owl') -- Set the color scheme
vim.cmd('highlight Comment cterm=italic gui=italic') -- Make comments italic

-- Leader Key Configuration
vim.g.mapleader = vim.g.mapleader or ';' -- Set leader key to ';' if not set
vim.o.timeoutlen = 1500     -- Leader key timeout length in milliseconds
vim.keymap.set("n", ",,", ",", { silent = true }) -- Map double ',' to single ',' for normal use

-- Mouse and Search
vim.o.mouse = 'a'           -- Enable mouse support in all modes

-- Search
vim.o.ignorecase = true     -- Ignore case in search patterns
vim.o.smartcase = true      -- Override 'ignorecase' when search pattern contains upper case
vim.o.hlsearch = true       -- Highlight search results
vim.o.incsearch = true      -- Show incremental search results

-- Visual Appearance
vim.o.list = true           -- Show invisible characters
vim.o.listchars = 'tab:▏\\ ,trail:·' -- Set characters for tab and trailing spaces
vim.o.backspace = 'eol,start,indent' -- Make backspace key more powerful
vim.o.errorbells = false    -- Disable error bells (no beep/flash)

-- External Tools and Formatting
vim.o.formatprg = 'par'     -- Use 'par' for formatting text
vim.env.PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|' -- Configuration for 'par' tool

-- Enhanced Command-Line Completion
vim.o.wildmenu = true       -- Enable 'wildmenu' for visual command-line completions
vim.o.wildmode = 'list:longest,full' -- Define behavior of command-line completion

-- Tag Navigation Configuration
vim.o.tags = 'tags;/'       -- Set the path for searching tag files, search upwards from current directory

-- Folding
vim.o.foldmethod = 'indent' -- Sets the method for code folding to 'indent' (indentation levels create folds)
vim.o.foldnestmax = 5       -- Limits the maximum depth of folds for better readability
vim.o.foldlevelstart = 99   -- Starts with all folds open (99 means very deep nesting before folding happens)

-- Group for custom folding behavior
vim.api.nvim_create_augroup("rcFold", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "rcFold",
    pattern = { "vim", "zsh" },
    command = "set foldmethod=marker foldlevel=0",
})

-- Disable Ex Mode
vim.keymap.set("n", "Q", "<nop>")

-- Force redraw
vim.keymap.set("n", "<leader>R", ":redraw!<CR>", { silent = true })
-- }}}

-- Copy and clipboard {{{
vim.o.clipboard = 'unnamedplus' -- Allows Vim to use the system clipboard for copy/paste operations (Requires X11 Forwarding)
-- }}}

-- Actions {{{
-- Treat long lines as break lines (useful when moving around in them)
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Remap jj to escape
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("c", "jj", "<C-c>")

vim.keymap.set("n", "<leader>\"", ":sp<CR>", { silent = true })
vim.keymap.set("n", "<leader>%", ":vsp<CR>", { silent = true })

-- Return to last edit position when opening files
vim.api.nvim_create_augroup("last_edit", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = "last_edit",
    callback = function()
        local last_edit_line = vim.fn.line("'\"")
        if last_edit_line > 0 and last_edit_line <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end
})


