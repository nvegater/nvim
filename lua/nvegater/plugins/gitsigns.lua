return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigate changed pieces of code (Hunks)
     map("n", "<S-C-M-Down>", gs.next_hunk, "Next Hunk")
     map("n", "<S-C-M-Up>", gs.prev_hunk, "Prev Hunk")

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk")
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk")

      map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

      -- IntelliJ-style rollback: discard ALL changes to this file, staged and unstaged
      map("n", "<leader>hX", function()
        local file = vim.fn.expand("%:p")
        if vim.fn.confirm("Discard ALL changes to " .. vim.fn.expand("%:t") .. " (staged + unstaged)?", "&Yes\n&No", 2) ~= 1 then
          return
        end
        local out = vim.fn.system({ "git", "-C", vim.fn.expand("%:p:h"), "restore", "--staged", "--worktree", "--", file })
        if vim.v.shell_error ~= 0 then
          vim.notify("git restore failed: " .. out, vim.log.levels.ERROR)
          return
        end
        vim.cmd("edit!")
      end, "Rollback file to HEAD (staged + unstaged)")

      map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

      map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Blame line")
      map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

      map("n", "<leader>hd", gs.diffthis, "Diff this")
      map("n", "<leader>hD", function()
        gs.diffthis("~")
      end, "Diff this ~")

      -- PR mode: gutter signs show ALL changes vs the default branch (like IntelliJ PR view),
      -- not just uncommitted ones. <leader>hM goes back to normal (signs vs index).
      map("n", "<leader>hm", function()
        local dir = vim.fn.expand("%:p:h")
        local branch = vim.fn.systemlist({ "git", "-C", dir, "symbolic-ref", "--quiet", "--short", "refs/remotes/origin/HEAD" })[1]
        if vim.v.shell_error ~= 0 or not branch or branch == "" then
          branch = "origin/main"
        end
        local mb = vim.fn.systemlist({ "git", "-C", dir, "merge-base", branch, "HEAD" })[1]
        if vim.v.shell_error ~= 0 or not mb or mb == "" then
          vim.notify("Gitsigns PR mode: could not find merge-base with " .. branch, vim.log.levels.ERROR)
          return
        end
        gs.change_base(mb, true)
        vim.notify("Gitsigns: PR mode — signs show changes vs " .. branch)
      end, "PR mode: signs vs default branch")

      map("n", "<leader>hM", function()
        gs.change_base(nil, true)
        vim.notify("Gitsigns: normal mode — signs show uncommitted changes")
      end, "Normal mode: signs vs index")

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
    end,
  },
}
