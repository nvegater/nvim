# Neovim Configuration

A comprehensive Neovim configuration designed to provide a JetBrains IDE-like development experience while leveraging Neovim's powerful modal editing capabilities and unique features.

## Overview

- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim)
- **Colorscheme**: [Kanagawa](https://github.com/rebelot/kanagawa.nvim) (Dragon variant - darkest theme)
- **Leader Key**: `<Space>`
- **Language Servers**: Configured via Mason.nvim and nvim-lspconfig
- **Auto-formatting**: Enabled on save via Conform.nvim

## JetBrains Feature Mapping

This table maps JetBrains IDE features to their Neovim equivalents:

| JetBrains Feature | Plugin/Feature | Neovim Shortcut |
|---|---|---|
| **Navigation** |||
| Find File (`Cmd+Shift+N`) | Telescope | `<leader>ff` |
| Find in Files (`Cmd+Shift+F`) | Telescope live_grep | `<leader>fs`, `<leader>fg` |
| Find Word Under Cursor | Telescope grep_string | `<leader>fc` |
| Recent Files (`Cmd+E`) | Telescope oldfiles | `<leader>fr` |
| Go to Definition (`Cmd+B`) | LSP | `gd` |
| Go to Declaration | LSP | `gD` |
| Go to Implementation (`Cmd+Alt+B`) | LSP | `gi` |
| Go to Type Definition | LSP | `gt` |
| Find Usages (`Alt+F7`) | LSP references | `gR` |
| Show Documentation (`F1`) | LSP hover | `K` |
| Rename (`Shift+F6`) | LSP rename | `<Shift+F6>` (F18) |
| Code Actions (`Alt+Enter`) | LSP | `<leader>ca` |
| Next Error (`F2`) | LSP diagnostics | `<F2>` |
| Previous Error (`Shift+F2`) | LSP diagnostics | `<Shift+F2>` (F14) |
| **Git** |||
| Git Tool Window | Neogit | `<leader>gs` |
| Commit (`Cmd+K`) | Neogit | `<leader>gc` |
| Pull | Neogit | `<leader>gpl` |
| Push (`Cmd+Shift+K`) | Neogit | `<leader>gps` |
| Diff View | Diffview | `<leader>gd` |
| Close Diff View | Diffview | `<leader>gD` |
| File History | Diffview | `<leader>gh` |
| Current File History | Diffview | `<leader>gH` |
| Git Blame | Gitsigns | `<leader>hb` (full), `<leader>hB` (toggle) |
| Next Change | Gitsigns | `<S-C-M-Down>` |
| Previous Change | Gitsigns | `<S-C-M-Up>` |
| Stage Hunk | Gitsigns | `<leader>hs` |
| Reset Hunk | Gitsigns | `<leader>hr` |
| Stage Buffer | Gitsigns | `<leader>hS` |
| Reset Buffer | Gitsigns | `<leader>hR` |
| Preview Hunk | Gitsigns | `<leader>hp` |
| **File Explorer** |||
| Project Tool Window (`Cmd+1`) | NvimTree | `<leader>ee` |
| Locate File in Tree | NvimTree | `<leader>ef` |
| Collapse Explorer | NvimTree | `<leader>ec` |
| Refresh Explorer | NvimTree | `<leader>er` |
| **Diagnostics** |||
| Problems Tool Window (Workspace) | Trouble | `<leader>xw` |
| Problems Tool Window (Document) | Trouble | `<leader>xd` |
| Quickfix List | Trouble | `<leader>xq` |
| Location List | Trouble | `<leader>xl` |
| TODO Tool Window | Trouble + todo-comments | `<leader>xt` |
| Find TODOs | Telescope | `<leader>ft` |
| Next TODO | todo-comments | `]t` |
| Previous TODO | todo-comments | `[t` |
| **Code Quality** |||
| Reformat Code (`Cmd+Alt+L`) | Conform | `<leader>mp` (also auto-formats on save) |
| Lint | nvim-lint | `<leader>l` |
| **Editor** |||
| Comment Line (`Cmd+/`) | Comment.nvim | `gcc` (line), `gc` (motion) |
| Move Line Up (`Alt+Shift+Up`) | Core keymaps | `<Alt+Shift+Up>` |
| Move Line Down (`Alt+Shift+Down`) | Core keymaps | `<Alt+Shift+Down>` |
| Extend Selection (`Cmd+W`) | Treesitter | `Alt+w` (incremental) |
| Shrink Selection (`Cmd+Shift+W`) | Treesitter | `Alt+Shift+w` |
| **Tabs & Windows** |||
| New Tab | Core keymaps | `<leader>to` |
| Close Tab | Core keymaps | `<leader>tx` |
| Next Tab | Core keymaps | `<leader>tn` |
| Previous Tab | Core keymaps | `<leader>tp` |
| Open Buffer in New Tab | Core keymaps | `<leader>tf` |
| Split Vertically | Core keymaps | `<leader>sv` |
| Split Horizontally | Core keymaps | `<leader>sh` |
| Equalize Splits | Core keymaps | `<leader>se` |
| Close Split | Core keymaps | `<leader>sx` |
| Maximize/Minimize Split | vim-maximizer | `<leader>sm` |
| **Sessions** |||
| Restore Session | auto-session | `<leader>wr` |
| Save Session | auto-session | `<leader>ws` |

## Complete Keybindings Reference

### General

| Key | Action | Description |
|---|---|---|
| `<Space>` | Leader key | Used as prefix for most custom keybindings |
| `jk` | Exit insert mode | Quick escape from insert mode |
| `<leader>nh` | Clear search highlights | Remove search highlighting |

### Window Management

| Key | Action | Description |
|---|---|---|
| `<leader>sv` | Split vertically | Create vertical split window |
| `<leader>sh` | Split horizontally | Create horizontal split window |
| `<leader>se` | Equalize splits | Make all splits equal size |
| `<leader>sx` | Close split | Close current split window |
| `<leader>sm` | Maximize/minimize | Toggle maximize state of current split |

### Tab Management

| Key | Action | Description |
|---|---|---|
| `<leader>to` | New tab | Open new tab |
| `<leader>tx` | Close tab | Close current tab |
| `<leader>tn` | Next tab | Go to next tab |
| `<leader>tp` | Previous tab | Go to previous tab |
| `<leader>tf` | Buffer in new tab | Open current buffer in new tab |
| `<leader>th` | Tab to horizontal split | Convert next tab to horizontal split |
| `<leader>tv` | Tab to vertical split | Convert next tab to vertical split |

### File Explorer (NvimTree)

| Key | Action | Description |
|---|---|---|
| `<leader>ee` | Toggle explorer | Toggle file explorer |
| `<leader>ef` | Find file | Toggle explorer and locate current file |
| `<leader>ec` | Collapse | Collapse file explorer |
| `<leader>er` | Refresh | Refresh file explorer |

### Search (Telescope)

| Key | Action | Description |
|---|---|---|
| `<leader>ff` | Find files | Fuzzy find files in current directory |
| `<leader>fr` | Recent files | Find recently opened files |
| `<leader>fs` | Live grep | Find string in current directory |
| `<leader>fc` | Grep cursor | Find string under cursor |
| `<leader>fg` | Grep with args | Live grep with advanced arguments |
| `<leader>fw` | Grep word | Grep word under cursor |
| `<leader>fW` | Grep word (typed) | Grep word under cursor with file type filter |
| `<leader>fb` | Grep in buffer | Grep word under cursor in current buffer |
| `<leader>fv` | Grep visual | Grep visual selection (in visual mode) |
| `<leader>fV` | Grep visual buffer | Grep visual selection in current buffer |
| `<leader>ft` | Find TODOs | Find all TODO comments |

**Telescope Mappings (while in Telescope):**
- `<C-k>` / `<C-j>` - Navigate up/down results
- `<C-q>` - Send selected to quickfix list
- `<C-t>` - Open in Trouble
- `<S-CR>` - Open in vertical split
- `<C-S-CR>` - Open in horizontal split

**Live Grep Args Mappings:**
- `<C-k>` - Quote prompt
- `<C-i>` - Quote prompt with `--iglob`
- `<C-t>` - Quote prompt with `-t` (file type)
- `<C-space>` - Freeze list and start fuzzy search

### LSP Features

| Key | Action | Description |
|---|---|---|
| `gd` | Go to definition | Show definitions in Telescope |
| `gD` | Go to declaration | Go to declaration |
| `gi` | Go to implementation | Show implementations in Telescope |
| `gt` | Go to type definition | Show type definitions in Telescope |
| `gR` | Find references | Show all references in Telescope |
| `K` | Hover documentation | Show documentation for symbol under cursor |
| `<leader>ca` | Code actions | Show available code actions |
| `<Shift+F6>` | Rename | Smart rename symbol |
| `<leader>D` | Buffer diagnostics | Show diagnostics for current file |
| `<leader>d` | Line diagnostics | Show diagnostics for current line |
| `<F2>` | Next diagnostic | Jump to next diagnostic |
| `<Shift+F2>` | Previous diagnostic | Jump to previous diagnostic |
| `<leader>rs` | Restart LSP | Restart language server |

### Git (Neogit, Gitsigns, Diffview)

**Neogit:**
| Key | Action | Description |
|---|---|---|
| `<leader>gs` | Git status | Open Neogit status window |
| `<leader>gc` | Git commit | Open Neogit commit window |
| `<leader>gpl` | Git pull | Pull changes |
| `<leader>gps` | Git push | Push changes |

**Gitsigns:**
| Key | Action | Description |
|---|---|---|
| `<S-C-M-Down>` | Next hunk | Navigate to next changed hunk |
| `<S-C-M-Up>` | Previous hunk | Navigate to previous changed hunk |
| `<leader>hs` | Stage hunk | Stage current hunk (visual mode supported) |
| `<leader>hr` | Reset hunk | Reset current hunk (visual mode supported) |
| `<leader>hS` | Stage buffer | Stage entire buffer |
| `<leader>hR` | Reset buffer | Reset entire buffer |
| `<leader>hu` | Undo stage | Undo staging of hunk |
| `<leader>hp` | Preview hunk | Preview hunk changes |
| `<leader>hb` | Blame line | Show full blame for current line |
| `<leader>hB` | Toggle blame | Toggle inline blame |
| `<leader>hd` | Diff this | Show diff for current file |
| `<leader>hD` | Diff this ~ | Show diff against HEAD~ |
| `ih` | Select hunk | Text object to select hunk (in visual/operator mode) |

**Diffview:**
| Key | Action | Description |
|---|---|---|
| `<leader>gd` | Open diffview | Open diff view |
| `<leader>gD` | Close diffview | Close diff view |
| `<leader>gh` | File history | Open file history |
| `<leader>gH` | Current file history | Open history for current file |

### Diagnostics (Trouble)

| Key | Action | Description |
|---|---|---|
| `<leader>xw` | Workspace diagnostics | Toggle workspace diagnostics |
| `<leader>xd` | Document diagnostics | Toggle document diagnostics |
| `<leader>xq` | Quickfix | Toggle quickfix list |
| `<leader>xl` | Location list | Toggle location list |
| `<leader>xt` | TODOs | Toggle TODO list |

### Code Editing

**Comment.nvim:**
| Key | Action | Description |
|---|---|---|
| `gcc` | Toggle line comment | Comment/uncomment current line |
| `gc` | Toggle comment (motion) | Comment/uncomment with motion (e.g., `gc3j`) |
| `gbc` | Toggle block comment | Comment/uncomment block |

**Substitute.nvim:**
| Key | Action | Description |
|---|---|---|
| `s{motion}` | Substitute | Replace text with register contents using motion |
| `ss` | Substitute line | Replace entire line |
| `S` | Substitute to EOL | Replace to end of line |
| `s` (visual) | Substitute selection | Replace visual selection |

**Line Movement:**
| Key | Action | Description |
|---|---|---|
| `<Alt+Shift+Up>` | Move line up | Move current line up |
| `<Alt+Shift+Down>` | Move line down | Move current line down |

**Number Increment/Decrement:**
| Key | Action | Description |
|---|---|---|
| `<leader>+` | Increment | Increment number under cursor |
| `<leader>-` | Decrement | Decrement number under cursor |

**Delete Without Yanking:**
| Key | Action | Description |
|---|---|---|
| `<leader>dw` | Delete word forward | Delete word forward without yanking |
| `<leader>de` | Delete word to end | Delete word to end without yanking |
| `<leader>db` | Delete word backward | Delete word backward without yanking |
| `<leader>diw` | Delete inner word | Delete inner word without yanking |
| `<leader>daw` | Delete a word | Delete a word without yanking |
| `<leader>dd` | Delete line | Delete line without yanking |
| `<leader>d` (visual) | Delete selection | Delete visual selection without yanking |

### Session Management

| Key | Action | Description |
|---|---|---|
| `<leader>wr` | Restore session | Restore session for current directory |
| `<leader>ws` | Save session | Save session for auto-session root directory |

### Autocompletion (nvim-cmp)

| Key | Action | Description |
|---|---|---|
| `<C-k>` | Previous item | Navigate to previous completion item |
| `<C-j>` | Next item | Navigate to next completion item |
| `<C-b>` | Scroll docs up | Scroll documentation up |
| `<C-f>` | Scroll docs down | Scroll documentation down |
| `<C-i>` | Trigger completion | Show completion suggestions |
| `<C-e>` | Abort | Close completion window |
| `<CR>` | Confirm | Confirm selection (doesn't select if none selected) |

## Special Neovim Features (Not in JetBrains)

These are unique Neovim features that don't have direct JetBrains equivalents:

### nvim-surround

Add, change, or delete surrounding pairs (quotes, brackets, HTML tags, etc.):

- **Add surrounding**: `ys{motion}{char}`
  - `ysiw"` - Add double quotes around inner word
  - `ysiw(` - Add parentheses around inner word
  - `ysa"` - Add quotes around a word (including trailing space)
  - `yss)` - Add parentheses around entire line

- **Change surrounding**: `cs{old}{new}`
  - `cs"'` - Change double quotes to single quotes
  - `cs"<q>` - Change quotes to `<q>` tag
  - `cs)]` - Change `)` to `]`

- **Delete surrounding**: `ds{char}`
  - `ds"` - Delete surrounding double quotes
  - `ds)` - Delete surrounding parentheses
  - `dst` - Delete surrounding HTML/XML tag

- **Visual mode**: Select text, then `S{char}` to surround selection

### Substitute Plugin

Replace text with register contents (similar to JetBrains' "Replace" but more powerful):

- `s{motion}` - Substitute text using motion (e.g., `siw` substitutes inner word)
- `ss` - Substitute entire line
- `S` - Substitute to end of line
- `s` (visual mode) - Substitute visual selection

This is different from normal Neovim substitution - it replaces with the default register (`"`), making it useful for quick replacements.

### Treesitter Incremental Selection

Smart, syntax-aware selection expansion:

- `Alt+w` - Start/expand selection (init_selection/node_incremental/scope_incremental)
- `Alt+Shift+w` - Shrink selection (node_decremental)

This intelligently expands selection based on AST nodes, similar to JetBrains' "Extend Selection" but syntax-aware.

### vim-tmux-navigator

Seamless navigation between Neovim windows and tmux panes using the same keybindings (`Ctrl+h/j/k/l`). Works transparently - you don't need to think about whether you're in Neovim or tmux.

### Delete Without Yanking

All `<leader>d*` variants delete without copying to the default register, useful when you want to delete without affecting your clipboard/yank history.

### Which-key

Shows a popup with available keybindings when you press `<leader>`. Helps discover available commands and prevents typos.

### Illuminate

Highlights all occurrences of the word under the cursor (similar to JetBrains' "Highlight Usages"):

- `<C-M-Up>` - Move to previous reference
- `<D-C-Down>` - Move to next reference

### Bufferline

Tab-like interface showing all open buffers. Configured to show tabs with file paths, making it easy to switch between files.

## Missing JetBrains Features

The following JetBrains IDE features are not currently available in this configuration:

### Refactoring

- **Extract Method/Variable/Constant** - No equivalent
- **Inline Variable/Method** - No equivalent
- **Move Class/Method** - No equivalent (can manually move files)
- **Safe Delete** - No equivalent
- **Change Signature** - No equivalent
- **Pull Members Up/Down** - No equivalent

**Note**: Some refactoring can be achieved manually with LSP rename and find/replace, but there's no automated refactoring wizard.

### Debugging

- **Integrated Debugger** - Not configured (can add [nvim-dap](https://github.com/mfussenegger/nvim-dap))
- **Breakpoints** - Not available
- **Step Into/Over/Out** - Not available
- **Variable Inspection** - Not available
- **Watch Expressions** - Not available
- **Call Stack View** - Not available

### Database Tools

- **Database Explorer** - Not available
- **SQL Editor with Completion** - Not available
- **Query Execution** - Not available
- **Database Schema Visualization** - Not available

### HTTP Client

- **Built-in REST Client** - Not available (can add [rest.nvim](https://github.com/NTBBloodbath/rest.nvim))

### Version Control

- **Shelve/Unshelve Changes** - Not available
- **Interactive Rebase UI** - Not available (can use terminal git)
- **Cherry-pick UI** - Not available
- **Merge Conflict Resolution Tool** - Partial (diffview provides diff view, but no 3-way merge tool)
- **Stash Management UI** - Not available

### Run Configurations

- **Saved Run/Debug Configurations** - Not available
- **Run with Coverage** - Not available
- **Multiple Run Configurations** - Not available
- **Run Configurations History** - Not available

### Code Generation

- **Generate Getters/Setters** - Not available
- **Generate Constructors** - Not available
- **Override Methods Wizard** - Not available
- **Implement Interface Wizard** - Not available
- **Generate toString/equals/hashCode** - Not available

**Note**: Some code generation can be achieved with snippets (LuaSnip), but there's no language-aware code generation.

### Testing

- **Test Runner Integration** - Not available (can add [neotest](https://github.com/nvim-neotest/neotest))
- **Test Coverage Visualization** - Not available
- **Re-run Failed Tests** - Not available
- **Test History** - Not available
- **Test Output Window** - Not available

### AI Features

- **AI Assistant** - Not available (can add [Copilot](https://github.com/github/copilot.vim) or [Codeium](https://codeium.com/))

### Other Features

- **Structure View** - Not available (can add [aerial.nvim](https://github.com/stevearc/aerial.nvim))
- **Terminal Integration** - Basic (can use `:terminal` or external terminal)
- **Project-wide Find & Replace** - Partial (Telescope live_grep + manual replace)
- **Local History** - Not available
- **Compare Files** - Partial (diffview can compare, but no side-by-side file comparison tool)

## Installed LSP Servers

The following Language Server Protocol servers are configured and automatically installed via Mason:

- **ts_ls** - TypeScript/JavaScript language server
- **html** - HTML language server
- **cssls** - CSS language server
- **tailwindcss** - Tailwind CSS IntelliSense
- **svelte** - Svelte language server
- **lua_ls** - Lua language server
- **graphql** - GraphQL language server
- **emmet_ls** - Emmet language server (HTML/CSS expansion)
- **prismals** - Prisma language server
- **pyright** - Python language server
- **gopls** - Go language server

## Formatters and Linters

### Formatters (via Conform.nvim)

Auto-formatting is enabled on save for the following file types:

- **JavaScript/TypeScript/React/Svelte**: Prettier
- **CSS/HTML/JSON/YAML/Markdown/GraphQL**: Prettier
- **Lua**: stylua
- **Python**: isort + black

Manual formatting: `<leader>mp` (works in visual mode for range formatting)

### Linters (via nvim-lint)

Linting runs automatically on:
- Buffer enter
- Buffer write
- Insert leave

Configured linters:
- **JavaScript/TypeScript/React/Svelte**: eslint_d
- **Python**: pylint

Manual linting: `<leader>l`

## Plugin List

### Core Plugins

- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Lua utility functions
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding helper popup

### UI & Appearance

- **[Kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim)** - Colorscheme (Dragon variant)
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Tab-like buffer line
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Dashboard/start screen
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Better UI for vim.ui functions

### LSP & Autocompletion

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/DAP/linter/formatter installer
- **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)** - Mason-LSP bridge
- **[mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Auto-install tools
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
- **[cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP completion source
- **[cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** - Buffer completion source
- **[cmp-path](https://github.com/hrsh7th/cmp-path)** - Path completion source
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine
- **[cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - LuaSnip completion source
- **[friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - Snippet collection
- **[lspkind.nvim](https://github.com/onsails/lspkind.nvim)** - Completion icons
- **[neodev.nvim](https://github.com/folke/neodev.nvim)** - Lua development tools
- **[nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** - File operation handling

### Treesitter

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting and parsing
- **[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close/rename HTML/JSX tags
- **[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** - Context-aware comments

### Search & Navigation

- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - FZF sorter for Telescope
- **[telescope-live-grep-args.nvim](https://github.com/nvim-telescope/telescope-live-grep-args.nvim)** - Advanced grep with arguments

### Git

- **[neogit](https://github.com/NeogitOrg/neogit)** - Git interface
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git signs and hunks
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)** - Git diff viewer

### Diagnostics & Code Quality

- **[trouble.nvim](https://github.com/folke/trouble.nvim)** - Diagnostics viewer
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Linting framework
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Formatting framework
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - TODO/FIXME highlighting

### Editing

- **[nvim-surround](https://github.com/kylechui/nvim-surround)** - Surround text with pairs
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-close pairs
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Commenting
- **[substitute.nvim](https://github.com/gbprod/substitute.nvim)** - Advanced substitution
- **[vim-illuminate](https://github.com/RRethy/vim-illuminate)** - Highlight word under cursor

### Utilities

- **[auto-session](https://github.com/rmagatti/auto-session)** - Session management
- **[vim-maximizer](https://github.com/szw/vim-maximizer)** - Maximize/minimize splits
- **[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)** - Seamless tmux navigation

## Configuration Structure

```
nvim/
├── init.lua                 # Entry point
├── lua/
│   └── nvegater/
│       ├── init.lua         # Main initialization
│       ├── lazy.lua         # Lazy.nvim setup
│       └── core/
│           ├── init.lua     # Core initialization
│           ├── keymaps.lua  # Keybindings
│           └── options.lua  # Neovim options
│       └── plugins/
│           ├── init.lua     # Plugin imports
│           └── *.lua        # Individual plugin configs
│           └── lsp/
│               ├── lspconfig.lua
│               └── mason.lua
└── after/
    └── lsp/
        └── *.lua            # LSP-specific configurations
```

## Key Files Reference

- **Entry Point**: `init.lua` - Loads core and lazy
- **Core Config**: `lua/nvegater/core/` - Keymaps, options, initialization
- **Plugins**: `lua/nvegater/plugins/` - All plugin configurations
- **LSP Configs**: `after/lsp/` - Language server specific settings

## Tips & Tricks

1. **Discover Keybindings**: Press `<leader>` and wait for the which-key popup to see all available commands
2. **Quick File Navigation**: Use `<leader>ff` to quickly find and open files
3. **Git Workflow**: Use `<leader>gs` for full git interface, or `<leader>hs`/`<leader>hr` for quick hunk staging
4. **Code Navigation**: Use `gd` for definitions, `gR` for references - both open in Telescope for easy navigation
5. **Surround Magic**: Learn surround commands - they're incredibly powerful for editing structured text
6. **Incremental Selection**: Use `Alt+w` to expand selection intelligently based on syntax
7. **Session Management**: Sessions auto-save (except in suppressed directories). Use `<leader>wr` to restore

## Contributing

This is a personal configuration, but feel free to use it as inspiration for your own setup!
