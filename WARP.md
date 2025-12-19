# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a comprehensive Neovim configuration designed to provide a JetBrains IDE-like development experience. The configuration uses Lazy.nvim as the plugin manager and follows a modular architecture for maintainability.

## Architecture

### Configuration Entry Point
The configuration loads in the following order:
1. `init.lua` - Entry point that loads core and lazy
2. `lua/nvegater/core/` - Core Neovim settings (options, keymaps)
3. `lua/nvegater/lazy.lua` - Lazy.nvim setup that imports plugins
4. `lua/nvegater/plugins/` - Individual plugin configurations
5. `after/lsp/` - Language server-specific configurations (optional per-server overrides)

### Module Structure
- **Core modules** (`lua/nvegater/core/`): Basic Neovim configuration
  - `options.lua` - Neovim options (line numbers, tabs, clipboard, etc.)
  - `keymaps.lua` - General keybindings (window management, tabs, editing)
  - `init.lua` - Core initialization
  
- **Plugin system** (`lua/nvegater/plugins/`):
  - Each plugin has its own file that returns a Lazy.nvim plugin specification
  - `init.lua` - Imports basic utility plugins (plenary, vim-tmux-navigator)
  - `lsp/` subdirectory contains LSP-related plugins (mason, lspconfig)
  - Plugins are lazy-loaded using Lazy.nvim events and dependencies

- **LSP overrides** (`after/lsp/`):
  - Optional per-language-server configurations
  - Currently configured: `emmet_ls.lua`, `graphql.lua`, `lua_ls.lua`, `svelte.lua`
  - These files run after the main LSP setup to provide server-specific settings

### LSP Architecture
The configuration uses a modern LSP setup pattern:
1. Mason installs and manages LSP servers, formatters, and linters
2. `lspconfig.lua` sets up an `LspAttach` autocmd for buffer-local keymaps
3. All servers are enabled via `vim.lsp.enable()` with shared capabilities
4. Server-specific configs go in `after/lsp/<server>.lua` (optional)

### Key Architectural Decisions
- **Leader key**: `<Space>` - All custom keybindings use this prefix
- **Lazy loading**: Plugins load on specific events (BufReadPre, BufNewFile, etc.)
- **Shared LSP capabilities**: All LSP servers use the same capabilities from cmp-nvim-lsp
- **Modular plugin configs**: Each plugin configuration is self-contained in its own file

## Common Commands

### Plugin Management
```bash
# Open Lazy.nvim UI to manage plugins
nvim
# Then inside Neovim: :Lazy

# Update all plugins
# Inside Neovim: :Lazy update

# Check plugin health
# Inside Neovim: :checkhealth
```

### LSP and Tools
```bash
# Open Mason UI to manage LSP servers, formatters, linters
# Inside Neovim: :Mason

# Check LSP status
# Inside Neovim: :LspInfo

# Restart LSP server (if having issues)
# Inside Neovim: :LspRestart
# Or use keymap: <leader>rs
```

### Configuration Management
```bash
# Edit configuration files (when in the nvim config directory)
# Use Telescope to find files: <leader>ff

# Reload configuration after changes
# Restart Neovim, or for specific modules:
# :lua require('nvegater.core.keymaps')
```

## Development Notes

### Adding a New Plugin
1. Create a new file in `lua/nvegater/plugins/<plugin-name>.lua`
2. Return a Lazy.nvim plugin spec with config/setup
3. Lazy.nvim will automatically load it (imports from `lua/nvegater/plugins/`)
4. For LSP plugins, place them in `lua/nvegater/plugins/lsp/`

### Adding a New LSP Server
1. Add server name to `ensure_installed` in `lua/nvegater/plugins/lsp/mason.lua`
2. Add server name to `vim.lsp.enable()` in `lua/nvegater/plugins/lsp/lspconfig.lua`
3. Optionally create `after/lsp/<server>.lua` for server-specific configuration
4. Run `:Mason` to install the server

### Adding Formatters/Linters
- **Formatters**: Add to `ensure_installed` in `mason.lua` and configure in `lua/nvegater/plugins/formatting.lua`
- **Linters**: Add to `ensure_installed` in `mason.lua` and configure in `lua/nvegater/plugins/linting.lua`

### Keybinding Conventions
- General keybindings: `lua/nvegater/core/keymaps.lua`
- LSP keybindings: `lua/nvegater/plugins/lsp/lspconfig.lua` (buffer-local, set on LspAttach)
- Plugin-specific keybindings: Within each plugin's config file
- Function key mappings use shifted variants (F13-F24 = Shift+F1-F12)
  - `<F18>` = Shift+F6 (Rename)
  - `<F14>` = Shift+F2 (Previous diagnostic)
  - `<F2>` = Next diagnostic

### Configuration Options
- **Tab width**: 2 spaces (can be changed in `options.lua`)
- **Leader key**: `<Space>` (set in `keymaps.lua`)
- **Colorscheme**: Kanagawa Dragon variant (darkest)
- **Line numbers**: Relative numbers enabled
- **Auto-format on save**: Enabled via Conform.nvim
- **System clipboard**: Integrated (yank/paste use system clipboard)

## Installed Language Support

### LSP Servers
- TypeScript/JavaScript: `ts_ls`
- HTML: `html`
- CSS: `cssls`
- Tailwind CSS: `tailwindcss`
- Svelte: `svelte`
- Lua: `lua_ls`
- GraphQL: `graphql`
- Emmet: `emmet_ls`
- Prisma: `prismals`
- Python: `pyright`
- Go: `gopls`

### Formatters
- JavaScript/TypeScript/React/CSS/HTML/JSON/YAML/Markdown: `prettier`
- Lua: `stylua`
- Python: `isort` + `black`

### Linters
- JavaScript/TypeScript/React: `eslint_d`
- Python: `pylint`

## Plugin Ecosystem

### Critical Plugins for Workflow
- **Telescope**: Fuzzy finding (files, grep, LSP symbols) - central to navigation
- **nvim-tree**: File explorer sidebar
- **Neogit + Gitsigns + Diffview**: Complete Git workflow integration
- **Trouble**: Diagnostics and quickfix list viewer
- **nvim-cmp + LuaSnip**: Autocompletion with snippets
- **Conform + nvim-lint**: Formatting and linting framework

### Important Plugin Interactions
- **Telescope + LSP**: LSP results (definitions, references) open in Telescope picker
- **Treesitter + Comment.nvim**: Context-aware commenting based on syntax
- **nvim-cmp + LSP**: LSP completion sources integrated into completion menu
- **Gitsigns + Neogit**: Git hunks shown inline, managed through Neogit
- **auto-session**: Sessions auto-save per directory for quick project switching

## Special Features

### JetBrains-Like Experience
This configuration specifically mimics JetBrains IDE workflows. Key mappings documented in README.md match IntelliJ/WebStorm shortcuts where possible. Notable mappings:
- `<leader>ff` = Cmd+Shift+N (Find file)
- `gd` = Cmd+B (Go to definition)
- `<F18>` (Shift+F6) = Rename refactoring
- `<leader>ca` = Alt+Enter (Code actions)

### Session Management
Sessions auto-save using auto-session. When reopening a directory in Neovim, the previous session (open files, splits, tabs) is automatically restored.

### Tmux Integration
The `vim-tmux-navigator` plugin allows seamless navigation between Neovim splits and tmux panes using Ctrl+h/j/k/l. No special commands needed.

### Which-key Helper
Press `<Space>` (leader key) and wait ~500ms to see a popup showing all available keybindings starting with leader. Useful for discovering commands.
