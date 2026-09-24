return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},

		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

						-- For `mini.snippets` users:
						-- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
						-- insert({ body = args.body }) -- Insert at cursor
						-- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
						-- require("cmp.config").set_onetime({ sources = {} })
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
			-- Set configuration for specific filetype.
			-- cmp.setup.filetype("gitcommit", {
			-- 	sources = cmp.config.sources({
			-- 		{ name = "git" },
			-- 	}, {
			-- 		{ name = "nvim_lsp" },
			-- 		{ name = "luasnip" },
			-- 		{ name = "path" },
			-- 		{ name = "buffer" },
			-- 	}),
			-- })
			require("cmp_git").setup()
			--

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
			-- Obtener las capacidades necesarias para nvim-cmp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configuración moderna de los servidores LSP:
			--
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})

			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})

			vim.lsp.config("luals", {
				capabilities = capabilities,
			})

			vim.lsp.config("texlab", {
				capabilities = capabilities,
			})

			vim.lsp.enable("bashls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("luals")
			vim.lsp.enable("texlab")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{
		"petertriho/cmp-git",
		dependencies = { "hrsh7th/nvim-cmp" },
		init = function()
			table.insert(require("cmp").get_config().sources, { name = "git" })
		end,
		config = function()
			local format = require("cmp_git.format")
			local sort = require("cmp_git.sort")

			require("cmp_git").setup({
				-- defaults
				filetypes = { "gitcommit", "octo", "NeogitCommitMessage" },
				remotes = { "upstream", "origin" }, -- in order of most to least prioritized
				enableRemoteUrlRewrites = false, -- enable git url rewrites, see https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf
				git = {
					commits = {
						limit = 100,
						sort_by = sort.git.commits,
						format = format.git.commits,
						sha_length = 7,
					},
				},
				github = {
					hosts = {}, -- list of private instances of github
					issues = {
						fields = { "title", "number", "body", "updatedAt", "state" },
						filter = "all", -- assigned, created, mentioned, subscribed, all, repos
						limit = 100,
						state = "open", -- open, closed, all
						sort_by = sort.github.issues,
						format = format.github.issues,
					},
					mentions = {
						limit = 100,
						sort_by = sort.github.mentions,
						format = format.github.mentions,
					},
					pull_requests = {
						fields = { "title", "number", "body", "updatedAt", "state" },
						limit = 100,
						state = "open", -- open, closed, merged, all
						sort_by = sort.github.pull_requests,
						format = format.github.pull_requests,
					},
				},
				gitlab = {
					hosts = {}, -- list of private instances of gitlab
					issues = {
						limit = 100,
						state = "opened", -- opened, closed, all
						sort_by = sort.gitlab.issues,
						format = format.gitlab.issues,
					},
					mentions = {
						limit = 100,
						sort_by = sort.gitlab.mentions,
						format = format.gitlab.mentions,
					},
					merge_requests = {
						limit = 100,
						state = "opened", -- opened, closed, locked, merged
						sort_by = sort.gitlab.merge_requests,
						format = format.gitlab.merge_requests,
					},
				},
				trigger_actions = {
					{
						trigger_character = ":",
						actions = { "git_commits" },
					},
					{
						trigger_character = "#",
						actions = { "gitlab_issues", "github_issues_and_change_requests" },
					},
					{
						trigger_character = "@",
						actions = { "gitlab_mentions", "github_mentions" },
					},
					{
						trigger_character = "!",
						actions = { "gitlab_change_requests" },
					},
				},
			})
		end,
	},
}
