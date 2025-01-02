require("nvegater.core")
require("nvegater.lazy")

vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    vim.cmd("redraw!")
  end
})

