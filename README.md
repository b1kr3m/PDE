# Neovim Development Configuration

A personal Neovim setup built on [LazyVim](https://www.lazyvim.org/) and
[lazy.nvim](https://github.com/folke/lazy.nvim). It provides a practical
environment for general software development, with language support for web
development, scripting, and systems programming.

<img width="1914" height="1076" alt="Neovim configuration screenshot" src="https://github.com/user-attachments/assets/4dd14a03-eb15-4b0b-aa56-971358d89bdc" />

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Features

- LazyVim defaults with local plugin specifications managed by lazy.nvim
- Language server, formatting, linting, and Treesitter configuration for
  Astro, C/C++, CSS, Go, HTML, JavaScript, React, Python, Rust, shell, and
  TypeScript
- Blink completion with GitHub Copilot integration
- Telescope file and text search, project navigation, and Neo-tree
- Aerial symbol outline and a custom Snacks dashboard
- Optional auto-save, disabled by default
- Live server commands for web development
- Git integration and Neotest support for Python and Go
- Gruvbox as the configured colorscheme

## Requirements

- Neovim
- Git
- A Nerd Font is recommended for icons
- Language runtimes and development tools are needed only for the languages
  and features you use

The configuration uses Mason for many language servers, formatters, and
linters. Some tools, such as project-specific test runners, may need to be
installed separately. Python tests use `pytest`; Go tests use the Go toolchain.

## Installation

Back up any existing Neovim configuration before cloning:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
git clone https://github.com/b1kr3m/PDE.git ~/.config/nvim
nvim
```

On first launch, lazy.nvim bootstraps itself and installs the configured
plugins. Mason-managed tools can be installed from within Neovim using
`:Mason`.

## Configuration

```text
.
├── init.lua
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── coding
│       ├── editor
│       ├── lang
│       └── ui
├── lazy-lock.json
└── lazyvim.json
```

`lua/config/` contains the core options, keymaps, autocommands, and plugin
manager setup. `lua/plugins/` contains local plugin and language
specifications. `lazy-lock.json` records installed plugin revisions, and
`lazyvim.json` lists enabled LazyVim extras.

## Key mappings

The leader key is Space. LazyVim provides the standard mappings for navigation,
LSP, Git, and other features; use `:WhichKey` to inspect the active mappings.

| Mapping | Description |
| --- | --- |
| `jj` in Insert mode | Return to Normal mode |
| `<leader>rr` | Compile and run the current C or C++ file with `g++` |
| `<leader>cs` | Toggle the Aerial symbol outline |
| `<leader>as` | Toggle auto-save |
| `<leader>cL` | Start the live server in an HTML buffer |
| `<leader>cl` | Stop the live server in an HTML buffer |

Auto-save is disabled by default. Enable it with `<leader>as` when desired.
The C/C++ mapping assumes `g++` is installed and writes the executable beside
the source file.

## Language tools

Language support is defined in `lua/plugins/lang/`. LSP servers, formatters,
and linters are configured through LazyVim's LSP support, Mason, Conform, and
nvim-lint. Available configurations include:

| Language or file type | Support |
| --- | --- |
| Astro | Astro language server and Prettier with the Astro plugin |
| C and C++ | clangd and clang-format |
| CSS and SCSS | CSS, Emmet, and Tailwind language servers; Prettier |
| Go | gopls, goimports, and gofumpt |
| HTML | HTML and Emmet language servers; Prettier and HTMLHint |
| JavaScript | TypeScript language server, ESLint, and Prettier |
| React | JSX and TSX support, Emmet, Tailwind, ESLint, and Prettier |
| Python | Pyright, isort, and Black |
| Rust | rust-analyzer through rust-tools |
| Shell | bash-language-server, shfmt, and ShellCheck |
| TypeScript | TypeScript language server, ESLint, and Prettier |

Lua formatting on save is intentionally disabled by a buffer-local setting.
For language server, formatter, and linter status, use `:LspInfo`,
`:ConformInfo`, and `:Mason`.

## Customization

- Edit `lua/config/options.lua` to change editor options.
- Edit `lua/config/keymaps.lua` to add global mappings.
- Add or update language specifications in `lua/plugins/lang/`.
- Update plugin specifications in the appropriate `lua/plugins/` directory.
- Use `:Lazy` to inspect plugins and apply plugin updates.

After changing plugin specifications, review `lazy-lock.json` and keep it
consistent with the configured plugins.
