local palette = {
	-- Backgrounds
	bg = "#0d1918",
	bg_deep = "#070f0e", -- sidebars, tabline, inactive statusline
	surface = "#142321", -- floats, popups, cursorline
	overlay = "#1c2f2d", -- folds, scrollbars, quickfix line

	-- Foregrounds
	-- muted = "#7a7468", -- comments, line numbers (warm gray)
	muted = "#8c8778",
	subtle = "#b4c2be",
	text = "#f5f8f7",

	-- Accents: green #7fd3a8, amber #f6c177 and purple #c4a7e7 are the core
	-- accents. Everything else is a tint of those or a neutral.
	-- Coral (red) is the one color outside that family.
	red = "#e5826a", -- control flow only, sparse
	red_bright = "#f0735c", -- errors only
	red_dim = "#e5826a", -- conditionals, loops, exceptions (same value as red for now)
	amber = "#f6c177", -- numbers, constants
	amber_dim = "#d8aa6e", -- strings (a notch calmer than amber)

	green = "#7fd3a8", -- functions, cursor, headings, git add
	green_dim = "#5f8a7a",

	blue = "#9fb3ae", -- builtin types, modules: pale mint-gray
	blue_bright = "#9ccfd8", -- properties, members
	teal = "#7ab898", -- types, builtins: softened green
	teal_bright = "#abe2c6", -- function calls: lighter tint of green
	purple = "#c4a7e7", -- keywords

	-- UI
	border = "#2d4244",
	selection = "#244a37", -- green hue at low lightness
	selection_fg = "#d4f5e2",
	search = "#3b3524",

	-- Diff backgrounds
	diff_add = "#14291f",
	diff_change = "#14242b",
	diff_delete = "#2a1513",
}

return palette
