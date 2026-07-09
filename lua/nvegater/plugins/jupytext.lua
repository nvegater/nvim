return {
  "GCBallesteros/jupytext.nvim",
  lazy = false,
  config = function()
    -- Swapfiles are useless for notebook buffers (the buffer holds generated
    -- markdown; writes go through the jupytext CLI) and a leftover/concurrent
    -- .ipynb swapfile makes E325 fire inside jupytext's BufReadCmd, which
    -- aborts session restores. BufNew is the only event that fires early
    -- enough — BufReadPre is skipped when a BufReadCmd handles the read.
    vim.api.nvim_create_autocmd("BufNew", {
      pattern = "*.ipynb",
      callback = function(ev)
        vim.bo[ev.buf].swapfile = false
      end,
    })

    require("jupytext").setup({
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    })
  end,
}
