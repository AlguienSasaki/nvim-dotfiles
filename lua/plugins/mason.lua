return {

	{
		{
			"mason-org/mason.nvim",
			opts = {},
		},

		{
			"mason-org/mason-lspconfig.nvim",
			opts = {

				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"bashls",
					"texlab",
					"zk",
				},
			},
			dependencies = {
				{ "mason-org/mason.nvim", opts = {} },
				"neovim/nvim-lspconfig",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = false,

				methods = {
					diagnostics = true,
					formatting = true,
					code_actions = true,
					completion = true,
					hover = true,
				},

				ensure_installed = {
					"stylua",
					"black",
					"blackd",
					"pyink",
					"beautysh",
					"clang_format",
					"clang_check",
					"shfmt",
					"shellcheck",
					"isort",
					"autoflake",
				},
			})
		end,
	},
}
