local M = {}

function M.setup(c, config)
	local hi = vim.api.nvim_set_hl
	local deep = config.transparent and "NONE" or c.bg_deep

	-- Telescope
	hi(0, "TelescopeNormal", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "TelescopeBorder", {
		fg = c.border,
		bg = c.surface,
	})

	hi(0, "TelescopePromptNormal", {
		fg = c.text,
		bg = c.overlay,
	})

	hi(0, "TelescopePromptBorder", {
		fg = c.teal,
		bg = c.overlay,
	})

	hi(0, "TelescopePromptTitle", {
		fg = c.bg,
		bg = c.teal,
		bold = true,
	})

	hi(0, "TelescopeResultsTitle", {
		fg = c.bg,
		bg = c.blue,
		bold = true,
	})

	hi(0, "TelescopePreviewTitle", {
		fg = c.bg,
		bg = c.red,
		bold = true,
	})

	hi(0, "TelescopeSelection", {
		fg = c.text,
		bg = c.border,
		bold = true,
	})

	hi(0, "TelescopeMatching", {
		fg = c.teal_bright,
		bold = true,
	})

	hi(0, "TelescopeSelectionCaret", {
		fg = c.teal_bright,
		bg = c.border,
		bold = true,
	})

	hi(0, "TelescopeMultiSelection", {
		fg = c.teal,
		bg = c.overlay,
	})

	hi(0, "TelescopePromptPrefix", {
		fg = c.teal_bright,
		bg = c.overlay,
	})

	hi(0, "TelescopeResultsNormal", {
		fg = c.text,
	})

	hi(0, "TelescopePreviewNormal", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "TelescopePromptCounter", {
		fg = c.muted,
	})

	-- nvim-cmp
	hi(0, "CmpItemAbbr", {
		fg = c.text,
	})

	hi(0, "CmpItemAbbrMatch", {
		fg = c.teal_bright,
		bold = true,
	})

	hi(0, "CmpItemAbbrMatchFuzzy", {
		fg = c.teal,
		bold = true,
	})

	hi(0, "CmpItemKind", {
		fg = c.blue_bright,
	})

	hi(0, "CmpItemMenu", {
		fg = c.muted,
		italic = true,
	})

	hi(0, "CmpItemAbbrDeprecated", {
		fg = c.muted,
		strikethrough = true,
	})

	hi(0, "CmpItemKindFunction", {
		fg = c.teal_bright,
	})

	hi(0, "CmpItemKindMethod", {
		fg = c.teal_bright,
	})

	hi(0, "CmpItemKindVariable", {
		fg = c.text,
	})

	hi(0, "CmpItemKindKeyword", {
		fg = c.red,
	})

	hi(0, "CmpItemKindClass", {
		fg = c.blue_bright,
	})

	hi(0, "CmpItemKindInterface", {
		fg = c.blue_bright,
	})

	hi(0, "CmpItemKindProperty", {
		fg = c.blue_bright,
	})

	hi(0, "CmpItemKindSnippet", {
		fg = c.purple,
	})

	hi(0, "CmpItemKindText", {
		fg = c.subtle,
	})

	hi(0, "CmpItemKindConstant", {
		fg = c.purple,
	})

	hi(0, "CmpItemKindEnum", {
		fg = c.blue,
	})

	hi(0, "CmpItemKindEnumMember", {
		fg = c.amber,
	})

	hi(0, "CmpItemKindModule", {
		fg = c.blue,
	})

	hi(0, "CmpItemKindOperator", {
		fg = c.subtle,
	})

	hi(0, "CmpItemKindReference", {
		fg = c.teal,
	})

	hi(0, "CmpItemKindStruct", {
		fg = c.blue_bright,
	})

	hi(0, "CmpItemKindTypeParameter", {
		fg = c.blue,
	})

	hi(0, "CmpDocumentation", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "CmpDocumentationBorder", {
		fg = c.border,
		bg = c.surface,
	})

	hi(0, "CmpGhostText", {
		fg = c.muted,
		italic = true,
	})

	-- blink.cmp
	hi(0, "BlinkCmpMenu", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "BlinkCmpMenuBorder", {
		fg = c.border,
		bg = c.surface,
	})

	hi(0, "BlinkCmpMenuSelection", {
		fg = c.text,
		bg = c.border,
		bold = true,
	})

	hi(0, "BlinkCmpLabel", {
		fg = c.text,
	})

	hi(0, "BlinkCmpLabelMatch", {
		fg = c.teal_bright,
		bold = true,
	})

	hi(0, "BlinkCmpLabelDescription", {
		fg = c.muted,
	})

	hi(0, "BlinkCmpLabelDetail", {
		fg = c.subtle,
	})

	hi(0, "BlinkCmpKind", {
		fg = c.blue_bright,
	})

	hi(0, "BlinkCmpSource", {
		fg = c.muted,
		italic = true,
	})

	hi(0, "BlinkCmpGhostText", {
		fg = c.muted,
		italic = true,
	})

	hi(0, "BlinkCmpDoc", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "BlinkCmpDocBorder", {
		fg = c.border,
		bg = c.surface,
	})

	hi(0, "BlinkCmpSignatureHelp", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "BlinkCmpSignatureHelpBorder", {
		fg = c.border,
		bg = c.surface,
	})

	hi(0, "BlinkCmpSignatureHelpActiveParameter", {
		fg = c.amber,
		bold = true,
		underline = true,
	})

	hi(0, "BlinkCmpScrollBarThumb", {
		bg = c.muted,
	})

	hi(0, "BlinkCmpScrollBarGutter", {
		bg = c.surface,
	})

	-- Gitsigns
	hi(0, "GitSignsAdd", {
		fg = c.green,
	})

	hi(0, "GitSignsChange", {
		fg = c.amber,
	})

	hi(0, "GitSignsDelete", {
		fg = c.red,
	})

	hi(0, "GitSignsCurrentLineBlame", {
		fg = c.muted,
		italic = true,
	})

	hi(0, "GitSignsAddLn", {
		bg = c.diff_add,
	})

	hi(0, "GitSignsChangeLn", {
		bg = c.diff_change,
	})

	hi(0, "GitSignsDeleteLn", {
		bg = c.diff_delete,
	})

	-- Which-key
	hi(0, "WhichKey", {
		fg = c.teal_bright,
	})

	hi(0, "WhichKeyGroup", {
		fg = c.blue_bright,
	})

	hi(0, "WhichKeyDesc", {
		fg = c.text,
	})

	hi(0, "WhichKeySeparator", {
		fg = c.muted,
	})

	hi(0, "WhichKeyValue", {
		fg = c.amber,
	})

	hi(0, "WhichKeyFloat", {
		fg = c.text,
		bg = c.surface,
	})

	hi(0, "WhichKeyBorder", {
		fg = c.border,
		bg = c.surface,
	})

	-- Indent guides
	hi(0, "IblIndent", {
		fg = c.surface,
	})

	hi(0, "IblScope", {
		fg = c.border,
	})

	-- Neo-tree
	hi(0, "NeoTreeNormal", {
		fg = c.text,
		bg = deep,
	})

	hi(0, "NeoTreeNormalNC", {
		fg = c.subtle,
		bg = deep,
	})

	hi(0, "NeoTreeDirectoryName", {
		fg = c.blue_bright,
	})

	hi(0, "NeoTreeDirectoryIcon", {
		fg = c.blue,
	})

	hi(0, "NeoTreeFileName", {
		fg = c.text,
	})

	hi(0, "NeoTreeGitAdded", {
		fg = c.green,
	})

	hi(0, "NeoTreeGitModified", {
		fg = c.amber,
	})

	hi(0, "NeoTreeGitDeleted", {
		fg = c.red_bright,
	})

	hi(0, "NeoTreeGitConflict", {
		fg = c.red_bright,
		bold = true,
	})

	hi(0, "NeoTreeGitUntracked", {
		fg = c.teal,
	})

	-- nvim-tree
	hi(0, "NvimTreeNormal", {
		fg = c.text,
		bg = deep,
	})

	hi(0, "NvimTreeFolderName", {
		fg = c.blue_bright,
	})

	hi(0, "NvimTreeFolderIcon", {
		fg = c.blue,
	})

	hi(0, "NvimTreeOpenedFolderName", {
		fg = c.teal_bright,
		bold = true,
	})

	hi(0, "NvimTreeGitNew", {
		fg = c.green,
	})

	hi(0, "NvimTreeGitDirty", {
		fg = c.amber,
	})

	hi(0, "NvimTreeGitDeleted", {
		fg = c.red_bright,
	})

	hi(0, "NvimTreeGitMerge", {
		fg = c.purple,
	})

	-- Lazy.nvim
	hi(0, "LazyNormal", {
		fg = c.text,
		bg = c.bg,
	})

	hi(0, "LazyButton", {
		fg = c.subtle,
		bg = c.surface,
	})

	hi(0, "LazyButtonActive", {
		fg = c.bg,
		bg = c.teal,
		bold = true,
	})

	hi(0, "LazyH1", {
		fg = c.bg,
		bg = c.teal,
		bold = true,
	})

	hi(0, "LazyH2", {
		fg = c.teal_bright,
		bold = true,
	})

	hi(0, "LazyProgressDone", {
		fg = c.green,
	})

	hi(0, "LazyProgressTodo", {
		fg = c.muted,
	})

	-- Mason
	hi(0, "MasonNormal", {
		fg = c.text,
		bg = c.bg,
	})

	hi(0, "MasonHeader", {
		fg = c.bg,
		bg = c.teal,
		bold = true,
	})

	hi(0, "MasonHighlight", {
		fg = c.teal_bright,
	})

	hi(0, "MasonHighlightBlock", {
		fg = c.bg,
		bg = c.teal,
	})

	hi(0, "MasonHighlightBlockBold", {
		fg = c.bg,
		bg = c.teal,
		bold = true,
	})

	hi(0, "MasonError", {
		fg = c.red_bright,
	})

	hi(0, "MasonWarning", {
		fg = c.amber,
	})

	hi(0, "MasonMuted", {
		fg = c.muted,
	})

	-- Snacks (LazyVim's explorer, picker and indent guides)
	hi(0, "SnacksPicker", { fg = c.text, bg = deep })
	hi(0, "SnacksPickerBorder", { fg = c.border, bg = deep })
	hi(0, "SnacksPickerTitle", { fg = c.green, bg = deep, bold = true })
	hi(0, "SnacksPickerInput", { fg = c.text, bg = deep })
	hi(0, "SnacksPickerInputBorder", { fg = c.teal, bg = deep })
	hi(0, "SnacksPickerInputTitle", { fg = c.green, bg = deep, bold = true })
	hi(0, "SnacksPickerList", { fg = c.text, bg = deep })
	hi(0, "SnacksPickerListBorder", { fg = c.border, bg = deep })
	hi(0, "SnacksPickerListCursorLine", { bg = c.surface })
	hi(0, "SnacksPickerDir", { fg = c.subtle })
	hi(0, "SnacksPickerFile", { fg = c.text })
	hi(0, "SnacksPickerDimmed", { fg = c.muted })
	hi(0, "SnacksPickerPathHidden", { fg = c.muted })
	hi(0, "SnacksPickerPathIgnored", { fg = c.muted })
	hi(0, "SnacksPickerTree", { fg = c.border })
	hi(0, "SnacksPickerMatch", { fg = c.green, bold = true })
	hi(0, "SnacksPickerTotals", { fg = c.muted })
	hi(0, "SnacksPickerGitStatus", { fg = c.muted })
	hi(0, "SnacksPickerGitStatusUntracked", { fg = c.muted })
	hi(0, "SnacksPickerGitStatusAdded", { fg = c.green })
	hi(0, "SnacksPickerGitStatusModified", { fg = c.amber })
	hi(0, "SnacksPickerGitStatusDeleted", { fg = c.red_bright })
	hi(0, "SnacksIndent", { fg = c.overlay })
	hi(0, "SnacksIndentScope", { fg = c.teal })
end

return M
