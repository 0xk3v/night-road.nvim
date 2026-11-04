local M = {}

local palette = require("night-road.palette")
local config = require("night-road.config")

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

local function load_groups(options)
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

local function set_terminal_colors(options)
	if not options.terminal_colors then
		return
	end

	require("night-road.terminal").setup(palette)
end

--- Store user optoins. Does not apply the Colorscheme
function M.setup(opts)
	config.setup(opts)
end

--- Apply the colorscheme using the stored options.
function M.load()
	local options = config.get()

	-- Reset previous highlight definitions.
	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	-- Set colorscheme metadata.
	vim.o.termguicolors = true
	vim.o.background = "dark"
	vim.g.colors_name = "night-road"

	-- Apply highlight groups.
	load_groups(options)

	-- Configure terminal ANSI colors.
	set_terminal_colors(options)
end

-- Returns a copy of the palette so other plugins and user configs can reuse the colors.
function M.colors()
	return vim.deepcopy(palette)
end

return M
