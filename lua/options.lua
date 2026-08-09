-- prints every time we launch neovim 
-- print("Good Morning Noah!")

-- Don't automatically continue comments onto new lines
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})


-- disable lowercase when u in visual mode
vim.keymap.set("x", "u", "<Esc>")

-- change the leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- show file path on document(i use for checking importing path)
vim.opt.statusline = "%F"

-- adding line numbers
vim.opt.number = true

-- show line nubers relative to the line currently on
vim.opt.relativenumber = true

-- have new windows open on the bottom
vim.opt.splitbelow = true

-- have new windows that open vertically open on the right
vim.opt.splitright = true

-- disable line wraping
-- vim.opt.wrap = false
vim.opt.wrap = true

-- -- enable spaces instead of tabs
vim.opt.expandtab = true

-- customize the number of spaces make up a tab
-- applies when saving and opening a file
-- vim.opt.tabstop = 4
vim.opt.tabstop = 2

-- customize the number of spaces that make up a tab
-- applies when using << or >>
-- vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 2

-- have neovim interact with the clipboard
vim.opt.clipboard = "unnamedplus"

-- -- keeps the cursor in the middle of the screen when scrolling
-- vim.opt.scrolloff = 999

-- visual block mode remove the limitation of not being able to
-- heilight past empty characters
-- vim.opt.virtualedit = "block"

-- refactoring will show in a split window
vim.opt.inccommand = "split"

-- recognizes : commands if type lower case but the function is actuall upper case
vim.opt.ignorecase = true;

-- enables a wider variety of colors
vim.opt.termguicolors = true

-- set a key binding to enter block mode -- it works without this --
vim.api.nvim_set_keymap('n', '<C-q>', '<C-v>', { noremap = true, silent = true})
