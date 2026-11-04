local M = {}

function M.setup(c)
	local hi = vim.api.nvim_set_hl

	-- Diff backgrounds
	hi(0, "DiffAdd", {
		fg = c.green,
		bg = c.diff_add,
	})

	hi(0, "DiffChange", {
		fg = c.blue_bright,
		bg = c.diff_change,
	})

	hi(0, "DiffDelete", {
		fg = c.red_bright,
		bg = c.diff_delete,
	})

	hi(0, "DiffText", {
		fg = c.text,
		bg = c.overlay,
		bold = true,
	})

	-- Generic diff groups
	hi(0, "Added", {
		fg = c.green,
	})

	hi(0, "Changed", {
		fg = c.blue_bright,
	})

	hi(0, "Removed", {
		fg = c.red_bright,
	})
end

return M
