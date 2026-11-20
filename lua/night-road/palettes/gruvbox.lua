-- Gruvbox: hard dark surfaces, orange accent, gruvbox's own hues for syntax.
return {
	-- Backgrounds
	bg = "#1d2021",
	bg_deep = "#141617", -- sidebars, tabline, inactive statusline
	surface = "#282828", -- floats, popups, cursorline
	overlay = "#32302f", -- folds, scrollbars, quickfix line

	-- Foregrounds
	muted = "#948677", -- comments, line numbers
	subtle = "#bdae93",
	text = "#ebdbb2",

	-- Accents
	red = "#fc7464", -- control flow only, sparse
	red_bright = "#fc7464", -- errors only
	red_dim = "#fc7464", -- conditionals, loops, exceptions
	amber = "#fabd2f", -- numbers, constants
	amber_dim = "#b8bb26", -- strings
	green = "#fe8e32", -- functions, cursor, headings
	green_dim = "#af6d3c",
	git_add = "#b8bb26", -- git and diff additions
	blue = "#bdae93", -- builtin types, modules
	blue_bright = "#d5c4a1", -- properties, members
	teal = "#8ec07c", -- types
	teal_bright = "#95b2a7", -- function calls
	purple = "#da99aa", -- keywords

	-- UI
	border = "#3c3836",
	selection = "#483423",
	selection_fg = "#f6e4d5",
	search = "#3d3524",

	-- Diff backgrounds
	diff_add = "#14291f",
	diff_change = "#14242b",
	diff_delete = "#2a1513",

	-- Terminal ANSI colors 0-15. The roles above aren't ANSI hues in this variant.
	ansi = {
		"#282828", -- 0: black
		"#fc7464", -- 1: red
		"#98971a", -- 2: green
		"#d79921", -- 3: yellow
		"#458588", -- 4: blue
		"#b16286", -- 5: magenta
		"#689d6a", -- 6: cyan
		"#bdae93", -- 7: white
		"#948677", -- 8: bright black
		"#fc7464", -- 9: bright red
		"#b8bb26", -- 10: bright green
		"#fabd2f", -- 11: bright yellow
		"#83a598", -- 12: bright blue
		"#d3869b", -- 13: bright magenta
		"#8ec07c", -- 14: bright cyan
		"#ebdbb2", -- 15: bright white
	},
}
