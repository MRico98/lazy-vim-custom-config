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

## C# / .NET Support

This configuration includes full C# development support with the same tools VS Code uses.

### Requirements

- **.NET SDK** (tested with .NET 10)

```bash
dotnet --version
```

### What's Included

| Feature | Tool | Description |
|---------|------|-------------|
| LSP | **Roslyn** | Same language server as VS Code |
| Syntax | **Treesitter** | Accurate syntax highlighting |
| Debugger | **netcoredbg** | Breakpoints, step through, variables |

### Post-Install Setup

After cloning this config, run these commands inside Neovim:

```
:Mason
```

Then install:
1. Search `roslyn` → press `i` to install
2. Search `netcoredbg` → press `i` to install

### C# Keymaps

#### LSP (works in any `.cs` file)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find all references |
| `K` | Hover documentation |
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code actions |

#### Debugger
| Key | Action |
|-----|--------|
| `<leader>db` | Toggle breakpoint |
| `<leader>dc` | Start/continue debugging |
| `<leader>di` | Step into |
| `<leader>do` | Step over |
| `<leader>dO` | Step out |
| `<leader>dt` | Terminate debug session |
| `<leader>du` | Toggle debug UI |

### Debugging a Project

1. Build your project:
   ```bash
   dotnet build
   ```

2. Open a `.cs` file in Neovim

3. Set a breakpoint with `<leader>db`

4. Start debugging with `<leader>dc`

5. Enter the path to your DLL:
   ```
   bin/Debug/net10.0/YourProject.dll
   ```

### Why Roslyn over OmniSharp?

- **Official**: Same LSP that powers VS Code and Visual Studio
- **Modern**: Better support for latest C# features and .NET versions
- **Maintained**: Microsoft actively develops Roslyn

## Adding Other Languages

Use `:Mason` to install LSP servers, formatters, and linters for other languages.

## License

CC BY-NC 4.0 - Free to use and modify, but **no commercial use** allowed.

See [LICENSE](LICENSE) for details.
