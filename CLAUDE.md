# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using Lua, managed with lazy.nvim plugin manager. The configuration is designed to provide a JetBrains IDE-like experience.

## Architecture

```
init.lua                          # Entry point: loads core and lazy
lua/nvegater/
├── init.lua                      # Shared plugins (plenary, vim-tmux-navigator)
├── lazy.lua                      # lazy.nvim bootstrap and plugin loading
├── core/
│   ├── init.lua                  # Loads keymaps and options
│   ├── keymaps.lua               # Global keybindings
│   └── options.lua               # Neovim options (tabs=2 spaces, relative numbers)
└── plugins/
    ├── init.lua                  # Shared plugin dependencies
    ├── lsp/
    │   ├── lspconfig.lua         # LSP setup, keymaps, and server list
    │   └── mason.lua             # Mason package manager config
    └── *.lua                     # Individual plugin configs (one per file)
after/lsp/
└── *.lua                         # Server-specific LSP configurations
```

## Key Patterns

**Plugin Configuration**: Each plugin has its own file in `lua/nvegater/plugins/`. lazy.nvim auto-imports from `nvegater.plugins` and `nvegater.plugins.lsp`.

**LSP Configuration**: Servers are enabled in `lspconfig.lua:96-108`. Server-specific settings go in `after/lsp/<server_name>.lua`.

**Keybindings**: Global keymaps in `core/keymaps.lua`. LSP keymaps are buffer-local, defined in the `LspAttach` autocmd in `lspconfig.lua`.

## Important Settings

- **Leader key**: Space
- **Colorscheme**: Kanagawa (Dragon variant)
- **Tab width**: 2 spaces
- **Auto-format on save**: Enabled via Conform.nvim

## LSP Servers

Enabled servers: ts_ls, html, cssls, tailwindcss, svelte, lua_ls, graphql, emmet_ls, prismals, pyright, gopls

## Adding a New Plugin

1. Create `lua/nvegater/plugins/<plugin-name>.lua`
2. Return a lazy.nvim plugin spec table
3. The plugin is auto-loaded (no imports needed)

## Adding a New LSP Server

1. Add server name to the list in `lua/nvegater/plugins/lsp/lspconfig.lua`
2. Add server to mason ensure_installed list in `lua/nvegater/plugins/lsp/mason.lua`
3. Optionally create `after/lsp/<server_name>.lua` for custom settings
