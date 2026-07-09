return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  init = function()
    -- skip the plugin's nvim-treesitter module compatibility checks (faster startup)
    vim.g.skip_ts_context_commentstring_module = true
  end,
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- disable the CursorHold autocmd: it errors in buffers without a treesitter
    -- parser; the pre_hook below computes the commentstring on demand instead
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
