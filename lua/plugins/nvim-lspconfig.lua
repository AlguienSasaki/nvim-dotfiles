return {
        "neovim/nvim-lspconfig",
        config = function()
                vim.lsp.config('rust_analyzer', {
                        -- Server-specific settings. See `:help lsp-quickstart`
                        settings = {
                                ['rust-analyzer'] = {},
                        },
                })

                -- Lua, no c lo saqué del dejault de :help lsp-quickstart
                vim.lsp.config['lua_ls'] = {
                        -- Command and arguments to start the server.
                        cmd = { 'lua-language-server' },
                        -- Filetypes to automatically attach to.
                        filetypes = { 'lua' },
                        -- Sets the "workspace" to the directory where any of these files is found.
                        -- Files that share a root directory will reuse the LSP server connection.
                        -- Nested lists indicate equal priority, see |vim.lsp.Config|.
                        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
                        -- Specific settings to send to the server. The schema is server-defined.
                        -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
                        settings = {
                                Lua = {
                                        runtime = {
                                                version = 'LuaJIT',
                                        }
                                }
                        }
                }

                -- Bash --
                vim.lsp.config.bashls = {
                        cmd = { 'bash-language-server', 'start' },
                        filetypes = { 'bash', 'sh' },
                        rootmarkers = { ".git" },
                        settings = {
                                bashIde = {
                                        globPattern = "*@(.sh|.inc|.bash|.command)"
                                }
                        }
                }

                -- Clangd para C y C++
                vim.lsp.config.clangd = {


                        cmd = { "clangd" },
                        capabilities = {
                                offsetEncoding = { "utf-8", "utf-16" },
                                textDocument = {
                                        completion = {
                                                editsNearCursor = true
                                        }
                                }
                        },

                        filetypes = { "c", "c.doxygen", "cpp", "cpp.doxygen", "objc", "objcpp", "cuda" },
                        rootmarkers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },

                }

                -- LaTeX
                vim.lsp.config.texlab = {
                        cmd = { "texlab" },
                        filetypes = { "tex", "plaintex", "bib" },
                        root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
                        settings = {
                                texlab = {
                                        bibtexFormatter = "texlab",
                                        build = {
                                                args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                                                executable = "latexmk",
                                                forwardSearchAfter = false,
                                                onSave = false
                                        },
                                        chktex = {
                                                onEdit = false,
                                                onOpenAndSave = false
                                        },
                                        diagnosticsDelay = 300,
                                        formatterLineLength = 80,
                                        forwardSearch = {
                                                args = {}
                                        },
                                        latexFormatter = "latexindent",
                                        latexindent = {
                                                modifyLineBreaks = false
                                        }
                                }
                        }
                }
                -- markdown para zettlekasten o algo así
                --
                vim.lsp.config.zk = {
                        cmd = { "zk", "lsp" },
                        markdown = { "markdown" },
                        root_markers = { ".zk" },
                        workspace_required = { true }
                }

                vim.lsp.enable('lua_ls')
                vim.lsp.enable('bashls')
                vim.lsp.enable('clangd')
                vim.lsp.enable('texlab')
        end





}
