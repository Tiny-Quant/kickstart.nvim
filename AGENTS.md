# AGENTS.md - Neovim Configuration Guide

## Overview

This is a Neovim configuration based on kickstart.nvim. The codebase consists of Lua configuration files, primarily in `lua/` directory. There is no traditional build system or test runner.

## Build / Lint / Test Commands

### Formatting (Required)

This project uses **stylua** for Lua code formatting. All Lua files must be formatted before commits.

```bash
# Check formatting (for CI/local verification)
stylua --check .

# Auto-format all Lua files
stylua .
```

The stylua configuration is in `.stylua.toml`:
- Column width: 160
- Indent: 2 spaces
- Quote style: AutoPreferSingle
- Line endings: Unix

### Plugin Management

Manage plugins via lazy.nvim built-in commands (run inside Neovim):

```bash
# Open plugin manager
nvim +Lazy

# Update plugins
:Lazy update

# Check plugin health
:checkhealth
```

### Code Quality Checks

```bash
# Full health check (includes plugin diagnostics)
nvim +checkhealth

# Run stylua as part of CI (GitHub Actions)
# See .github/workflows/stylua.yml
```

---

## Code Style Guidelines

### Indentation

- **Use 2 spaces** for indentation (matching stylua and kickstart convention)
- Include modeline at end of files: `-- vim: ts=2 sts=2 sw=2 et`
- Options files use 4 spaces for `vim.o.*` settings - this is an exception

### Imports

Use single quotes without parentheses for requires:

```lua
-- Good (kickstart style)
require 'options'
require 'keymaps'
require 'lazy-bootstrap'

-- Avoid
require("options")
require("lazy-bootstrap")
```

### Plugin Specifications

Plugin definitions return `LazySpec` tables:

```lua
---@module 'lazy'
---@type LazySpec
return {
  { 'author/plugin-name',
    event = 'VimEnter',
    opts = { key = value },
    config = function(_, opts) require('plugin').setup(opts) end,
    dependencies = {
      { 'depend/dependency.nvim', build = 'make' },
    },
  },
}
```

### Options

- Global options: `vim.o.option_name = value`
- Buffer/window options: `vim.opt.option_name = value` (for table-like options)

```lua
vim.o.number = true
vim.o.tabstop = 2
vim.opt.listchars = { tab = '» ', trail = '·' }
```

### Keymaps

Use `vim.keymap.set` with descriptive `desc` field:

```lua
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
```

Valid modes: `'n'`, `'v'`, `'i'`, `'t'`, `{'n', 'v'}`.

### Autocommands

Use `vim.api.nvim_create_autocmd` with augroups:

```lua
local group = vim.api.nvim_create_augroup('group-name', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'lua',
  callback = function(args) vim.treesitter.start(args.buf) end,
  desc = 'Enable treesitter for lua',
})
```

### Error Handling

Use `pcall` for optional plugin loads:

```lua
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
```

### Type Annotations

Use LuaLS annotations for IDE support:

```lua
---@module 'lazy'
---@type LazySpec
---@param opts PluginConfig
---@diagnostic disable-next-line: missing-fields
```

### Naming Conventions

- Files: `snake_case.lua`
- Variables: `camelCase` (Lua standard)
- Module names: `require 'path.to.module'`
- Leader key: `<leader>` is space (`vim.g.mapleader = ' '`)

---

## Project Structure

```
nvim/
├── init.lua                  -- Entry point, loads options, keymaps, lazy
├── lua/
│   ├── options.lua          -- Global Neovim options
│   ├── keymaps.lua          -- Keybindings + autocommands
│   ├── lazy-bootstrap.lua   -- Lazy.nvim bootstrap
│   ├── lazy-plugins.lua     -- Plugin specifications
│   ├── kickstart/           -- Base kickstart configs
│   │   ├── health.lua
│   │   └── plugins/         -- Plugin configs (telescope, lsp, etc)
│   └── custom/              -- Custom user plugins
│       └── plugins/         -- Custom plugin configs
├── .stylua.toml             -- Formatter config
└── .github/workflows/       -- CI (stylua check)
```

---

## Common Tasks

### Adding a New Plugin

1. Create `lua/custom/plugins/<plugin-name>.lua`
2. Return LazySpec table (see Plugin Specifications above)
3. Add `require 'custom.plugins.<plugin-name>'` to `lazy-plugins.lua`

### Adding a New Keymap

Add to `lua/keymaps.lua`:

```lua
vim.keymap.set('n', '<leader>key', '<cmd>Command<CR>', { desc = '[D]escription' })
```

### Modifying Options

Edit `lua/options.lua` following existing patterns.

---

## Important Notes

- This is a Neovim config, not an application - no production deployment
- Lazy-loading is used for performance (event/cmd/keys spec keys)
- Some plugins may require external tools (make, git, language servers)
- Run `:Lazy` inside Neovim to manage plugins and see status
