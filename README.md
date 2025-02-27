# Complete Neovim Setup Guide with VSCode-like Experience

This guide will walk you through installing Neovim and setting up a VSCode-like configuration with Command key support on macOS.

## 1. Directory Structure

We'll use the following structure to organize our configuration:

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/                     # Core configuration files
│   ├── options.lua          # Basic settings
│   ├── keymaps.lua          # Key mappings
│   ├── plugins.lua          # Plugin declarations
│   └── utils.lua            # Helper functions
└── plugin/                  # Plugin-specific configurations
    ├── ui.lua               # UI-related plugins
    ├── lsp.lua              # Language server settings
    ├── completion.lua       # Autocompletion setup
    ├── treesitter.lua       # Syntax highlighting
    ├── telescope.lua        # Fuzzy finder
    ├── gitsigns.lua         # Git integration
    ├── neogit.lua           # Git UI
    ├── diffview.lua         # Git Diff view
    ├── which-key.lua        # Keymaps helper
    └── barbar.lua           # Tab management
```

## 2. Installing Neovim

```bash
brew install neovim

pacman -S neovim
```

## 3. Prerequisites

Install required dependencies:

```bash
# Ripgrep (for Telescope fuzzy finder)
brew install ripgrep

# Node.js (for LSP servers)
brew install node

# Python (for LSP servers)
brew install python

# Git (for plugin management)
brew install git

# Nerd Font (for icons)
brew install font-hack-nerd-font
```

## 4. Configuration Structure

Create the directory structure:

```bash
# Create main folder
mkdir -p ~/.config/nvim

# Create lua folder for core settings
mkdir -p ~/.config/nvim/lua

# Create plugin folder for plugin-specific configs
mkdir -p ~/.config/nvim/plugin
```

## 5. Configuration files

### Main Entry Point: init.lua

### Core Configuration Files

- utils.lua
- options.lua
- keymaps.lua
- plugins.lua

### Plugin-Specific Configuration Files

- UI Configuration: ui.lua
- LSP Configuration: lsp.lua
- Completion Configuration: completion.lua
- Treesitter Configuration: treesitter.lua
- Telescope Configuration: telescope.lua
- Git Integration: gitsigns.lua
- Tab Management: barbar.lua

## 6. Installing Language Servers

Install the necessary language servers:


```bash
### TypeScript/JavaScript
npm install -g typescript-language-server typescript

### Python
pip install pyright

### Lua
brew install lua-language-server

### Go
go install golang.org/x/tools/gopls@latest

### Zig
# Clone repo
git clone https://github.com/zigtools/zls
cd zls

# Build zls
zig build -Drelease-safe

### Elixir
# Create directory
mkdir -p ~/.local/share/elixir-ls

# Clone and build
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.local/share/elixir-ls
cd ~/.local/share/elixir-ls
mix deps.get && mix compile && mix elixir_ls.release
```

## 7. Starting Neovim and Installing Plugins

```bash
nvim

:PackerSync

:qa
nvim
```

## 8. Troubleshooting


```
:checkhealth

:messages
```

### Plugin-specific issues

If a specific plugin is causing issues, you can view its configuration file in `~/.config/nvim/plugin/` and make necessary adjustments.

## 9. Customizing Further

To add more plugins:
1. Update `~/.config/nvim/lua/plugins.lua` to include the new plugin
2. Create a configuration file in `~/.config/nvim/plugin/` if needed
3. Run `:PackerSync` to install

To modify keybindings:
1. Edit `~/.config/nvim/lua/keymaps.lua`

## 10. Notes

- MacOS: If using Ghosty terminal, Command key works natively with `<D-key>` mappings
- Ghostty terminal
    - theme = GruvboxDarkHard
    - macos-option-as-alt = true
