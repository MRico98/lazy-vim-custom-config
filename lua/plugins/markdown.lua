return {
  -- Renderiza markdown bonito dentro de Neovim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- Preview en navegador en tiempo real
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = "cd app && npm install",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },

  -- Resalta headers con fondos de colores
  {
    "lukas-reineke/headlines.nvim",
    ft = "markdown",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },

  -- Crear y editar tablas fácilmente
  {
    "dhruvasagar/vim-table-mode",
    ft = "markdown",
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Toggle Table Mode" },
    },
  },

  -- Treesitter para markdown
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "markdown", "markdown_inline" },
    },
  },
}
