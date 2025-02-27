-- Basic Neovim settings

local opt = vim.opt

-- UI settings
opt.number = true                -- Show line numbers
opt.relativenumber = false       -- Disable relative line numbers
opt.wrap = false                 -- Disable line wrap
opt.termguicolors = true         -- True color support
opt.mouse = "a"                  -- Enable mouse in all modes

-- Editing preferences
opt.tabstop = 2                  -- Number of spaces tabs count for
opt.shiftwidth = 2               -- Size of an indent
opt.expandtab = true             -- Use spaces instead of tabs
opt.smartindent = true           -- Insert indents automatically

-- Search settings
opt.ignorecase = true            -- Ignore case when searching
opt.smartcase = true             -- Don't ignore case with capitals

-- System interaction
opt.clipboard = "unnamedplus"    -- Use system clipboard

-- File handling
opt.backup = false               -- No backup files
opt.swapfile = false             -- No swap files
opt.undofile = true              -- Persistent undo

-- Performance
opt.updatetime = 250             -- Faster completion

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "