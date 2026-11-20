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

-- Variants.
local palettes = require("night-road.palette")

local function luminance(hex)
	local channels = {}

	for i = 0, 2 do
		local v = tonumber(hex:sub(2 + i * 2, 3 + i * 2), 16) / 255
		channels[i + 1] = v <= 0.03928 and v / 12.92 or ((v + 0.055) / 1.055) ^ 2.4
	end

	return 0.2126 * channels[1] + 0.7152 * channels[2] + 0.0722 * channels[3]
end

local function contrast(a, b)
	local x, y = luminance(a), luminance(b)

	if x < y then
		x, y = y, x
	end

	return (x + 0.05) / (y + 0.05)
end

-- Minimum contrast against bg, by role.
local min_contrast = {
	muted = 4.5, -- comments, line numbers
	subtle = 7,
	text = 7,
	amber = 7,
	amber_dim = 7,
	green = 7,
	git_add = 7,
	blue = 7,
	blue_bright = 7,
	teal = 7,
	teal_bright = 7,
	purple = 7,
	-- Red is used sparsely (control flow, errors), so it gets a lower floor.
	red = 6,
	red_bright = 6,
	red_dim = 6,
}

local function is_hex(value)
	return type(value) == "string" and value:match("^#%x%x%x%x%x%x$") ~= nil
end

check(palettes.get() == palettes.get("night"), "default variant should be night")
check(#palettes.variants > 0, "no variants are registered")

for _, variant in ipairs(palettes.variants) do
	local colors = palettes.get(variant)
	local label = "variant '" .. variant .. "': "

	for _, key in ipairs(palettes.keys) do
		check(is_hex(colors[key]), label .. key .. " must be a #rrggbb string, got " .. tostring(colors[key]))
	end

	for key in pairs(colors) do
		check(key == "ansi" or vim.tbl_contains(palettes.keys, key), label .. "unknown palette key " .. key)
	end

	if colors.ansi then
		check(#colors.ansi == 16, label .. "ansi must have 16 colors")

		for i, color in ipairs(colors.ansi) do
			check(is_hex(color), label .. "ansi[" .. i .. "] must be a #rrggbb string")
		end
	end

	for key, minimum in pairs(min_contrast) do
		local ratio = contrast(colors[key], colors.bg)
		check(ratio >= minimum, ("%s%s contrast %.2f is below %.1f"):format(label, key, ratio, minimum))
	end

	local selection_ratio = contrast(colors.selection_fg, colors.selection)
	check(selection_ratio >= 7, ("%sselection_fg contrast %.2f is below 7"):format(label, selection_ratio))

	-- Loading through setup() keeps the plain name.
	theme.setup({ variant = variant, transparent = false })
	vim.cmd("colorscheme night-road")

	check(vim.g.colors_name == "night-road", label .. "setup() load should set colors_name to night-road")
	check(vim.deep_equal(theme.colors(), colors), label .. "colors() should return the configured variant")
	check(highlight("Normal").bg == tonumber(colors.bg:sub(2), 16), label .. "Normal should use the variant background")

	-- Loading the variant's colorscheme file forces it and keeps the other options.
	theme.setup({ variant = "night", transparent = false })
	vim.cmd("colorscheme night-road-" .. variant)

	check(vim.g.colors_name == "night-road-" .. variant, label .. "colors_name should be night-road-" .. variant)
	check(vim.deep_equal(theme.colors(), colors), label .. "colors() should return the forced variant")
	check(highlight("Normal").bg ~= nil, label .. "forcing a variant should keep transparent = false")
	check(require("night-road.config").get().variant == "night", label .. "forcing a variant should not change options")

	-- The terminal colors come from the variant.
	check(vim.g.terminal_color_15 == (colors.ansi and colors.ansi[16] or colors.text), label .. "terminal colors not set")

	-- lualine themes, both the per-variant one and the one that follows the active variant.
	package.loaded["lualine.themes.night-road"] = nil
	for _, name in ipairs({ "lualine.themes.night-road-" .. variant, "lualine.themes.night-road" }) do
		local lualine_theme = require(name)
		check(lualine_theme.normal.a.bg == colors.teal_bright, label .. name .. " should use the variant palette")
	end
end

-- Unknown variants fail clearly.
local ok, err = pcall(theme.setup, { variant = "does-not-exist" })
check(not ok and tostring(err):find("unknown variant", 1, true), "setup() should reject an unknown variant")

theme.setup()

print("Night Road: all smoke tests passed")
