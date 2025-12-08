# Neovim Configuration

Personal Neovim configuration based on [LazyVim](https://www.lazyvim.org/).

## Prerequisites

### System Requirements

- **Neovim** >= 0.11.0
- **Git** >= 2.19.0
- A **Nerd Font** (recommended: JetBrainsMono Nerd Font)
- **Terminal** with true color support

### Required Dependencies

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install git curl build-essential ripgrep fd-find unzip xclip
```

| Tool | Purpose |
|------|---------|
| `git` | Plugin management |
| `curl` | Downloads |
| `build-essential` | Compile treesitter parsers |
| `ripgrep` | Fast grep (for telescope/snacks) |
| `fd-find` | Fast file finder |
| `unzip` | Extract LSP servers |
| `xclip` | System clipboard support |

### Install Neovim 0.11+

```bash
# Download latest stable
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Extract to /opt
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

### Install LazyGit (optional but recommended)

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz
```

### Install Nerd Font

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download JetBrainsMono Nerd Font
curl -fLo ~/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf \
  https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

# Refresh font cache
fc-cache -fv
```

Then set your terminal to use "JetBrainsMono Nerd Font".

## Installation

### Backup existing config (if any)

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone this configuration

```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

### Start Neovim

```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## Included Plugins

### Core
- **lazy.nvim** - Plugin manager
- **LazyVim** - Base distribution

### Editor
- **snacks.nvim** - File explorer, terminal, dashboard, notifications
- **flash.nvim** - Fast navigation
- **grug-far.nvim** - Search and replace
- **which-key.nvim** - Keybinding hints

### Coding
- **nvim-treesitter** - Syntax highlighting
- **blink.cmp** - Autocompletion
- **conform.nvim** - Formatting
- **nvim-lint** - Linting
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/formatter/linter installer

### Git
- **gitsigns.nvim** - Git signs in gutter
- **lazygit** integration

### UI
- **kanagawa.nvim** - Color scheme (dragon variant)
- **bufferline.nvim** - Buffer tabs
- **lualine.nvim** - Status line

### AI
- **claudecode.nvim** - Claude Code integration

## Key Mappings

Leader key: `<Space>`

### General
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>ff` | Find files |
| `<leader>sg` | Live grep |
| `<leader>/` | Search in buffer |
| `<leader>bd` | Close buffer |
| `<S-h>` / `<S-l>` | Previous/next buffer |

### Navigation
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between windows |
| `s` | Flash jump |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code actions |

### Git
| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |
| `]h` / `[h` | Next/previous hunk |

### Claude Code
| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code |
| `<leader>aa` | Add file to Claude |
| `<leader>as` | Send selection to Claude (visual mode) |

### Terminal
| Key | Action |
|-----|--------|
| `<C-/>` | Toggle terminal |
| `<leader>ft` | Floating terminal |

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto commands
│   │   ├── keymaps.lua      # Custom keymaps
│   │   ├── lazy.lua         # Lazy.nvim setup
│   │   └── options.lua      # Neovim options
│   └── plugins/
│       ├── claude.lua       # Claude Code config
│       ├── colorscheme.lua  # Kanagawa theme
│       └── dashboard.lua    # Custom dashboard
```

## Cloud / DevOps Support

This configuration includes support for cloud infrastructure and DevOps workflows.

### What's Included

| Tool | LSP/Plugin | Description |
|------|------------|-------------|
| Docker | `dockerfile-ls` | Dockerfile support |
| Docker Compose | `docker-compose-language-service` | docker-compose.yml support |
| Azure Bicep | `bicep-lsp` | Azure Infrastructure as Code |
| Terraform | `terraform-ls` | HashiCorp Terraform |
| YAML | `yaml-language-server` + SchemaStore | Auto-validation for pipelines, k8s, etc. |
| JSON | `json-lsp` + SchemaStore | Auto-validation with schemas |
| REST APIs | `kulala.nvim` | Test APIs from Neovim |

### Automatic Schema Detection

SchemaStore automatically validates:
- `azure-pipelines.yml`
- `docker-compose.yml`
- `.github/workflows/*.yml` (GitHub Actions)
- `package.json`, `tsconfig.json`
- And hundreds more...

### REST Client Keymaps

| Key | Action |
|-----|--------|
| `<leader>rs` | Run REST request |
| `<leader>ra` | Run all requests |
| `<leader>rn` | Next request |
| `<leader>rp` | Previous request |

### Using the REST Client

Create a `.http` file:

```http
### Get users
GET https://jsonplaceholder.typicode.com/users

### Create user
POST https://jsonplaceholder.typicode.com/users
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com"
}
```

Press `<leader>rs` on a request to execute it.

## Adding Language Support

Use `:Mason` to install LSP servers, formatters, and linters.

## License

CC BY-NC 4.0 - Free to use and modify, but **no commercial use** allowed.

See [LICENSE](LICENSE) for details.
