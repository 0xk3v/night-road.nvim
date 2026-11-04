local M = {}

function M.setup(c, config)
	local styles = config.styles
	local hi = vim.api.nvim_set_hl

	hi(0, "Comment", { fg = c.muted, italic = styles.comments.italic })
	hi(0, "SpecialComment", { fg = c.subtle, italic = styles.comments.italic })

	-- Literals
	hi(0, "Constant", { fg = c.amber })
	hi(0, "String", { fg = c.amber_dim })
	hi(0, "Character", { link = "String" })
	hi(0, "Number", { fg = c.amber })
	hi(0, "Boolean", { fg = c.amber })
	hi(0, "Float", { link = "Number" })

	-- Names
	hi(0, "Identifier", { fg = c.text })
	hi(0, "Function", { fg = c.green, bold = styles.functions.bold })
	hi(0, "Type", { fg = c.teal })
	hi(0, "StorageClass", { link = "Keyword" })
	hi(0, "Structure", { link = "Type" })
	hi(0, "Typedef", { link = "Type" })

	-- Keywords: declarations are quiet purple, control flow is the sparse red
	hi(0, "Statement", { fg = c.purple, bold = styles.keywords.bold })
	hi(0, "Keyword", {
		fg = c.purple,
		bold = styles.keywords.bold,
		italic = styles.keywords.italic,
	})
	hi(0, "Label", { link = "Keyword" })
	hi(0, "Conditional", { fg = c.red_dim })
	hi(0, "Repeat", { fg = c.red_dim })
	hi(0, "Exception", { fg = c.red_dim })
	hi(0, "Operator", { fg = c.subtle })

	-- Preprocessor
	hi(0, "PreProc", { fg = c.purple })
	hi(0, "Include", { link = "PreProc" })
	hi(0, "Define", { link = "PreProc" })
	hi(0, "Macro", { link = "PreProc" })
	hi(0, "PreCondit", { link = "PreProc" })

	-- Misc
	hi(0, "Special", { fg = c.teal })
	hi(0, "SpecialChar", { fg = c.amber })
	hi(0, "Tag", { fg = c.purple })
	hi(0, "Delimiter", { fg = c.subtle })
	hi(0, "Debug", { fg = c.amber })
	hi(0, "Underlined", { fg = c.teal_bright, underline = true })
	hi(0, "Ignore", { fg = c.muted })
	hi(0, "Todo", { fg = c.bg, bg = c.amber, bold = true })
	hi(0, "Error", { fg = c.red_bright, bold = true })

	-- Added / Changed / Removed live in diff.lua
end

return M
