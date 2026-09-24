-- Here starts my own config, let's see how it works :)
-- By Alguien Sasaki

-- Funciones necesarias para que algunas cosas funcionen

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_user_command("GitBlameLine", function()
	local line_number = vim.fn.line(".")
	local filename = vim.api.nvim_buf_get_name(0)
	print(vim.fn.system({ "git", "blame", "-L", line_number .. ",+1", filename }))
end, { desc = "Print the git blame for the current line" })

vim.cmd("packadd! nohlsearch")

-- Definir la función NumberToggle primero
local function NumberToggle()
	vim.opt.number = not vim.opt.number:get()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end

-- Simple custom keybinds

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")

vim.keymap.set("n", "<leader>n", NumberToggle, { noremap = true })
vim.keymap.set("n", "<leader>w", ":w!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<leader>Q", ":wq!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- Ctrl + Shift + c for Clipboard outside neovim
vim.keymap.set("v", "<C-c>", [["*y :let @+=@*<CR>]], { noremap = true, silent = true })

-- Telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fc", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })

-- LSP Keybinds
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Formatting code with None LS
vim.keymap.set("n", "<leader>h", function()
	vim.lsp.buf.format({ async = true })
end)

-- DAP mappings

local dap = require("dap")
vim.keymap.set("n", "<Leader>B", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>c", function()
	require("dap").continue()
end)

vim.keymap.set("n", "<Leader>dl", function()
	require("dap").step_over()
end)

vim.keymap.set("n", "<Leader>bl", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)

--vim.keymap.set("n", "<leader>q", function()
--	local ok, dapui = pcall(require, "dapui")
--	local dapui_open = false
--
--	if ok then
--		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
--			local buf = vim.api.nvim_win_get_buf(win)
--			local ft = vim.bo[buf].filetype
--			if
--				ft:match("^dap%-")
--				or ft == "dapui_watches"
--				or ft == "dapui_stacks"
--				or ft == "dapui_breakpoints"
--				or ft == "dapui_scopes"
--				or ft == "dapui_console"
--			then
--				dapui_open = true
--				break
--			end
--		end
--	end
--
--	if dapui_open then
--		dapui.close()
--	else
--		vim.cmd("q")
--	end
--end, { noremap = true, silent = true, desc = "Cerrar dapui o ventana actual" })
