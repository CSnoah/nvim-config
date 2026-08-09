-- if vim.fn.has("clipboard") == 1 then
--   vim.opt.clipboard = "unnamedplus"
-- end

-- vim.api.nvim_create_autocmd("VimEnter", {
--   once = true,
--   callback = function()
--     vim.opt.clipboard = "unnamedplus"
--   end,
-- })

-- vim.keymap.set('n', '<leader>y', function()
--     vim.opt.clipboard = "unnamedplus"
--     print("Clipboard enabled!")
-- end)


-- -- Yank to system clipboard
-- vim.keymap.set('n', '<leader>Y', '"+y')
-- -- Paste from system clipboard
-- vim.keymap.set('n', '<leader>P', '"+p')

-- -- Copy to system clipboard (yank)
-- vim.keymap.set({'n','v'}, '<C-c>', '"+y', { noremap = true, silent = true })
--
-- -- Paste from system clipboard
-- vim.keymap.set({'n','v'}, '<C-v>', '"+p', { noremap = true, silent = true })
--
-- ~/.config/nvim/lua/clipboard_init.lua

-- local uv = vim.loop
-- local tmpfile = uv.os_tmpdir() .. "/nvim_clipboard_initialized"
--
-- -- Only enable clipboard if the temp file doesn't exist
-- if uv.fs_stat(tmpfile) == nil then
--     -- First time this shell session
--     vim.opt.clipboard = "unnamedplus"
--     
--     -- Create the file to remember we initialized
--     local fd = uv.fs_open(tmpfile, "w", 420)  -- 420 = 0644
--     if fd then
--         uv.fs_write(fd, "1", -1)
--         uv.fs_close(fd)
--     end
-- end


-- -- Yank visual selection to system clipboard
-- vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
--
-- -- Paste from system clipboard in normal mode
-- vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })
--
-- -- Paste from system clipboard in insert mode
-- vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
--




-- -- Normal mode: copy current line to system clipboard
-- vim.keymap.set('n', 'yy', '"+yy', { noremap = true, silent = true })
--
-- -- Normal mode: paste from system clipboard after cursor
-- vim.keymap.set('n', 'p', '"+p', { noremap = true, silent = true })
