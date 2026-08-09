<p align="center">
  <span style="font-size: 200px;"><strong>Neovim configuration 2026</strong></span>
</p>

### Plugins
| Plugin                                        | Purpose                                  | How I Use It                                                         |
| --------------------------------------------- | ---------------------------------------- | -------------------------------------------------------------------- |
| `rebelot/kanagawa.nvim`                       | Colorscheme                              | Provides the `kanagawa-wave` theme                                   |
| `windwp/nvim-autopairs`                       | Automatic brackets/quotes                | Automatically closes `()`, `[]`, `{}`, `""`, etc.                    |
| `nvim-treesitter/nvim-treesitter`             | Code parsing, highlighting & indentation | Provides syntax highlighting and indentation for supported languages |
| `JoosepAlviste/nvim-ts-context-commentstring` | Context-aware comments                   | Determines the correct comment syntax for languages such as JSX      |
| `numToStr/Comment.nvim`                       | Code commenting                          | `gcc` toggles a line comment and `gc` comments a visual selection    |
| `windwp/nvim-ts-autotag`                      | Automatic HTML/JSX tags                  | Automatically creates and updates closing tags                       |
| `nvim-telescope/telescope.nvim`               | Fuzzy finder & search                    | Find files, search text, find buffers, directories, and notes        |
| `nvim-lua/plenary.nvim`                       | Lua utility library                      | Dependency used by Telescope and Harpoon                             |
| `nvim-telescope/telescope-file-browser.nvim`  | File browser                             | Browse and manage files/directories through Telescope                |
| `ThePrimeagen/harpoon`                        | Quick file navigation                    | Bookmark frequently used files and jump to them instantly            |
| `echasnovski/mini.move`                       | Move lines/selections                    | Move lines or selections with `Alt` + arrow-style keys               |

### Keybindings
| Keybinding             | Plugin     | Action                         |
| ---------------------- | ---------- | ------------------------------ |
| `<leader>ff`           | Telescope  | Find files                     |
| `<leader>fg`           | Telescope  | Search text across files       |
| `<leader>fb`           | Telescope  | Search open buffers             |
| `<leader>fd`           | Telescope  | Find directories                |
| `<leader>fe`           | Telescope File Browser | Open file browser     |
| `<leader>fn`           | Telescope  | Find notes in `~/devnotes`     |
| `<leader>fN`           | Telescope File Browser | Browse `~/devnotes`  |
| `<C-j>`                | Telescope  | Move selection down             |
| `<C-k>`                | Telescope  | Move selection up               |
| `gcc`                  | Comment.nvim | Toggle comment on current line |
| `gc`                   | Comment.nvim | Comment/uncomment visual selection |
| `<leader>a`            | Harpoon    | Add current file to Harpoon     |
| `<leader>h`            | Harpoon    | Open Harpoon menu               |
| `<leader>1`             | Harpoon    | Jump to Harpoon file 1          |
| `<leader>2`             | Harpoon    | Jump to Harpoon file 2          |
| `<leader>3`             | Harpoon    | Jump to Harpoon file 3          |
| `<leader>4`             | Harpoon    | Jump to Harpoon file 4          |
| `<leader>]`             | Harpoon    | Go to next Harpoon file         |
| `<leader>[`             | Harpoon    | Go to previous Harpoon file     |
| `Alt + j`               | mini.move   | Move current line down          |
| `Alt + k`               | mini.move   | Move current line up            |
| `Alt + h`               | mini.move   | Move current line left          |
| `Alt + l`               | mini.move   | Move current line right         |

### Plugin Configurations
| Keybinding             | Plugin     | Action                         |
| ---------------------- | ---------- | ------------------------------ |
| `<leader>ff`           | Telescope  | Find files                     |
| `<leader>fg`           | Telescope  | Search text across files       |
| `<leader>fb`           | Telescope  | Search open buffers             |
| `<leader>fd`           | Telescope  | Find directories                |
| `<leader>fe`           | Telescope File Browser | Open file browser     |
| `<leader>fn`           | Telescope  | Find notes in `~/devnotes`     |
| `<leader>fN`           | Telescope File Browser | Browse `~/devnotes`  |
| `<C-j>`                | Telescope  | Move selection down             |
| `<C-k>`                | Telescope  | Move selection up               |
| `gcc`                  | Comment.nvim | Toggle comment on current line |
| `gc`                   | Comment.nvim | Comment/uncomment visual selection |
| `<leader>a`            | Harpoon    | Add current file to Harpoon     |
| `<leader>h`            | Harpoon    | Open Harpoon menu               |
| `<leader>1`             | Harpoon    | Jump to Harpoon file 1          |
| `<leader>2`             | Harpoon    | Jump to Harpoon file 2          |
| `<leader>3`             | Harpoon    | Jump to Harpoon file 3          |
| `<leader>4`             | Harpoon    | Jump to Harpoon file 4          |
| `<leader>]`             | Harpoon    | Go to next Harpoon file         |
| `<leader>[`             | Harpoon    | Go to previous Harpoon file     |
| `Alt + j`               | mini.move   | Move current line down          |
| `Alt + k`               | mini.move   | Move current line up            |
| `Alt + h`               | mini.move   | Move current line left          |
| `Alt + l`               | mini.move   | Move current line right         |

### Treesitter current languages
| Parser       | Language / File Type |
| ------------ | -------------------- |
| `python`     | Python               |
| `c`          | C                    |
| `cpp`        | C++                  |
| `lua`        | Lua                  |
| `vim`        | Vimscript            |
| `vimdoc`     | Vim documentation    |
| `query`      | Treesitter queries   |
| `javascript` | JavaScript           |
| `typescript` | TypeScript           |
| `tsx`        | TypeScript + JSX     |
| `html`       | HTML                 |

### Built-in Configurations
| Configuration                                       | Purpose                                                         |
| --------------------------------------------------- | --------------------------------------------------------------- |
| `vim.filetype.add()`                                | Adds/customizes filetype detection                              |
| `jsx = "javascriptreact"`                           | Treats `.jsx` files as JavaScript React                         |
| `js = "javascript"`                                 | Treats `.js` files as JavaScript                                |
| `vim.g.skip_ts_context_commentstring_module = true` | Disables the deprecated Treesitter context-commentstring module |
| `lazy.nvim`                                         | Installs and manages plugins                                    |
| `vim.opt.rtp:prepend(lazypath)`                     | Adds lazy.nvim to Neovim's runtime path                         |

