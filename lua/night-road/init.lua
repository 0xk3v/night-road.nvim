local M = {}

local palettes = require("night-road.palette")
local config = require("night-road.config")

-- Variant applied by the last load(), so colors() matches what is on screen.
local active_variant

local groups = {
	"editor",
	"syntax",
	"treesitter",
	"lsp",
	"diagnostics",
	"diff",
	"plugins",
}

local core_groups = {
	editor = true,
	syntax = true,
	diff = true,
}

local function load_groups(palette, options)
	for _, name in ipairs(groups) do
		local enabled = core_groups[name] or options.integrations[name] ~= false

		if enabled then
			local module_name = "night-road.groups." .. name
			local group = require(module_name)

			if type(group) ~= "table" then
				error(module_name .. " must return a table, got " .. type(group))
			end

			if type(group.setup) ~= "function" then
				error(module_name .. " must define setup()")
			end

			group.setup(palette, options)
		end
	end
end

local function set_terminal_colors(palette, options)
	if not options.terminal_colors then
		return
	end

	require("night-road.terminal").setup(palette)
end

--- Store user options. Does not apply the colorscheme.
function M.setup(opts)
	local options = config.setup(opts)

	-- Fail on a bad variant here rather than at :colorscheme time.
	palettes.get(options.variant)
end

--- Apply the colorscheme using the stored options.
--- `overrides.variant` forces a variant for this load without changing the
--- stored options; colors/night-road-<variant>.lua uses it.
function M.load(overrides)
	local options = config.get()
	local forced = overrides and overrides.variant
	local variant = forced or options.variant
	local palette = palettes.get(variant)

	-- Reset previous highlight definitions.
	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	-- Set colorscheme metadata. The name matches the colors/ file that loaded it.
	vim.o.termguicolors = true
	vim.o.background = "dark"
	vim.g.colors_name = forced and ("night-road-" .. variant) or "night-road"
	active_variant = variant

	-- Apply highlight groups.
	load_groups(palette, options)

	-- Configure terminal ANSI colors.
	set_terminal_colors(palette, options)
end

-- Returns a copy of the active variant's palette so other plugins and user
-- configs can reuse the colors.
function M.colors()
	return vim.deepcopy(palettes.get(active_variant or config.get().variant))
end

return M
