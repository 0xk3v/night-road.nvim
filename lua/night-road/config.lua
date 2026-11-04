local M = {}

M.defaults = {
	transparent = true,
	terminal_colors = true,

	styles = {
		comments = { italic = true },
		keywords = { bold = false, italic = false },
		functions = { bold = false },
		variables = {},
	},

	integrations = {
		treesitter = true,
		lsp = true,
		diagnostics = true,
		plugins = true,
	},
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})

	return M.options
end

function M.get()
	return M.options
end

return M
