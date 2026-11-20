-- Catppuccin: Mocha colors with a peach accent. Syntax uses Mocha's spread of hues, not tints of the accent.
return {
	-- Backgrounds
	bg = "#12121c",
	bg_deep = "#0b0b12", -- sidebars, tabline, inactive statusline
	surface = "#1a1a28", -- floats, popups, cursorline
	overlay = "#232335", -- folds, scrollbars, quickfix line

	-- Foregrounds
	muted = "#7f849c", -- comments, line numbers
	subtle = "#bac2de",
	text = "#cdd6f4",

	-- Accents
	red = "#f38ba8", -- control flow only, sparse
	red_bright = "#f38ba8", -- errors only
	red_dim = "#eba0ac", -- conditionals, loops, exceptions
	amber = "#f9e2af", -- numbers, constants
	amber_dim = "#a6e3a1", -- strings
	green = "#fab387", -- functions, cursor, headings
	green_dim = "#9a7a64",
	git_add = "#a6e3a1", -- git and diff additions
	blue = "#74c7ec", -- builtin types, modules
	blue_bright = "#b4befe", -- properties, members
	teal = "#94e2d5", -- types
	teal_bright = "#89b4fa", -- function calls
	purple = "#cba6f7", -- keywords

	-- UI
	border = "#313244",
	selection = "#483123",
	selection_fg = "#f6e2d5",
	search = "#3d3524",

	-- Diff backgrounds
	diff_add = "#14291f",
	diff_change = "#14242b",
	diff_delete = "#2a1513",

	-- Terminal ANSI colors 0-15. The roles above aren't ANSI hues in this variant.
	ansi = {
		"#1a1a28", -- 0: black
		"#f38ba8", -- 1: red
		"#a6e3a1", -- 2: green
		"#f9e2af", -- 3: yellow
		"#89b4fa", -- 4: blue
		"#cba6f7", -- 5: magenta
		"#94e2d5", -- 6: cyan
		"#bac2de", -- 7: white
		"#7f849c", -- 8: bright black
		"#f38ba8", -- 9: bright red
		"#a6e3a1", -- 10: bright green
		"#f9e2af", -- 11: bright yellow
		"#b4befe", -- 12: bright blue
		"#cba6f7", -- 13: bright magenta
		"#89dceb", -- 14: bright cyan
		"#cdd6f4", -- 15: bright white
	},
}
