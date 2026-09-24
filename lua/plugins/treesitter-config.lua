return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main', -- Aseguramos que use la rama moderna
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").install({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "markdown",
        "markdown_inline",
        "rust",
        "javascript",
        "bash",
        "cpp",
        "latex"
      },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
    })
  end,
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
