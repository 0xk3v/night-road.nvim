-- Blue hour: deep blue surfaces, sky-blue accent, gold constants, violet keywords.
return {
	-- Backgrounds
	bg = "#0b161b",
	bg_deep = "#060d10", -- sidebars, tabline, inactive statusline
	surface = "#121f25", -- floats, popups, cursorline
	overlay = "#192a32", -- folds, scrollbars, quickfix line

	-- Foregrounds
	muted = "#808fa0", -- comments, line numbers
	subtle = "#b4c3cf",
	text = "#f4f7fa",

	-- Accents
	red = "#ef8a7e", -- control flow only, sparse
	red_bright = "#ff6b6b", -- errors only
	red_dim = "#ef8a7e", -- conditionals, loops, exceptions
	amber = "#f2c98a", -- numbers, constants
	amber_dim = "#d6b07c", -- strings
	green = "#86c5ee", -- functions, cursor, headings
	green_dim = "#5d8099",
	git_add = "#8fd3a8", -- git and diff additions
	blue = "#a3b3c2", -- builtin types, modules
	blue_bright = "#9dd5cf", -- properties, members
	teal = "#82b2d0", -- types
	teal_bright = "#b6ddf6", -- function calls
	purple = "#bba8ea", -- keywords

	-- UI
	border = "#2a3d47",
	selection = "#233a48",
	selection_fg = "#d5e9f6",
	search = "#3d3324",

	-- Diff backgrounds
	diff_add = "#14291f",
	diff_change = "#14242b",
	diff_delete = "#2a1513",

	-- Terminal ANSI colors 0-15. The roles above aren't ANSI hues in this variant.
	ansi = {
		"#121f25", -- 0: black
		"#ef8a7e", -- 1: red
		"#6d9d7e", -- 2: green
		"#d6b07c", -- 3: yellow
		"#6fa8d6", -- 4: blue
		"#bba8ea", -- 5: magenta
		"#7cbdb6", -- 6: cyan
		"#b4c3cf", -- 7: white
		"#808fa0", -- 8: bright black
		"#ff6b6b", -- 9: bright red
		"#8fd3a8", -- 10: bright green
		"#f2c98a", -- 11: bright yellow
		"#86c5ee", -- 12: bright blue
		"#bba8ea", -- 13: bright magenta
		"#9dd5cf", -- 14: bright cyan
		"#f4f7fa", -- 15: bright white
	},
}
