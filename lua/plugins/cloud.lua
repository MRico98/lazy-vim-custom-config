return {
  -- SchemaStore para validación automática de YAML/JSON
  { "b0o/schemastore.nvim" },

  -- LSP servers via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "yaml-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "bicep-lsp",
        "terraform-ls",
      },
    },
  },

  -- Configurar LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- YAML con SchemaStore
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "azure-pipelines.yml",
                  "azure-pipelines/*.yml",
                },
              },
            },
          },
        },
        -- JSON con SchemaStore
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },
        -- Docker
        dockerls = {},
        docker_compose_language_service = {},
        -- Azure Bicep
        bicep = {},
        -- Terraform
        terraformls = {},
      },
    },
  },

  -- Treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "yaml",
        "json",
        "dockerfile",
        "bicep",
        "hcl",
        "terraform",
      },
    },
  },

  -- REST client para probar APIs
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    opts = {},
    keys = {
      { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Run REST request" },
      { "<leader>ra", "<cmd>lua require('kulala').run_all()<cr>", desc = "Run all requests" },
      { "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Previous request" },
      { "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Next request" },
    },
  },
}
