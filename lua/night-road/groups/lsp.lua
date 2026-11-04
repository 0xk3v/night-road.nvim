local M = {}

function M.setup(c)
	local hi = vim.api.nvim_set_hl

	-- References and UI
	hi(0, "LspReferenceText", { bg = c.overlay })
	hi(0, "LspReferenceRead", { bg = c.overlay })
	hi(0, "LspReferenceWrite", { bg = c.border, bold = true })
	hi(0, "LspInlayHint", { fg = c.muted, bg = c.surface, italic = true })
	hi(0, "LspCodeLens", { fg = c.muted, italic = true })
	hi(0, "LspCodeLensSeparator", { fg = c.border })
	hi(0, "LspSignatureActiveParameter", { fg = c.bg, bg = c.teal_bright, bold = true })

	-- Semantic tokens.
	-- Neovim already links @lsp.type.* to the matching treesitter capture
	-- (class -> @type, parameter -> @variable.parameter, ...), so we only
	-- override where we want something different.
	-- Functions: calls use the quiet color, declarations the bright one.
	hi(0, "@lsp.type.function", { link = "@function.call" })
	hi(0, "@lsp.type.method", { link = "@function.method.call" })
	hi(0, "@lsp.typemod.function.declaration", { link = "@function" })
	hi(0, "@lsp.typemod.method.declaration", { link = "@function.method" })

	-- Standard library
	hi(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
	hi(0, "@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
	hi(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })

	hi(0, "@lsp.mod.deprecated", { strikethrough = true, fg = c.muted })
end

return M
