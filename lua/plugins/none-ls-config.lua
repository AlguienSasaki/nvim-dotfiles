return {
	{
		"nvimtools/none-ls-extras.nvim", -- Forzar carga explícita
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"gbprod/none-ls-shellcheck.nvim",
			"nvimtools/none-ls-extras.nvim", -- Required for ESLint support
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Formatters

					-- Stylua for lua
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					-- Clang for c++
					null_ls.builtins.formatting.clang_format,
					-- Black for python
					--null_ls.builtins.formatting.black.with({
					--        filetypes = { "python" },
					--}),
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.mypy,

					-- Bash
					--null_ls.builtins.formatting.beautysh,

					-- If you want diagnostics for shell scripts, use shellcheck instead:
					-- Bash Formatting
					null_ls.builtins.formatting.shfmt.with({
						extra_args = { "-i", "2", "-ci" }, -- Indent with 2 spaces, indent switch cases
					}),

					---- Bash Diagnostics (Linting)
					require("none-ls-shellcheck.diagnostics"),
					--require("none-ls-shellcheck.code_actions"),

					null_ls.builtins.completion.spell,
					require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				},
			})
		end,
	},
}
