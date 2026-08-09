-- plugins

-- filetype detction fix for jsx
vim.filetype.add({
    extension = {
        jsx = "javascriptreact",
        js = "javascript",
    }
})

-- diaable depricated module in nvim-treesitter
vim.g.skip_ts_context_commentstring_module = true

-- setup lazy.nvim
-- allows us to grab packages from github paths
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- plugin paths
local kanagawaColorScheme = "rebelot/kanagawa.nvim"
local autoPairs = "windwp/nvim-autopairs"
local nvimTreeSitter = "nvim-treesitter/nvim-treesitter"
local comment = "numToStr/Comment.nvim"
local commnetFileContext = "JoosepAlviste/nvim-ts-context-commentstring"
local autoTag = "windwp/nvim-ts-autotag" 
local miniMove = "echasnovski/mini.move"

local telescope = "nvim-telescope/telescope.nvim"
local plenary = "nvim-lua/plenary.nvim"

local telescopeFileBrowser = "nvim-telescope/telescope-file-browser.nvim"
local harpoon = "ThePrimeagen/harpoon"


-- list of plugins
require("lazy").setup({
    {
        kanagawaColorScheme,
        config = function()
            -- using a command to set the color scheme
            vim.cmd.colorscheme("kanagawa-wave")
        end
    },
    {
        autoPairs,
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end
    },
    { 
        --nvimTreeSitter,
        'nvim-treesitter/nvim-treesitter', 
        run= ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { 
                    "python", "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "html" }, 
                auto_install = true,
                highlight = { enable = true, },
                -- autotag depricated
                -- autotag = { enable = true },
                indent = { enable = true },
            })
        end
    },

    -- commentting code
    ----------------------------------------------------------------------------------------------------------
    {
        -- https://github.com/windwp/nvim-ts-autotag
        commnetFileContext,
        config = function()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end
    },
    {
        comment,
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
            })
        end
    },
    ----------------------------------------------------------------------------------------------------------
    
    -- autocomplete html,jsx,etc closing tags
    ----------------------------------------------------------------------------------------------------------
    {
        autoTag,
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    ----------------------------------------------------------------------------------------------------------

    -- telescope
    ----------------------------------------------------------------------------------------------------------
    {
      telescope,
      dependencies = {
          plenary,
          telescopeFileBrowser,
      },
      config = function()
          local builtin = require("telescope.builtin")
          local telescope = require("telescope")
          telescope.setup({
            defaults = {
              file_ignore_patterns = {
                "node_modules",
                ".git",
                "dist",
                "build"
              },
              mappings = {
                i = {  
                  -- insert mode (when typing in Telescope)
                  ["<C-j>"] = "move_selection_next",
                  ["<C-k>"] = "move_selection_previous",
                },
              },
            },
            extensions = {
              file_browser = {
                hijack_netrw = true,
                grouped = true,
                hidden = true,
                respect_gitignore = false,
              },
            },
        
          })

          telescope.load_extension("file_browser")

          vim.keymap.set("n", "<leader>ff", builtin.find_files)
          vim.keymap.set("n", "<leader>fg", builtin.live_grep)
          vim.keymap.set("n", "<leader>fb", builtin.buffers)

          -- vim.keymap.set("n", "<leader>fd", function()
          --   builtin.find_files({
          --     prompt_title = "find folder",
          --     find_command = {
          --       "find",
          --       ".",
          --       "-type",
          --       "d",
          --       "-not",
          --       "-path",
          --       "*/node_modules/*",
          --       "-not",
          --       "-path",
          --       "*/.git/*",
          --     },
          --   })
          -- end)
      
          vim.keymap.set("n", "<leader>fd", function()
            builtin.find_files({
              prompt_title = "find folder",
              find_command = {
                "fdfind",
                "--type",
                "d",
                "--exclude",
                ".git",
                "--exclude",
                "node_modules",
                "--exclude",
                "dist",
                "--exclude",
                "build",
              },
            })
          end)

          vim.keymap.set("n", "<leader>fe", function ()
            telescope.extensions.file_browser.file_browser()
            end
          )
          
          -- for my notes setup
          -- vim.keymap.set("n", "<leader>fn", function()
          --   telescope.extensions.file_browser.file_browser({
          --     path = "~/devnotes",
          --     prompt_title = "Notes",
          --   })
          -- end)

          -- vim.keymap.set("n", "<leader>fn", function()
          --   builtin.find_files({
          --     prompt_title = "notes",
          --     cwd = vim.fn.expand("~/devnotes"),
          --     find_command = {
          --       "fdfind",
          --       "--type",
          --       "d",
          --       "--exclude",
          --       ".git",
          --       "--exclude",
          --       "node_modules",
          --       "--exclude",
          --       "dist",
          --       "--exclude",
          --       "build",
          --     },
          --   })
          -- end)
        
          -- Search all notes
          vim.keymap.set("n", "<leader>fn", function()
            require("telescope.builtin").find_files({
              cwd = vim.fn.expand("~/devnotes"),
              prompt_title = "Find Notes",
            })
          end)

          -- Browse/manage notes
          vim.keymap.set("n", "<leader>fN", function()
            require("telescope").extensions.file_browser.file_browser({
              path = vim.fn.expand("~/devnotes"),
              cwd = vim.fn.expand("~/devnotes"),
              prompt_title = "Notes Browser",
            })
          end)

          end
        },

    -- harpoon
    ----------------------------------------------------------------------------------------------------------
    {
        harpoon,
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            local list = harpoon:list()

            -- add current file
            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon add file" })

            -- open harpoon menu
            vim.keymap.set("n", "<leader>h", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon menu" })

            -- jump to files
            vim.keymap.set("n", "<leader>1", function()
                harpoon:list():select(1)
            end)

            vim.keymap.set("n", "<leader>2", function()
                harpoon:list():select(2)
            end)

            vim.keymap.set("n", "<leader>3", function()
                harpoon:list():select(3)
            end)

            vim.keymap.set("n", "<leader>4", function()
                harpoon:list():select(4)
            end)

            -- navigate next/previous
            vim.keymap.set("n", "<leader>]", function()
                harpoon:list():next()
            end)

            vim.keymap.set("n", "<leader>[", function()
                harpoon:list():prev()
            end)
        end
    },
    -- mini.move
    ----------------------------------------------------------------------------------------------------------
  {
    miniMove,
    version = "*",
    config = function()
      require("mini.move").setup()
    end,
  },



})

