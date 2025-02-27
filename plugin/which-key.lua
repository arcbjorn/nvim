-- Add this to your plugins.lua or create a new file at ~/.config/nvim/plugin/which-key.lua

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Setup which-key with current API
which_key.setup {
  -- Delay before showing the popup. Can be a number or a function
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  -- Filter mappings that should be shown
  filter = function(mapping)
    return true -- Show all mappings
  end,
  -- Use classic preset
  preset = "classic",
  -- Triggers for key sequences
  triggers = {
    { "<auto>", mode = "nxso" }
  },
  -- Start hidden for visual modes
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  -- Plugin configurations
  plugins = {
    marks = true,       -- Shows a list of your marks on ' and `
    registers = true,   -- Shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,  -- Enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- How many suggestions should be shown in the list?
    },
    -- The presets plugin, adds help for a bunch of default keybindings in Neovim
    presets = {
      operators = true,     -- adds help for operators like d, y, ...
      motions = true,       -- adds help for motions
      text_objects = true,  -- help for text objects triggered after entering an operator
      windows = true,       -- default bindings on <c-w>
      nav = true,           -- misc bindings to work with windows
      z = true,             -- bindings for folds, spelling and others prefixed with z
      g = true,             -- bindings for prefixed with g
    },
  },
  -- Window configuration
  win = {
    no_overlap = true,  -- Don't allow the popup to overlap with the cursor
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    bo = {},
    wo = {},
  },
  -- Layout configuration
  layout = {
    width = { min = 20 }, -- min width of the columns
    spacing = 3,         -- spacing between columns
  },
  -- Scrolling keys
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  -- Sorting preferences
  sort = { "local", "order", "group", "alphanum", "mod" },
  -- How many mappings before expanding a group
  expand = 0,
  -- Icon configuration
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    mappings = true,
    rules = {},
    colors = true,
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  -- Disable WhichKey for certain buf types and file types
  disable = {
    ft = {},
    bt = {},
  },
  debug = false, -- enable debugging logs
}

-- Register your mappings using the new format
which_key.add({
  -- Normal mode mappings
  { "<A-1>", "<cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
  { "<A-2>", "<cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
  { "<A-3>", "<cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
  { "<A-4>", "<cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
  { "<A-5>", "<cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
  { "<A-[>", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
  { "<A-]>", "<cmd>BufferNext<CR>", desc = "Next buffer" },
  { "<A-w>", "<cmd>BufferClose<CR>", desc = "Close buffer" },
  { "<A-S-w>", "<cmd>BufferCloseAll<CR>", desc = "Close all buffers" },
  { "<A-Left>", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
  { "<A-Right>", "<cmd>BufferMoveNext<CR>", desc = "Move buffer right" },
  { "<A-S-q>", "<cmd>qall<CR>", desc = "Quit Neovim" },
  
  { "<D-e>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  { "<D-p>", desc = "Find files (Telescope)" },
  { "<D-f>", desc = "Search in current buffer" },
  { "<D-S-f>", desc = "Search in project (grep)" },
  { "<D-\\>", "<cmd>vsplit<CR>", desc = "Split window vertically" },
  { "<D-S-\\>", "<cmd>split<CR>", desc = "Split window horizontally" },
  { "<D-s>", "<cmd>w<CR>", desc = "Save file" },
  { "<D-S-s>", "<cmd>wa<CR>", desc = "Save all files" },
  { "<D-S-p>", desc = "Open command palette" },
  { "<D-/>", desc = "Toggle comment" },
  { "<D-z>", "u", desc = "Undo" },
  { "<D-S-z>", "<C-r>", desc = "Redo" },
  { "<D-.>", desc = "Code actions" },
  
  { "<C-h>", "<C-w>h", desc = "Navigate to left split" },
  { "<C-j>", "<C-w>j", desc = "Navigate to split below" },
  { "<C-k>", "<C-w>k", desc = "Navigate to split above" },
  { "<C-l>", "<C-w>l", desc = "Navigate to right split" },
  
  { "<Esc>", "<cmd>noh<CR>", desc = "Clear search highlighting" },
  
  { "gD", desc = "Go to declaration" },
  { "gd", desc = "Go to definition" },
  { "K", desc = "Show hover documentation" },
  { "gi", desc = "Go to implementation" },
  { "<F2>", desc = "Rename symbol" },
  { "gr", desc = "Show references" },

  -- Insert mode mappings
  { "<D-z>", "<C-O>u", desc = "Undo", mode = "i" },
  { "<D-S-z>", "<C-O><C-r>", desc = "Redo", mode = "i" },

  -- Visual mode mappings
  { "<D-/>", desc = "Toggle comment", mode = "v" },
})

-- Add Vim defaults reference (updated format)
which_key.add({
  -- Navigation group
  { "<leader>vn", group = "Navigation" },
  { "<leader>vnh", desc = "Move cursor left" },
  { "<leader>vnj", desc = "Move cursor down" },
  { "<leader>vnk", desc = "Move cursor up" },
  { "<leader>vnl", desc = "Move cursor right" },
  { "<leader>vnw", desc = "Next word" },
  { "<leader>vnb", desc = "Previous word" },
  { "<leader>vne", desc = "End of word" },
  { "<leader>vn0", desc = "Start of line" },
  { "<leader>vn$", desc = "End of line" },
  { "<leader>vngg", desc = "Go to first line" },
  { "<leader>vnG", desc = "Go to last line" },
  { "<leader>vn{", desc = "Previous paragraph" },
  { "<leader>vn}", desc = "Next paragraph" },
  { "<leader>vn<C-u>", desc = "Half page up" },
  { "<leader>vn<C-d>", desc = "Half page down" },
  { "<leader>vn<C-b>", desc = "Page up" },
  { "<leader>vn<C-f>", desc = "Page down" },
  
  -- Editing group
  { "<leader>ve", group = "Editing" },
  { "<leader>vei", desc = "Insert before cursor" },
  { "<leader>veI", desc = "Insert at start of line" },
  { "<leader>vea", desc = "Insert after cursor" },
  { "<leader>veA", desc = "Insert at end of line" },
  { "<leader>veo", desc = "New line below" },
  { "<leader>veO", desc = "New line above" },
  { "<leader>ver", desc = "Replace character" },
  { "<leader>veR", desc = "Replace mode" },
  { "<leader>vec", desc = "Change operator" },
  { "<leader>ved", desc = "Delete operator" },
  { "<leader>vey", desc = "Yank (copy) operator" },
  { "<leader>vep", desc = "Paste after cursor" },
  { "<leader>veP", desc = "Paste before cursor" },
  
  -- Search group
  { "<leader>vs", group = "Search" },
  { "<leader>vs/", desc = "Search forward" },
  { "<leader>vs?", desc = "Search backward" },
  { "<leader>vsn", desc = "Next search result" },
  { "<leader>vsN", desc = "Previous search result" },
  { "<leader>vs*", desc = "Search word under cursor" },
  { "<leader>vs#", desc = "Search word under cursor backward" },
  
  -- Visual mode group
  { "<leader>vv", group = "Visual mode" },
  { "<leader>vvv", desc = "Visual mode" },
  { "<leader>vvV", desc = "Visual line mode" },
  { "<leader>vv<C-v>", desc = "Visual block mode" },
})

-- Create a shortcut to open WhichKey for any key
vim.api.nvim_set_keymap('n', '<D-k>', '<cmd>WhichKey<CR>', {noremap = true, silent = true})