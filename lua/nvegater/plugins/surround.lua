return {
  "kylechui/nvim-surround", -- Surround text is stuff, like html Tags and stuff. s and capital S are the friends.
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
