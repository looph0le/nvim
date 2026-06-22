# NVim Config — NvChad v2.5 User Config

This is an **NvChad user configuration** (not the framework itself). The NvChad repo is loaded as a lazy.nvim plugin (`NvChad/NvChad` branch `v2.5`). Core NvChad modules are imported via `require "nvchad.*"`.

## Structure

| Path | Purpose |
|------|---------|
| `init.lua` | Entrypoint — boots lazy.nvim, loads NvChad, local plugins, theme, options, autocmds, mappings |
| `lua/chadrc.lua` | NvChad theme/UI options (theme: `bearded-arc`, transparency enabled) |
| `lua/options.lua` | Local `vim.o`/`vim.g` overrides (relative numbers, Neovide settings) |
| `lua/mappings.lua` | Custom keymaps (`;` → command mode, `jk` → escape, Neovide zoom/transparency, LSP, DAP) |
| `lua/autocmds.lua` | Delegates to `nvchad.autocmds` |
| `lua/configs/` | Plugin configs (lazy.nvim, conform.nvim, lspconfig) |
| `lua/plugins/init.lua` | Imports all plugin subfiles |
| `lua/plugins/lsp.lua` | mason-tool-installer (auto-installs 12+ LSP servers + DAP + formatters) |
| `lua/plugins/debug.lua` | nvim-dap, nvim-dap-ui, nvim-dap-virtual-text |
| `lua/plugins/editor.lua` | flash.nvim, harpoon2, nvim-surround, vim-illuminate |
| `lua/plugins/ui.lua` | noice.nvim, dressing.nvim, trouble.nvim, nvim-bqf, nvim-colorizer, todo-comments |
| `lua/plugins/tools.lua` | toggleterm.nvim, undotree, persistence.nvim, neotest |

## Key plugins & features

- **Completion**: `blink.cmp` (via `nvchad.blink.lazyspec`)
- **Formatter**: `conform.nvim` — format on save (500ms timeout, LSP fallback). Lua → `stylua`, JS/TS/CSS/HTML/JSON/YAML/MD → `prettier`, Python → `ruff`, Rust → `rustfmt`, Shell → `shfmt`
- **LSP servers** (auto-installed via mason): `lua_ls`, `pyright`, `rust_analyzer`, `ts_ls`, `html`, `cssls`, `jsonls`, `yamlls`, `bashls`, `tailwindcss`, `emmet_ls`
- **Debugging**: `nvim-dap` with `dap-ui` (Python debugpy config included)
- **Navigation**: `flash.nvim` (jump labels, treesitter), `harpoon2` (file marks), `vim-illuminate` (word highlight)
- **UI**: `noice.nvim` (cmdline), `dressing.nvim` (dialogs), `trouble.nvim` (diagnostics panel), `nvim-bqf` (quickfix), `nvim-colorizer.lua` (hex previews), `todo-comments.nvim` (TODO/FIXME highlighting)
- **Tools**: `toggleterm.nvim` (floating/vertical terminals), `undotree`, `persistence.nvim` (auto session restore), `neotest` (test runner with Python support)
- **Copilot**: `copilot.vim` (loaded eagerly, `lazy = false`)

## Style

- `.stylua.toml`: 120 col width, Unix line endings, 2-space indent, double quotes, no parens on single-arg calls

## Neovide specifics

- Font: `CaskaydiaCove Nerd Font:h12`
- Opacity: `0.9` (with window blur enabled)
- Cursor vfx: `pixiedust` mode (particle density 2.0, lifetime 0.8)
- Keymaps: `<C-=>`/`<C-->` scale font, `<C-0>` reset, `<C-+>`/`<C-_>` adjust transparency

## Keymap cheat sheet

| Keys | Action |
|------|--------|
| `;` | Enter command mode |
| `jk` | Escape (insert) |
| `<M-h/j/k/l>` | Window navigation |
| `<A-j/k>` | Move lines |
| `gd`, `gr`, `gi`, `K` | LSP: definition, references, implementation, hover |
| `<leader>rn` | LSP rename |
| `<leader>ca` | LSP code action |
| `<F5>` `F10` `F11` `F12` | DAP continue, step over, step into, step out |
| `<leader>db` / `<leader>du` | DAP toggle breakpoint / UI |
| `<C-h/j/k/l>` | Harpoon file 1–4 |
| `<leader>a` | Harpoon add file |
| `s` / `S` | Flash jump / Flash treesitter |
| `<C-\>` | Toggle terminal |
| `<leader>xx` | Trouble diagnostics |
| `<leader>tr` `ts` | Neotest run / toggle summary |
| `<leader>qs` `ql` | Session save / load |

## Developer notes

- No CI, no tests, no pre-commit hooks
- `lazy-lock.json` pins all plugin versions — commit when updating
- To add or modify a plugin: edit the corresponding file in `lua/plugins/` (one per subcategory); add new imports in `lua/plugins/init.lua`
- LSP servers are auto-installed on first use via `mason-tool-installer`. To add one, update both `lua/plugins/lsp.lua` (install list) and `lua/configs/lspconfig.lua` (setup)
- For NvChad API docs, refer to `NvChad/NvChad` and `NvChad/ui`
