-- Writes extras/ from the variant palettes. Run from the repository root:
--   nvim --headless -u NONE --cmd "set rtp+=." -l scripts/extras.lua
for path, content in pairs(require("night-road.extras").files()) do
	vim.fn.mkdir(vim.fs.dirname(path), "p")

	local file = assert(io.open(path, "w"))
	file:write(content)
	file:close()

	print("wrote " .. path)
end
