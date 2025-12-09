# Bikram's Development Environment

A lightweight, highly customized Neovim configuration tailored for security researchers, bug bounty hunters, and penetration testers. Built with performance and efficiency in mind for daily security testing workflows.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Latest-purple.svg)](https://www.lazyvim.org/)

## 🎯 Philosophy

As a security enthusiast who regularly breaks and tests systems, I needed a development environment that is:
- **Lightweight** - Fast startup and minimal resource usage
- **Reliable** - Stable enough for daily security research
- **Customizable** - Easily adaptable to evolving workflows
- **Efficient** - Optimized for rapid development and testing

This configuration prioritizes functionality over flashy features, providing a solid foundation for security research and development work.

## ✨ Features

### 🔧 Core Capabilities
- **LazyVim-based**: Built on the excellent LazyVim framework for sensible defaults
- **Language Support**: Preconfigured for Go, Python, JavaScript, Rust, Shell scripting, and web development
- **Smart Completion**: Blink.cmp with Copilot and Codeium AI assistance
- **Live Development**: Built-in live server for web testing and development
- **Git Integration**: Comprehensive Git workflow support
- **Symbol Navigation**: Aerial plugin for code structure overview
- **Auto-save**: Intelligent auto-save with configurable triggers

### 🎨 UI Enhancements
- **Catppuccin & Tokyo Night**: Beautiful, eye-friendly color schemes
- **Dashboard**: Custom startup screen with quick access shortcuts
- **Bufferline**: Enhanced buffer management
- **Statusline**: Informative lualine configuration
- **Noice**: Modern UI for messages, cmdline, and popups

### 🚀 Developer Experience
- **Fuzzy Finding**: Telescope and fzf-lua for rapid file navigation
- **LSP Support**: Full Language Server Protocol integration
- **Format on Save**: Automatic code formatting with conform.nvim
- **Linting**: Real-time code analysis with nvim-lint
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Debugging**: DAP integration for debugging sessions

## 📋 Prerequisites

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** (for Copilot, live-server, and some LSPs)
- **Python 3** (for Python development)
- **Go** (for Go development)
- **Rust** (optional, for Rust development)
- **A Nerd Font** (recommended: JetBrainsMono Nerd Font)

### System-Specific Requirements

**Arch Linux (with Hyprland)**:
```bash
sudo pacman -S neovim git nodejs npm python python-pip
yay -S ttf-jetbrains-mono-nerd  # or your preferred AUR helper
```

## 🔧 Installation

### Fresh Installation

1. **Backup existing configuration** (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

2. **Clone this repository**:
```bash
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
```

3. **Install dependencies**:
```bash
# Install live-server globally
npm install -g live-server

# Install Python formatters (optional)
pip install black isort
```

4. **Launch Neovim**:
```bash
nvim
```

LazyVim will automatically install all plugins on first launch.

## ⚙️ Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua       # Auto commands
│   │   ├── keymaps.lua        # Custom key mappings
│   │   ├── lazy.lua           # Plugin manager setup
│   │   └── options.lua        # Neovim options
│   └── plugins/
│       ├── editor/            # Editor enhancement plugins
│       │   ├── aerial.lua     # Symbol outline
│       │   ├── auto-save.lua  # Auto-save functionality
│       │   ├── live-server.lua # Web development server
│       │   └── telescope.lua  # Fuzzy finder
│       ├── lang/              # Language-specific configs
│       │   ├── go.lua         # Go development
│       │   ├── python.lua     # Python development
│       │   ├── rust.lua       # Rust development
│       │   ├── shell.lua      # Shell scripting
│       │   └── web.lua        # Web development (HTML/CSS/JS)
│       └── ui/                # UI enhancements
│           └── dashboard.lua  # Startup dashboard
├── lazy-lock.json             # Plugin version lock
├── lazyvim.json               # LazyVim extras
└── stylua.toml                # Lua formatter config
```

## 🎮 Key Mappings

### Custom Mappings

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Insert | `jj` | `<Esc>` | Quick escape to normal mode |
| Normal | `<leader>cs` | `:AerialToggle` | Toggle symbol outline |
| Normal | `<leader>as` | `:ASToggle` | Toggle auto-save |
| Normal | `<leader>cL` | `:LiveServerStart` | Start live server (HTML files) |
| Normal | `<leader>cl` | `:LiveServerStop` | Stop live server |

### LazyVim Default Mappings

For a complete list of default LazyVim keybindings, see [LazyVim Keymaps](https://www.lazyvim.org/keymaps).

**Most Used:**
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>e` - Toggle file explorer
- `<leader>gg` - LazyGit
- `<C-/>` - Toggle terminal

## 🔌 Installed Plugins

### Essential Plugins

- **[LazyVim](https://github.com/LazyVim/LazyVim)** - Neovim config framework
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax parsing

### Coding Assistance

- **[blink.cmp](https://github.com/Saghen/blink.cmp)** - Completion engine
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration
- **[codeium.nvim](https://github.com/Exafunction/codeium.nvim)** - Codeium AI integration
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Linting

### UI Enhancements

- **[catppuccin](https://github.com/catppuccin/nvim)** - Color scheme
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Color scheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Status line
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Buffer tabs
- **[noice.nvim](https://github.com/folke/noice.nvim)** - Modern UI

### Language Support

- **LSPs**: gopls, pyright, rust-analyzer, typescript-language-server, html-lsp, css-lsp
- **Formatters**: gofumpt, black, prettier, shfmt
- **Linters**: shellcheck, eslint_d

## 🛠️ Customization

### Changing the Color Scheme

Edit `lua/config/lazy.lua` to modify the colorscheme preference:

```lua
install = { colorscheme = { "catppuccin", "tokyonight" } },
```

### Adding New Languages

Create a new file in `lua/plugins/lang/` following the existing patterns. Example structure:

```lua
return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "your-language" })
    end,
  },
  
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        your_lsp = {},
      },
    },
  },
}
```

### Modifying Dashboard

Edit `lua/plugins/ui/dashboard.lua` to customize the startup screen, including shortcuts and ASCII art.

**Happy Hacking! 🔐**
