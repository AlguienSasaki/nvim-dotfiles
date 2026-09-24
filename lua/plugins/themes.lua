-- Lua with Lazy.nvim:
return {
	-- Adwaita, aún no se si me gusta o no jaja.
	{
	    "Mofiqul/adwaita.nvim",
	    lazy = false,
	    enabled = false,
	    priority = 1000,
	    
	    -- configure and set on startup
	    config = function()
	        vim.g.adwaita_darker = false -- for darker version
	        vim.g.adwaita_disable_cursorline = true -- to disable cursorline
	        vim.g.adwaita_transparent = true        -- makes the background transparent
	        vim.cmd('colorscheme adwaita')
	    end
	},

	-- Kanagawa, el q ya usaba p.
	{
	    "rebelot/kanagawa.nvim",
	    lazy = false,
	    enabled = true,
	    priority = 1000,
	    opts = {

		        compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
    local theme = colors.theme
        return {

                
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                FloatTitle =  { bg = "none" },

                -- Save an hlgroup with dark background and dimmed foreground
                -- so that you can use it where your still want darker windows.
                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                -- Popular plugins that open floats will link to NormalFloat by default;
                -- set their background accordingly if you wish to keep them dark and borderless
                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                -- Telescope
                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = "none", bg = theme.ui.bg_p1},
                TelescopeResultsNormal = { fg = "none", bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = "none", bg = theme.ui.bg_m1 },
                TelescopePreviewNormal = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },

                }
        end,
    theme = "wave",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },

	    },

	    


},

}
