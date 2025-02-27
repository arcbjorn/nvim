-- Main Neovim configuration entry point

-- Load helper functions first (needed by other modules)
require('utils')

-- Load basic settings
require('options')

-- Load keymappings
require('keymaps')

-- Load and initialize plugins
require('plugins')

-- Plugin configurations in the plugin/ directory are loaded automatically
-- No need to explicitly require them here