local function check(condition, message)
	if not condition then
		error("Night Road test failed: " .. message, 2)
	end
end

local function highlight(name)
	return vim.api.nvim_get_hl(0, {
		name = name,
		link = false,
	})
end

-- Load using the public API.
local theme = require("night-road")
theme.setup()
theme.load()

check(vim.g.colors_name == "night-road", "colorscheme name was not set")

check(vim.o.termguicolors, "true color support was not enabled")

-- Verify the palette.
local palette = theme.colors()

check(palette.bg == "#0d1918", "background color differs from the expected palette")

check(palette.teal_bright == "#abe2c6", "bright teal differs from the expected palette")

-- Verify essential highlight groups.
for _, name in ipairs({
	"Normal",
	"NormalFloat",
	"LineNr",
	"CursorLineNr",
	"Visual",
	"Comment",
	"String",
	"Function",
	"Keyword",
	"@function",
	"@variable",
	"@lsp.type.function",
	"DiagnosticError",
	"DiagnosticWarn",
	"DiagnosticHint",
	"DiffAdd",
	"DiffDelete",
	"TelescopeNormal",
	"CmpItemAbbrMatch",
	"BlinkCmpMenu",
	"GitSignsAdd",
}) do
	local group = highlight(name)

	check(next(group) ~= nil, "highlight group '" .. name .. "' is empty")
end

-- Verify that configuration options are applied.
theme.setup({
	transparent = true,
	terminal_colors = false,
	styles = {
		comments = {
			italic = false,
		},
	},
})
theme.load()

check(highlight("Normal").bg == nil, "transparent mode should remove the Normal background")

check(highlight("Comment").italic ~= true, "comment italics should be disabled")

-- Verify that defaults are restored when options are omitted.
theme.setup()
theme.load()

check(highlight("Normal").bg == nil, "default config should be transparent")

check(highlight("Comment").italic == true, "default comment italics should be restored")

-- Verify solid background mode.
theme.setup({ transparent = false })
theme.load()

check(highlight("Normal").bg == tonumber(palette.bg:sub(2), 16), "solid mode should use the palette background")

-- Verify that direct colorscheme loading works.
-- Regression test: user options must survive `:colorscheme night-road`.
theme.setup({ transparent = false })
vim.cmd("colorscheme night-road")

check(vim.g.colors_name == "night-road", "direct colorscheme loading failed")

print("Night Road: all smoke tests passed")
