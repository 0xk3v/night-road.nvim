-- Forest mist: deep green surfaces, lime accent, pale gold constants, sage properties, lilac keywords.
return {
	-- Backgrounds
	bg = "#0d1912",
	bg_deep = "#070f0b", -- sidebars, tabline, inactive statusline
	surface = "#14231b", -- floats, popups, cursorline
	overlay = "#1c2f24", -- folds, scrollbars, quickfix line

	-- Foregrounds
	muted = "#869b91", -- comments, line numbers
	subtle = "#b9c9bf",
	text = "#f2f7f3",

	-- Accents
	red = "#e9785e", -- control flow only, sparse
	red_bright = "#f2735a", -- errors only
	red_dim = "#e9785e", -- conditionals, loops, exceptions
	amber = "#e8cf86", -- numbers, constants
	amber_dim = "#cfb478", -- strings
	green = "#8fdc5c", -- functions, cursor, headings
	green_dim = "#6a8a55",
	git_add = "#8fdc5c", -- git and diff additions
	blue = "#a8b8ae", -- builtin types, modules
	blue_bright = "#9cc9bd", -- properties, members
	teal = "#8fbf72", -- types
	teal_bright = "#bde99c", -- function calls
	purple = "#c0a8e4", -- keywords

	-- UI
	border = "#2d4337",
	selection = "#324823",
	selection_fg = "#e2f6d5",
	search = "#3d3624",

	-- Diff backgrounds
	diff_add = "#14291f",
	diff_change = "#14242b",
	diff_delete = "#2a1513",

	-- Terminal ANSI colors 0-15. The roles above aren't ANSI hues in this variant.
	ansi = {
		"#14231b", -- 0: black
		"#e9785e", -- 1: red
		"#6e9753", -- 2: green
		"#cfb478", -- 3: yellow
		"#7fa3c9", -- 4: blue
		"#c0a8e4", -- 5: magenta
		"#7ab3a6", -- 6: cyan
		"#b9c9bf", -- 7: white
		"#869b91", -- 8: bright black
		"#f2735a", -- 9: bright red
		"#8fdc5c", -- 10: bright green
		"#e8cf86", -- 11: bright yellow
		"#a3c1e0", -- 12: bright blue
		"#c0a8e4", -- 13: bright magenta
		"#9cc9bd", -- 14: bright cyan
		"#f2f7f3", -- 15: bright white
	},
}
