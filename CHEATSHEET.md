# Neovim Cheatsheet

> Leader key: **Space** | Colorscheme: Kanagawa Dragon | Tabs: 2 spaces
> IntelliJ user? The closest equivalents are noted with **(IJ: ...)**.

## General

| Shortcut | Mode | Action |
|---|---|---|
| `jk` | Insert | Exit insert mode **(IJ: Esc)** |
| `Space nh` | Normal | Clear search highlights |
| `Space l` | Normal | Trigger linting |
| `Space mp` | Normal/Visual | Format file or selection **(IJ: Ctrl+Alt+L)** |
| `K` | Normal | Show hover documentation **(IJ: Ctrl+Q)** |

## Navigation & Search (Telescope)

| Shortcut | Mode | Action |
|---|---|---|
| `Space ff` | Normal | Find files **(IJ: Ctrl+Shift+N / Double Shift)** |
| `Space fr` | Normal | Recent files **(IJ: Ctrl+E)** |
| `Space fs` | Normal | Live grep in project **(IJ: Ctrl+Shift+F)** |
| `Space fg` | Normal | Live grep with ripgrep args |
| `Space fc` | Normal | Grep string under cursor |
| `Space fw` | Normal | Grep word under cursor (with args) |
| `Space fW` | Normal | Grep word under cursor (+ file type filter) |
| `Space fb` | Normal | Grep word under cursor in current buffer |
| `Space fv` | Visual | Grep visual selection |
| `Space fV` | Visual | Grep visual selection in current buffer |
| `Space ft` | Normal | Find TODOs **(IJ: TODO tool window)** |

### Inside Telescope picker

| Shortcut | Action |
|---|---|
| `Ctrl+j` / `Ctrl+k` | Next / previous result |
| `Ctrl+q` | Send selected to quickfix (Trouble) |
| `Ctrl+t` | Open results in Trouble |
| `Shift+Enter` | Open in vertical split |
| `Ctrl+Shift+Enter` | Open in horizontal split |

### Live Grep Args (inside picker)

| Shortcut | Action |
|---|---|
| `Ctrl+k` | Quote prompt |
| `Ctrl+i` | Add `--iglob` filter |
| `Ctrl+t` | Add `-t` file type filter |
| `Ctrl+Space` | Freeze list & fuzzy refine |

## LSP (buffer-local, active when LSP attaches)

| Shortcut | Mode | Action |
|---|---|---|
| `gd` | Normal | Go to definition **(IJ: Ctrl+B / Ctrl+Click)** |
| `gD` | Normal | Go to declaration |
| `gR` | Normal | Show references **(IJ: Alt+F7)** |
| `gi` | Normal | Show implementations **(IJ: Ctrl+Alt+B)** |
| `gt` | Normal | Show type definitions **(IJ: Ctrl+Shift+B)** |
| `Space ca` | Normal/Visual | Code actions **(IJ: Alt+Enter)** |
| `Shift+F6` | Normal | Smart rename **(IJ: Shift+F6)** |
| `F2` | Normal | Next diagnostic **(IJ: F2)** |
| `Shift+F2` | Normal | Previous diagnostic |
| `Space d` | Normal | Line diagnostics |
| `Space D` | Normal | Buffer diagnostics (Telescope) |
| `Ctrl+Alt+Down` | Normal | Incoming calls / next usage |
| `Space rs` | Normal | Restart LSP |

## Autocompletion (nvim-cmp, insert mode)

| Shortcut | Action |
|---|---|
| `Ctrl+j` / `Ctrl+k` | Next / previous suggestion |
| `Ctrl+b` / `Ctrl+f` | Scroll docs up / down |
| `Ctrl+i` | Trigger completion **(IJ: Ctrl+Space)** |
| `Ctrl+e` | Dismiss completion |
| `Enter` | Confirm selection (no auto-select) |

## File Explorer (NvimTree)

| Shortcut | Mode | Action |
|---|---|---|
| `Space ee` | Normal | Toggle file explorer **(IJ: Alt+1)** |
| `Space ef` | Normal | Reveal current file in explorer **(IJ: Alt+F1 > Project)** |
| `Space ec` | Normal | Collapse all folders |
| `Space er` | Normal | Refresh explorer |

## Window & Split Management

| Shortcut | Mode | Action |
|---|---|---|
| `Space sv` | Normal | Split vertically **(IJ: right-split editor)** |
| `Space sh` | Normal | Split horizontally |
| `Space se` | Normal | Equalize split sizes |
| `Space sx` | Normal | Close current split |
| `Space sm` | Normal | Maximize/restore split **(IJ: Ctrl+Shift+F12)** |
| `Ctrl+h/j/k/l` | Normal | Navigate splits (vim-tmux-navigator) |

## Tabs & Bufferline

| Shortcut | Mode | Action |
|---|---|---|
| `Space to` | Normal | New tab |
| `Space tx` | Normal | Close tab **(IJ: Ctrl+F4)** |
| `Space tn` | Normal | Next tab **(IJ: Alt+Right)** |
| `Space tp` | Normal | Previous tab **(IJ: Alt+Left)** |
| `Space tf` | Normal | Open current buffer in new tab |
| `Space t1`…`Space t9` | Normal | Go to tab 1–9 |
| `Space th` | Normal | Convert tab to horizontal split |
| `Space tv` | Normal | Convert tab to vertical split |
| `Space tw` | Normal | Open Warp tab in cwd |

## Line Movement

| Shortcut | Mode | Action |
|---|---|---|
| `Alt+Shift+Up` | Normal | Move line up **(IJ: Alt+Shift+Up)** |
| `Alt+Shift+Down` | Normal/Visual | Move line(s) down **(IJ: Alt+Shift+Down)** |

## Git (Neogit + Gitsigns + Diffview)

### Neogit

| Shortcut | Mode | Action |
|---|---|---|
| `Space gs` | Normal | Open Neogit status **(IJ: Alt+9 / Ctrl+K)** |
| `Space gc` | Normal | Open Neogit commit **(IJ: Ctrl+K)** |
| `Space gpl` | Normal | Git pull |
| `Space gps` | Normal | Git push **(IJ: Ctrl+Shift+K)** |
| `Space gf` | Normal | Git fetch (popup: `u` = from upstream, `a` = all remotes) |
| `Space gm` | Normal | Git merge (popup: `m` = merge branch you pick) |
| `Space gb` | Normal | Telescope branch picker, recent first (Enter = checkout) **(IJ: Ctrl+Shift+`)** |

### Diffview

| Shortcut | Mode | Action |
|---|---|---|
| `Space gd` | Normal | Open diff view **(IJ: Ctrl+D on file)** |
| `Space gD` | Normal | Close diff view |
| `Space gh` | Normal | File history (all files) |
| `Space gH` | Normal | File history (current file) **(IJ: Alt+Shift+H)** |

### Diffview panel keys

| Shortcut | Action |
|---|---|
| `Tab` / `Shift+Tab` | Next / previous entry |
| `Enter` | Select entry |
| `s` / `u` | Stage / unstage entry |
| `R` | Refresh |
| `Space e` or `Space b` | Toggle file panel |
| `gf` | Go to file |

### Gitsigns (buffer-local)

| Shortcut | Mode | Action |
|---|---|---|
| `Ctrl+Shift+Alt+Down` | Normal | Next hunk |
| `Ctrl+Shift+Alt+Up` | Normal | Previous hunk |
| `Space hs` | Normal/Visual | Stage hunk |
| `Space hr` | Normal/Visual | Reset hunk |
| `Space hS` | Normal | Stage entire buffer |
| `Space hR` | Normal | Reset entire buffer (unstaged changes only) |
| `Space hX` | Normal | Rollback file to HEAD, staged + unstaged **(IJ: Ctrl+Alt+Z / Rollback)** |
| `Space hu` | Normal | Undo stage hunk |
| `Space hp` | Normal | Preview hunk |
| `Space hb` | Normal | Blame line **(IJ: Annotate/Git Blame)** |
| `Space hB` | Normal | Toggle inline blame |
| `Space hd` | Normal | Diff this |
| `Space hD` | Normal | Diff this ~ (against last commit) |
| `ih` | Operator/Visual | Select hunk (text object) |

## Smart Select (Extend/Shrink Selection)

Uses Neovim 0.12's built-in treesitter node selection (`:h v_an`); falls back to LSP selection range when no parser is available.

Works with **either** Option key: right Option sends real Meta (`<A-k>`/`<A-j>`), while left Option composes `∆`/`º` on the German layout — both are mapped.

| Shortcut | Mode | Action |
|---|---|---|
| `Option+Up` / `Option+k` | Normal | Select node under cursor **(IJ: Option+Up extend)** |
| `Option+Up` / `Option+k` | Visual | Expand selection to parent node |
| `Option+Down` / `Option+j` | Visual | Shrink selection back **(IJ: Option+Down shrink)** |
| `]n` / `[n` | Visual | Select next / previous sibling node |

## Trouble (Diagnostics Panel)

| Shortcut | Mode | Action |
|---|---|---|
| `Space xw` | Normal | Workspace diagnostics **(IJ: Problems tool window)** |
| `Space xd` | Normal | Document diagnostics |
| `Space xq` | Normal | Quickfix list |
| `Space xl` | Normal | Location list |
| `Space xt` | Normal | TODOs in Trouble |

## TODO Comments

| Shortcut | Mode | Action |
|---|---|---|
| `]t` | Normal | Next TODO comment |
| `[t` | Normal | Previous TODO comment |

## Illuminate (Reference Highlighting)

| Shortcut | Mode | Action |
|---|---|---|
| `Ctrl+Alt+Up` | Normal | Previous reference **(IJ: Ctrl+Alt+Up)** |
| `Cmd+Ctrl+Down` | Normal | Next reference |

## Surround (nvim-surround)

| Shortcut | Mode | Action |
|---|---|---|
| `ys{motion}{char}` | Normal | Add surround **(e.g. `ysiw"` wraps word in quotes)** |
| `ds{char}` | Normal | Delete surround **(e.g. `ds"` removes quotes)** |
| `cs{old}{new}` | Normal | Change surround **(e.g. `cs"'` changes `"` to `'`)** |
| `S{char}` | Visual | Surround selection |

## Substitute

| Shortcut | Mode | Action |
|---|---|---|
| `s{motion}` | Normal | Substitute with motion (paste over) |
| `ss` | Normal | Substitute entire line |
| `S` | Normal | Substitute to end of line |
| `s` | Visual | Substitute selection |

## Comment (Comment.nvim)

| Shortcut | Mode | Action |
|---|---|---|
| `gcc` | Normal | Toggle line comment **(IJ: Ctrl+/)** |
| `gbc` | Normal | Toggle block comment **(IJ: Ctrl+Shift+/)** |
| `gc{motion}` | Normal | Comment with motion (e.g. `gcap` = paragraph) |
| `gc` | Visual | Toggle comment on selection |
| `gb` | Visual | Toggle block comment on selection |

## Delete Without Yanking (black hole register)

| Shortcut | Mode | Action |
|---|---|---|
| `Space dw` | Normal | Delete word forward |
| `Space de` | Normal | Delete word to end |
| `Space db` | Normal | Delete word backward |
| `Space diw` | Normal | Delete inner word |
| `Space daw` | Normal | Delete a word (with space) |
| `Space dd` | Normal | Delete line |
| `Space d` | Visual | Delete selection |

## Increment / Decrement

| Shortcut | Mode | Action |
|---|---|---|
| `Space +` | Normal | Increment number under cursor |
| `Space -` | Normal | Decrement number under cursor |

## Session Management (auto-session)

| Shortcut | Mode | Action |
|---|---|---|
| `Space wr` | Normal | Restore session for cwd |
| `Space ws` | Normal | Save session |
| `Space wf` | Normal | Find session (picker for all saved sessions) |

## Which-Key

Press **Space** and wait 500ms to see all available leader keybindings in a popup.

## Automatic Behaviors

- **Format on save** via Conform (prettier, stylua, black, isort)
- **Lint on save/enter/leave insert** via nvim-lint (eslint_d, pylint)
- **Auto-pairs** for brackets, quotes, etc.
- **Auto-tags** for HTML/JSX via nvim-ts-autotag
- **System clipboard** is the default register (`unnamedplus`)
