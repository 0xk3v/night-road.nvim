local M = {}

function M.setup(c)
	local hi = vim.api.nvim_set_hl

	local diagnostics = {
		Error = c.red_bright,
		Warn = c.amber,
		Info = c.teal_bright,
		Hint = c.blue_bright,
		Ok = c.green,
	}

	for kind, color in pairs(diagnostics) do
		hi(0, "Diagnostic" .. kind, { fg = color })
		hi(0, "DiagnosticSign" .. kind, { fg = color })
		hi(0, "DiagnosticFloating" .. kind, { fg = color })
		hi(0, "DiagnosticVirtualText" .. kind, { fg = color, bg = c.surface })
		hi(0, "DiagnosticUnderline" .. kind, { undercurl = true, sp = color })
	end

	hi(0, "DiagnosticDeprecated", { strikethrough = true, fg = c.muted })
	hi(0, "DiagnosticUnnecessary", { fg = c.muted })
end

return M
