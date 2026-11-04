local M = {}

function M.setup(c, config)
	local transparent = config.transparent
	local bg = transparent and "NONE" or c.bg
	local deep = transparent and "NONE" or c.bg_deep

	local hi = vim.api.nvim_set_hl

	-- Base
	hi(0, "Normal", { fg = c.text, bg = bg })
	hi(0, "NormalNC", { fg = c.text, bg = bg })
	hi(0, "NormalFloat", { fg = c.text, bg = c.surface })
	hi(0, "FloatBorder", { fg = c.border, bg = c.surface })
	hi(0, "FloatTitle", { fg = c.teal_bright, bg = c.surface, bold = true })

	-- Cursor and lines
	hi(0, "Cursor", { fg = c.bg, bg = c.green })
	hi(0, "lCursor", { link = "Cursor" })
	hi(0, "CursorLine", { bg = c.surface })
	hi(0, "CursorColumn", { bg = c.surface })
	hi(0, "ColorColumn", { bg = c.surface })
	hi(0, "CursorLineNr", { fg = c.green, bold = true })
	hi(0, "LineNr", { fg = c.muted })
	hi(0, "SignColumn", { fg = c.muted, bg = bg })
	hi(0, "FoldColumn", { fg = c.muted, bg = bg })
	hi(0, "Folded", { fg = c.subtle, bg = c.overlay })
	hi(0, "WinSeparator", { fg = c.border })

	-- Selection and search
	hi(0, "Visual", { fg = c.selection_fg, bg = c.selection })
	hi(0, "Search", { fg = c.text, bg = c.search })
	hi(0, "CurSearch", { fg = c.bg, bg = c.amber })
	hi(0, "IncSearch", { fg = c.bg, bg = c.amber })
	hi(0, "Substitute", { fg = c.bg, bg = c.red_bright })
	hi(0, "MatchParen", { fg = c.green, bold = true, underline = true })

	-- Popup menu
	hi(0, "Pmenu", { fg = c.text, bg = c.surface })
	hi(0, "PmenuSel", { fg = c.bg, bg = c.teal_bright, bold = true })
	hi(0, "PmenuSbar", { bg = c.overlay })
	hi(0, "PmenuThumb", { bg = c.muted })
	hi(0, "WildMenu", { fg = c.bg, bg = c.teal_bright })

	-- Statusline, tabline, winbar
	hi(0, "StatusLine", { fg = c.text, bg = c.surface })
	hi(0, "StatusLineNC", { fg = c.muted, bg = deep })
	hi(0, "TabLine", { fg = c.muted, bg = deep })
	hi(0, "TabLineSel", { fg = c.text, bg = bg, bold = true })
	hi(0, "TabLineFill", { bg = deep })
	hi(0, "WinBar", { fg = c.subtle, bg = bg })
	hi(0, "WinBarNC", { fg = c.muted, bg = bg })

	-- Messages
	hi(0, "Directory", { fg = c.blue_bright, bold = true })
	hi(0, "Title", { fg = c.teal_bright, bold = true })
	hi(0, "ErrorMsg", { fg = c.red_bright, bold = true })
	hi(0, "WarningMsg", { fg = c.amber })
	hi(0, "MoreMsg", { fg = c.teal_bright })
	hi(0, "ModeMsg", { fg = c.teal })
	hi(0, "Question", { fg = c.teal_bright })
	hi(0, "QuickFixLine", { bg = c.overlay })

	-- Invisible characters
	hi(0, "Whitespace", { fg = c.border })
	hi(0, "NonText", { fg = c.border })
	hi(0, "SpecialKey", { fg = c.border })
	hi(0, "Conceal", { fg = c.muted })
	hi(0, "EndOfBuffer", { fg = c.bg })

	-- Spell
	hi(0, "SpellBad", { undercurl = true, sp = c.red_bright })
	hi(0, "SpellCap", { undercurl = true, sp = c.amber })
	hi(0, "SpellRare", { undercurl = true, sp = c.purple })
	hi(0, "SpellLocal", { undercurl = true, sp = c.teal })
end

return M
