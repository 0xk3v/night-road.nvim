local M = {}

function M.setup(c)
	local colors = {
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

	for i, color in ipairs(colors) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end
end

return M
