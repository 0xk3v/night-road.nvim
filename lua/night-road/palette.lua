local M = {}

-- Every variant has a palette in lua/night-road/palettes/<name>.lua.
M.variants = {
	"night",
	"blue-hour",
	"forest",
	"catppuccin",
	"gruvbox",
}

-- Keys every palette must define. The names describe the hues of the night
-- palette but are used as roles, e.g. "green" is functions, cursor, headings.
M.keys = {
	"bg",
	"bg_deep",
	"surface",
	"overlay",
	"muted",
	"subtle",
	"text",
	"red",
	"red_bright",
	"red_dim",
	"amber",
	"amber_dim",
	"green",
	"green_dim",
	"git_add",
	"blue",
	"blue_bright",
	"teal",
	"teal_bright",
	"purple",
	"border",
	"selection",
	"selection_fg",
	"search",
	"diff_add",
	"diff_change",
	"diff_delete",
}

M.default = "night"

--- Returns the palette for a variant. Errors on an unknown variant.
function M.get(variant)
	variant = variant or M.default

	if not vim.tbl_contains(M.variants, variant) then
		error(
			("night-road: unknown variant %q (available: %s)"):format(
				tostring(variant),
				table.concat(M.variants, ", ")
			),
			2
		)
	end

	return require("night-road.palettes." .. variant)
end

return M
