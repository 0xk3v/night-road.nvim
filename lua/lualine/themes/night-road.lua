local c = require("night-road.palette")

local theme = {
	normal = {
		a = { fg = c.bg, bg = c.teal_bright, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.subtle, bg = c.bg },
	},

	insert = {
		a = { fg = c.bg, bg = c.green, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.subtle, bg = c.bg },
	},

	visual = {
		a = { fg = c.bg, bg = c.purple, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.subtle, bg = c.bg },
	},

	replace = {
		a = { fg = c.bg, bg = c.red, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.subtle, bg = c.bg },
	},

	command = {
		a = { fg = c.bg, bg = c.amber, gui = "bold" },
		b = { fg = c.text, bg = c.surface },
		c = { fg = c.subtle, bg = c.bg },
	},

	inactive = {
		a = { fg = c.muted, bg = c.bg },
		b = { fg = c.muted, bg = c.bg },
		c = { fg = c.muted, bg = c.bg },
	},
}

return theme
