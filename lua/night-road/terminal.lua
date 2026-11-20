local M = {}

-- ANSI colors from palette roles. Variants whose roles don't match the ANSI
-- hues (e.g. an orange "green") can define `ansi`, a list of 16 colors.
local function from_roles(c)
	return {
		c.surface, -- 0: black
		c.red, -- 1: red
		c.green_dim, -- 2: green
		c.amber_dim, -- 3: yellow
		c.blue, -- 4: blue
		c.purple, -- 5: magenta
		c.teal, -- 6: cyan
		c.subtle, -- 7: white
		c.muted, -- 8: bright black (autosuggestions, dim text)
		c.red_bright, -- 9: bright red
		c.green, -- 10: bright green
		c.amber, -- 11: bright yellow
		c.blue_bright, -- 12: bright blue
		c.purple, -- 13: bright magenta
		c.teal_bright, -- 14: bright cyan
		c.text, -- 15: bright white
	}
end

--- Returns the 16 ANSI colors for a palette.
function M.colors(c)
	return c.ansi or from_roles(c)
end

function M.setup(c)
	for i, color in ipairs(M.colors(c)) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end
end

return M
