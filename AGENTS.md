# Neovim Configuration Guide for Agents

This file describes the current behavior of this repository. Read it before
changing the configuration. The repository is a personal Neovim setup built
on LazyVim and lazy.nvim, aimed at general development with a strong web,
scripting, and security-research workflow.

The Lua files and `lazy-lock.json` are the source of truth. `README.md` is a
user-facing overview and can lag behind the actual configuration. In
particular, the current source does not configure Codeium, although older
runtime data and some README text mention it.

## Agent rules

- Prefer existing LazyVim and lazy.nvim patterns over new abstractions.
- Keep changes focused on the requested behavior and preserve unrelated user
  changes.
- Use `apply_patch` for manual file edits.
- Prefer ASCII in new or modified files unless the surrounding file clearly
  requires another character set.
- Do not add or restore debugging support such as `nvim-dap`, DAP UI plugins,
  or `codelldb` unless explicitly requested.
- When removing a plugin, remove its active specs, dependencies, setup code,
  keymaps, lockfile entry, and stale local configuration where appropriate.
- Keep `lazy-lock.json` consistent with the configured plugin set.
- After Lua or plugin changes, run:

  `nvim --headless -u init.lua '+qa'`

- Run `git diff --check` before finishing.
- In the final response, explain the cause of errors and summarize changed
  files and checks performed.

## Startup and load order

The entry point is `init.lua`:

1. It requires `config.lazy`.
2. `config.lazy` bootstraps `folke/lazy.nvim` into
   `vim.fn.stdpath("data") .. "/lazy/lazy.nvim"` if it is missing. The clone
   uses the `stable` branch and a filtered Git clone.
3. lazy.nvim prepends itself to the runtime path and imports LazyVim plus the
   three local plugin namespaces:

   - `lazyvim.plugins`
   - `plugins.editor`
   - `plugins.lang`
   - `plugins.ui`

4. LazyVim loads the normal `lua/config` files and its default plugin specs.
5. `init.lua` disables the Node provider with
   `vim.g.loaded_node_provider = 0` after loading the plugin manager.

lazy.nvim is configured with `version = false`, so plugins normally track
their configured branch/ref while the checked-in `lazy-lock.json` pins the
installed commits. The install fallback colorschemes are `catppuccin` and
`tokyonight`. The update checker is enabled but notifications are disabled.

For startup performance, the built-in runtime plugins `gzip`, `matchit`,
`matchparen`, `netrwPlugin`, `tarPlugin`, `tohtml`, `tutor`, and `zipPlugin`
are disabled.

## Repository map

| Path | Role |
| --- | --- |
| `init.lua` | Entry point and Node provider disablement |
| `lua/config/lazy.lua` | lazy.nvim bootstrap, LazyVim import, local plugin imports |
| `lua/config/options.lua` | Leader keys and global editor options |
| `lua/config/keymaps.lua` | Custom global keymaps |
| `lua/config/autocmds.lua` | Custom autocommands |
| `lua/plugins/editor/` | Aerial, auto-save, live server, Telescope, Neotest |
| `lua/plugins/lang/` | Treesitter, LSP, Mason, formatting, and linting by language |
| `lua/plugins/ui/dashboard.lua` | Snacks dashboard and project shortcuts |
| `lazyvim.json` | Enabled LazyVim extras |
| `lazy-lock.json` | Locked plugin commits |
| `stylua.toml` | Lua formatting: spaces, width 2, column width 120 |
| `.luarc.json` | Lua LS diagnostic suppression for `undefined-doc-name` |
| `.neoconf.json` | Enables Neodev library/plugin support and Lua LS via Neoconf |
| `kitty.sh` | Optional Kitty wrapper that removes terminal padding while Neovim runs |

## Core options and behavior

`lua/config/options.lua` sets the leader before lazy.nvim loads plugins:

- `mapleader = " "` (space)
- `maplocalleader = "\\"`
- Absolute and relative line numbers are enabled.
- Mouse support is enabled in all modes.
- Search ignores case unless the search contains uppercase characters.
- Search highlighting is enabled.
- Line wrapping is disabled; break indentation is enabled.
- Tabs use two spaces, with `expandtab = true`.
- The system clipboard is shared through `unnamedplus`.
- Completion uses `menu,menuone,noselect`.
- `updatetime = 250` and `timeoutlen = 300`.

`lua/config/autocmds.lua` disables LazyVim's normal autoformat behavior for
Lua buffers by setting `vim.b.autoformat = false` on `FileType=lua`. This is a
buffer-local exception; do not assume format-on-save is active for Lua.

Custom global keymaps in `lua/config/keymaps.lua`:

| Mode | Mapping | Behavior |
| --- | --- | --- |
| Insert | `jj` | Escape to Normal mode |
| Normal | `<leader>rr` | Compile the current C/C++ file with `g++`, then run `./%:r` |

The C++ mapping shells out to `g++ -o %:r % && ./%:r`; it assumes a compiler,
an executable output path, and a suitable current file. It is not a general
build system.

## LazyVim extras

`lazyvim.json` enables these extras in addition to the base LazyVim setup:

- AI: Copilot
- Editor: Illuminate and Snacks picker
- Languages: Astro, Git, and JSON
- UI: dashboard-nvim and mini.animate
- Utilities: dot and mini.hipatterns

The local `lua/plugins/ui/dashboard.lua` also configures the dashboard inside
`folke/snacks.nvim`. That Snacks dashboard is the active custom dashboard;
the LazyVim dashboard-nvim extra may still install its plugin as a dependency
or compatibility component.

## Editor plugins and custom behavior

### Aerial: `lua/plugins/editor/aerial.lua`

- Loads on `LazyFile`; `<leader>cs` toggles the symbol outline.
- Uses LSP, Treesitter, Markdown, AsciiDoc, and man-page backends.
- Attaches globally, prefers the right edge, uses a 30-column width with a
  20-column minimum and a 40-column/20-percent maximum constraint.
- Keeps the outline open unless explicitly closed (`close_automatic_events` is
  empty) and displays tree guides.
- Filters the visible symbol kinds to classes, constructors, enums, functions,
  interfaces, modules, methods, and structs.
- Enter or double-click jumps; `Ctrl-v` and `Ctrl-s` jump to vertical or normal
  splits. `q` closes. `o`/`za` toggle a tree node and `O`/`zA` toggle it
  recursively. Standard Aerial fold/navigation keys are customized in the
  source for `h`, `l`, `H`, `L`, `{`, `}`, `[[`, `]]`, `zr`, `zR`, `zm`, `zM`,
  `zx`, and `zX`.
- Depends on Treesitter and web-devicons and includes a custom symbol icon
  table. Keep the icon table in the source as the authority for exact glyphs.

### Auto-save: `lua/plugins/editor/auto-save.lua`

- Plugin: `okuuva/auto-save.nvim`, loaded on `InsertLeave` and `TextChanged`.
- Auto-save is intentionally disabled at startup (`enabled = false`). The
  inline comment saying "Start enabled by default" is stale; trust the value.
- `<leader>as` runs `:ASToggle`.
- Immediate saves happen on `BufLeave`, `FocusLost`, `QuitPre`, and
  `VimSuspend`. Deferred saves happen on `InsertLeave` and `TextChanged`, are
  canceled on `InsertEnter`, and wait 1000 ms.
- It saves only the current buffer (`write_all_buffers = false`), does not use
  `noautocmd` or `lockmarks`, and debug logging is disabled.
- It refuses special buffers and excludes filetypes `gitcommit`, `gitrebase`,
  `NvimTree`, `neo-tree`, `Outline`, `TelescopePrompt`, `alpha`, `dashboard`,
  `lazygit`, `oil`, `prompt`, `toggleterm`, `mason`, `lazy`, `help`, and `qf`.
  `.env` and `.env.local` are also excluded by filename.
- User events produce notifications when a file is saved or auto-save is
  enabled/disabled.

### Live server: `lua/plugins/editor/live-server.lua`

- Loads only for the LiveServer commands or HTML/CSS/JavaScript/React
  filetypes.
- `<leader>cL` starts and `<leader>cl` stops the server on HTML buffers.
- `vim.g.live_server` sets port `5050`, opens a browser automatically, and
  enables CSS injection. `LiveServerToggle` is also available as a command.

### Telescope and projects: `lua/plugins/editor/telescope.lua`

- Telescope is forced to load immediately because the dashboard and other UI
  components use it.
- Dependencies are plenary and `ahmedkhalf/project.nvim`.
- Project.nvim is initialized with default options and the Telescope projects
  extension is loaded.
- Telescope defaults use a search prompt prefix, a right-arrow selection
  caret, smart path display, and ignore `node_modules` and `.git/`.

### Test runner: `lua/plugins/editor/test.lua`

- LazyVim's `lazyvim.plugins.extras.test.core` extra is enabled in
  `lazyvim.json`.
- Neotest is configured with the Python and Go adapters. DAP is not enabled.
- Python uses the `pytest` runner; install `pytest` in the project's virtual
  environment.
- Go passes `-count=1` to avoid reusing cached test results; the project must
  provide the normal `go test` toolchain.
- LazyVim supplies the test mappings: `<leader>tr` nearest test, `<leader>tt`
  current file, `<leader>tT` all tests, `<leader>ts` summary, `<leader>to`
  output, `<leader>tl` last test, `<leader>tS` stop, and `<leader>tw` watch.
- JavaScript/TypeScript, Rust, and other adapters are not configured yet. Add
  an adapter in this file only when the corresponding project test runner is
  chosen; do not add DAP as an indirect dependency.

LazyVim supplies the normal Telescope, Neo-tree, Snacks, Git, terminal,
completion, LSP, and Which-Key mappings. Use `:WhichKey` and `:Lazy` for the
effective runtime view instead of recreating LazyVim's full default mapping
table in this file.

## Language support

Each language file extends shared LazyVim specs. Treesitter parsers are added
through `opts.ensure_installed`; LSP servers are configured through
`nvim-lspconfig`; external tools are requested through Mason; formatters use
Conform; and linters use nvim-lint where configured.

| File | Treesitter parsers | LSP servers | Formatters | Linters |
| --- | --- | --- | --- | --- |
| `astro.lua` | `astro` | `astro` | `prettier` with Astro parser/plugin args | none |
| `cpp.lua` | `c`, `cpp` | `clangd` | `clang_format` | none |
| `css.lua` | `css`, `scss` | `cssls`, `emmet_ls`, `tailwindcss` | `prettierd`, then `prettier` | none |
| `go.lua` | `go`, `gomod`, `gowork`, `gosum` | `gopls` | `goimports`, then `gofumpt` | none |
| `html.lua` | `html` | `html`, `emmet_ls` | `prettierd`, then `prettier` | `htmlhint` |
| `javascript.lua` | `javascript`, `jsdoc`, `json`, `jsonc`, `regex` | `ts_ls`, `eslint` | `prettierd`, then `prettier` for JavaScript and JSON | `eslint_d` for JavaScript |
| `python.lua` | `python` | `pyright` | `isort`, then `black` | none; the flake8/mypy block is commented out |
| `react.lua` | `tsx` | `emmet_ls`, `tailwindcss` | `prettierd`, then `prettier` for JSX/TSX | `eslint_d` for JSX/TSX |
| `rust.lua` | `rust`, `toml` | configured through rust-tools | none | none |
| `shell.lua` | `bash` | `bashls` | `shfmt` | `shellcheck` |
| `typescript.lua` | `typescript`, `tsx` | `ts_ls`, `eslint` | `prettierd`, then `prettier` for TypeScript | `eslint_d` for TypeScript |

Details that matter when editing language support:

- C/C++ `clangd` is started with background indexing, clang-tidy, and detailed
  completion.
- C/C++ formatting maps both `c` and `cpp` to `clang_format`. The Mason spec
  in this file uses the short plugin string `mason.nvim`; preserve or correct
  that only as part of an intentional plugin change.
- CSS LSP covers CSS, SCSS, and Less; Emmet covers CSS and SCSS; Tailwind
  covers HTML, CSS, SCSS, and React filetypes.
- `gopls` enables gofumpt, staticcheck, placeholders, and the `unusedparams`
  analysis. Mason also requests `gomodifytags` and `impl`.
- HTML supports HTML, HTMDjango, and Blade in `html`; Emmet is limited to HTML
  and HTMDjango. HTML formatting and linting are separate Conform and nvim-lint
  concerns.
- JavaScript and TypeScript deliberately split `ts_ls` filetypes by language.
  Both enable import-statement and module-export completions. JavaScript uses
  `javascript` and `javascriptreact`; TypeScript uses `typescript` and
  `typescriptreact`.
- Python uses Pyright basic type checking, automatic search paths, and library
  type information. No debugger or DAP tool is configured.
- React adds `nvim-ts-autotag` on `InsertEnter`. It supports JSX/TSX and
  JavaScript/TypeScript React filetypes, enables closing and renaming tags, and
  disables close-on-slash.
- Rust loads `simrat39/rust-tools.nvim` only for Rust buffers. Its buffer-local
  mappings are `Ctrl-Space` for hover actions and `<Leader>a` for grouped code
  actions. Mason requests `rust-analyzer`; formatting and linting are not
  configured here.
- Astro has custom TypeScript SDK resolution. It first checks the project
  `node_modules/typescript/lib`, then the Mason TypeScript server copy, and
  selects a directory containing `tsserverlibrary.js` or `typescript.js`.
  Astro is manually enabled with `vim.lsp.config` and `vim.lsp.enable` because
  the normal Mason selection is incompatible with the Astro server version.
  Astro formatting passes the Astro parser and `prettier-plugin-astro`.
- Shell formatting and linting are configured for both `sh` and `bash`.

The explicit Mason `ensure_installed` names are:

`astro-language-server`, `typescript-language-server`, `prettierd`,
`prettier`, `clangd`, `clang-format`, `css-lsp`,
`tailwindcss-language-server`, `stylelint`, `gopls`, `gofumpt`, `goimports`,
`gomodifytags`, `impl`, `html-lsp`, `emmet-ls`, `htmlhint`,
`eslint-lsp`, `eslint_d`, `pyright`, `black`, and `isort`,
`rust-analyzer`, `bash-language-server`, `shellcheck`, and `shfmt`.

Mason may also have packages installed manually or left over from an older
setup. An installed binary is not proof that an LSP, formatter, linter, or
debugger is configured here.

## Dashboard and projects

`lua/plugins/ui/dashboard.lua` configures `folke/snacks.nvim` with
`lazy = false`, so the dashboard is available at startup. It uses an 80-column
layout with the custom ASCII header and sections for:

- Keymaps
- Recent files
- Projects
- Startup information

The dashboard preset exposes `f` find file, `n` new file, `g` find text, `r`
recent files, `c` config, `L` Lazy, and `q` quit. Actions use Telescope or
standard Ex commands.

The configured project shortcuts are:

| Name | Path | Icon |
| --- | --- | --- |
| Scripts | `/opt/scripts` | `♣` |
| Bug Bounty Scripts | `/opt/` | `♂` |
| Hyprland Config | `~/.config/hypr` | `✿` |
| unnamed | `~/dev/development/` | `♪` |

The large commented dashboard alternatives in the file are historical and
inactive. Do not edit them when changing the active dashboard unless cleanup
is explicitly requested.

## Plugin and runtime state

`lazy-lock.json` currently locks the LazyVim base and these plugin families:

- Core/UI: LazyVim, lazy.nvim, Snacks, catppuccin, tokyonight, lualine,
  bufferline, noice, mini.icons, mini.animate, mini.ai, mini.pairs,
  mini.hipatterns, nvim-web-devicons, which-key, and dashboard-nvim.
- Navigation/editor: Telescope, plenary, project.nvim, Aerial, auto-save,
  live-server, Neo-tree, flash, persistence, grug-far, todo-comments,
  vim-illuminate, and nvim-treesitter-textobjects.
- Coding/LSP: blink.cmp, blink-copilot, copilot.lua, friendly-snippets,
  conform, lazydev, nvim-lint, nvim-lspconfig, Mason, mason-lspconfig,
  Treesitter, nvim-ts-autotag, SchemaStore, ts-comments, trouble, and
  rust-tools, Neotest, nvim-nio, neotest-python, and neotest-go.
- Supporting UI/dependencies: nui.nvim and gitsigns.

The exact commit hashes and branches are in `lazy-lock.json`; update that file
through lazy.nvim rather than hand-inventing revisions.

At the time this document was written, the active user-level Neovim data was
under `~/.local/share/nvim`, state under `~/.local/state/nvim`, and cache under
`~/.cache/nvim`. The active data directory contained the locked plugin set and
Mason packages. These directories are runtime artifacts, not repository
configuration and should not be edited to implement a config change.

`~/.local/share.backup/nvim` is an older backup snapshot. It contains old
plugins such as Codeium, copilot-cmp, fzf-lua, lazygit.nvim, nvim-dap, and
vim-tmux-navigator. Some plugin names in that snapshot, such as rust-tools,
also exist in the current setup, but the backup copy and its state are still
not the current source of truth.
It is useful only for historical troubleshooting. Do not restore anything from
it unless the user explicitly asks for a migration.

The current Mason directory may still contain extra packages such as `delve`,
`debugpy`, `codelldb`, and `js-debug-adapter` from the previous setup, along
with `json-lsp`, `vtsls`, and `tree-sitter-cli`. Their presence does not mean
this config should gain debugger or additional LSP specs. The repository has
no active DAP plugin specs; the old DAP files were deleted.

## Maintenance and troubleshooting

Useful commands:

- `:Lazy` - inspect plugin specs, load state, and updates.
- `:Mason` - inspect external tools requested by the config.
- `:LspInfo` - verify the server attached to the current buffer.
- `:ConformInfo` - inspect formatter selection and availability.
- `:checkhealth` - inspect Neovim, provider, Treesitter, Mason, and plugin health.
- `:WhichKey` - inspect effective mappings, including LazyVim defaults.
- `:messages` - inspect startup/plugin notifications.

When a formatter or linter is not running, check the current filetype, the
project-local tool configuration, and Mason availability. Conform lists are
ordered fallback lists: for example, web formatting tries `prettierd` before
`prettier`. Lua is intentionally excluded from autoformat by the custom
autocmd.

When an LSP is not attaching, check `:LspInfo`, the server's filetypes, the
project root, and whether the Mason executable exists. Astro is the special
case: its custom TypeScript SDK resolution and manual enablement are required.

Avoid changing generated runtime state, lock revisions, or unrelated user
changes as part of a focused fix. After intentional plugin changes, verify the
source specs, dependencies, lockfile, and any removed local configuration all
agree.

## Validation checklist

From the repository root, run:

```sh
nvim --headless -u init.lua '+qa'
git diff --check
```

For language or plugin changes, also use `:Lazy`, `:Mason`, `:LspInfo`, and
`:ConformInfo` interactively when the change affects those systems. Do not
interpret old log entries in `~/.local/state/nvim` as proof that a current
source change is broken; reproduce the issue after the change and inspect the
newest messages.
