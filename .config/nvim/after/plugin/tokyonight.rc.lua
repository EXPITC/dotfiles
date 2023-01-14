local status, t = pcall(require, 'tokyonight')
if (not status) then return end

t.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "night", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = {
      bold = true,
      italic = true
    },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  -- -@param colors ColorScheme
  on_colors = function(colors)
    colors.periwinkle = "#aba7e7"
    colors.error = '#d70101'
    colors.warning = "#e0af68"
    colors.information = "#0db9d7"
    colors.hint = "#10B981"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(hl, c, s)
    hl.LineNr = {
      fg = c.periwinkle
    }
    hl.TelescopeNormal = {
      bg = c.none,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.none,
      fg = c.purple,
    }
    hl.TelescopePromptNormal = {
      bg = c.none,
      fg = c.fg_dark,
    }
    hl.TelescopePromptBorder = {
      bg = c.none,
      fg = c.orange,
    }
    hl.TelescopePromptTitle = {
      bg = c.none,
      fg = c.orange,
    }
    hl.TelescopePreviewTitle = {
      bg = c.none,
      fg = c.orange,
    }
    hl.TelescopeResultsTitle = {
      bg = c.none,
      fg = c.orange,
    }
  end,
})

vim.cmd("colorscheme tokyonight-night")

local Color, colors, Group, groups, styles = require('colorbuddy').setup()
-- -- local Color = colorbuddy.Color
-- -- local colors = colorbuddy.colors
-- -- local Group = colorbuddy.Group
-- -- local groups = colorbuddy.groups
-- -- local styles = colorbuddy.styles
--
Color.new('black', '#000000')
-- -- Color.new('orange', '#7aa2f7')
Color.new('tcSignatureMain', "#aba7e7")
Color.new('tcSignatureSecond', "#9d7cd8")
Color.new('darkBlueGray', "#606387")
Color.new('desertSand', '#EBCFBA')
Color.new('sonicSilver', '#6d6e80')
Color.new('sunRay', '#efad51')
Color.new('blue0', "#3d59a1")
Color.new('blue', "#7aa2f7")
Color.new('comment', "#565f89")
Color.new('cursorLineNr', '#737aa2')
Color.new('cursorLine', '#292e42')
Color.new('fg_gutter', '#3b4261')
--
Group.new('cursorline', colors.none, colors.fg_gutter, styles.NONE, colors.fg_gutter)
Group.new('CursorLineNr', colors.orange, colors.black, styles.NONE, colors.orange)
Group.new('Visual', colors.none, colors.black, styles.reverse)
--
-- local cError = groups.Error.fg
-- local cInfo = groups.Information.fg
-- local cWarn = groups.Warning.fg
-- local cHint = groups.Hint.fg
-- --
-- Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
-- Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NOne)
-- Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
-- Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
-- Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
-- Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
