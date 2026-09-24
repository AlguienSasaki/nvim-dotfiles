return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {

  options = {
    --style_preset = bufferline.style_preset.no_italic,
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree", 
        text = "File Explorer",
        text_align = "left",
        highlight = "Directory",
      }
    },
    --themable = true, -- esto va aquí si es necesario
  },
  highlights = {
    fill = {
      bg = "#282424",
      fg = "none",

    },
    modified_selected = {
      bg = "#e1e1e1",
      fg = "blue",
    },
    tab = {
      bg = "none",
      fg = "#ffffff",
    },
    tab_close = {
      bg = "#282424",
      fg = "red",
    },
    tab_selected = {
      bg = "#e1e1e1",
      fg = "#181825",
      bold = true,
    },
    tab_separator = {
      fg = '#282424', --aca el que cambie por red
      bg = 'none',
    },
    tab_separator_selected = {
      fg = '#282424',
      bg = '#e1e1e1',
    },
    background = {
      fg = "#ffffff",
      bg = "none", --cambio por none
    },
    buffer_selected = {
      bg = "#e1e1e1",
      fg = "#181825",
      bold = true,

    },
    buffer_visible = {
      bg = "none",
      fg = "#ffffff",
      bold = true,
     },
    separator = {
      fg = "#282424",
      bg = "none",
    },
    separator_selected = {
      fg = "#282424",
      bg = "#e1e1e1",
    },
    separator_visible = {
      fg = "#282424",
      bg = "none",
    },
    close_button_selected = {
      bg = "#e1e1e1",
      fg = "red",
    },
    close_button = {
      bg = "none",
      fg = "#ffffff",
    },
    close_button_visible = {
      bg = "none",
      fg = "#ffffff",
    },

  }

    }
  }

}
