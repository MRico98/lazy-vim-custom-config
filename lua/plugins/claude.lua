return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code (toggle)" },
    { "<leader>aa", "<cmd>ClaudeCodeAdd<cr>", desc = "Add file to Claude" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", desc = "Send selection to Claude", mode = "v" },
  },
}
