local M = {}

function M.setup(c, config)
	local hi = vim.api.nvim_set_hl
	local styles = config.styles

	local function link(from, to)
		hi(0, from, { link = to })
	end

	-- Variables
	hi(0, "@variable", vim.tbl_extend("force", { fg = c.text }, styles.variables or {}))
	hi(0, "@variable.builtin", { fg = c.purple })
	hi(0, "@variable.parameter", { fg = c.subtle })
	hi(0, "@variable.member", { fg = c.blue_bright })
	link("@property", "@variable.member")

	-- Functions: definitions carry the accent, calls stay calmer
	hi(0, "@function", { fg = c.green, bold = styles.functions.bold })
	hi(0, "@function.call", { fg = c.teal_bright })
	link("@function.method", "@function")
	link("@function.method.call", "@function.call")
	hi(0, "@function.builtin", { fg = c.teal })
	hi(0, "@function.macro", { fg = c.purple })
	hi(0, "@constructor", { fg = c.teal })

	-- Types and modules
	hi(0, "@type", { fg = c.teal })
	hi(0, "@type.builtin", { fg = c.blue })
	hi(0, "@type.definition", { fg = c.teal, bold = true })
	hi(0, "@module", { fg = c.blue })
	hi(0, "@attribute", { fg = c.amber })
	hi(0, "@label", { fg = c.blue_bright })

	-- Keywords: declarations/imports are quiet purple (most frequent)
	hi(0, "@keyword", {
		fg = c.purple,
		bold = styles.keywords.bold,
		italic = styles.keywords.italic,
	})
	link("@keyword.function", "@keyword")
	link("@keyword.import", "@keyword")
	link("@keyword.modifier", "@keyword")
	link("@keyword.type", "@keyword")
	link("@keyword.coroutine", "@keyword")
	link("@keyword.operator", "@keyword")
	link("@keyword.directive", "@keyword")
	link("@keyword.directive.define", "@keyword")

	-- Control flow is the sparse red
	hi(0, "@keyword.conditional", { fg = c.red_dim })
	link("@keyword.conditional.ternary", "@keyword.conditional")
	link("@keyword.repeat", "@keyword.conditional")
	link("@keyword.return", "@keyword.conditional")
	link("@keyword.exception", "@keyword.conditional")

	-- Constants and literals
	hi(0, "@constant", { fg = c.amber })
	hi(0, "@constant.builtin", { fg = c.purple })
	hi(0, "@constant.macro", { fg = c.purple })
	hi(0, "@number", { fg = c.amber })
	link("@number.float", "@number")
	link("@boolean", "@number")

	hi(0, "@string", { fg = c.amber_dim })
	hi(0, "@string.escape", { fg = c.amber })
	hi(0, "@string.special", { fg = c.teal })
	hi(0, "@string.special.symbol", { fg = c.purple })
	hi(0, "@string.regexp", { fg = c.teal })
	hi(0, "@string.documentation", { fg = c.amber_dim, italic = styles.comments.italic })
	link("@string.special.url", "@markup.link.url")
	link("@character", "@string")

	-- Operators and punctuation
	hi(0, "@operator", { fg = c.subtle })
	hi(0, "@punctuation", { fg = c.subtle })
	hi(0, "@punctuation.bracket", { fg = c.muted })
	hi(0, "@punctuation.delimiter", { fg = c.subtle })
	hi(0, "@punctuation.special", { fg = c.teal })

	-- Comments
	hi(0, "@comment", { fg = c.muted, italic = styles.comments.italic })
	hi(0, "@comment.documentation", { fg = c.subtle, italic = styles.comments.italic })
	hi(0, "@comment.todo", { fg = c.bg, bg = c.amber, bold = true })
	hi(0, "@comment.note", { fg = c.bg, bg = c.teal, bold = true })
	hi(0, "@comment.warning", { fg = c.bg, bg = c.amber, bold = true })
	hi(0, "@comment.error", { fg = c.bg, bg = c.red_bright, bold = true })

	-- Tags
	hi(0, "@tag", { fg = c.purple })
	hi(0, "@tag.attribute", { fg = c.teal })
	hi(0, "@tag.delimiter", { fg = c.muted })

	-- Markup
	hi(0, "@markup.heading", { fg = c.green, bold = true })
	hi(0, "@markup.strong", { fg = c.text, bold = true })
	hi(0, "@markup.italic", { fg = c.text, italic = true })
	hi(0, "@markup.strikethrough", { fg = c.muted, strikethrough = true })
	hi(0, "@markup.underline", { underline = true })
	hi(0, "@markup.link", { fg = c.teal, underline = true })
	hi(0, "@markup.link.label", { fg = c.blue_bright })
	hi(0, "@markup.link.url", { fg = c.teal_bright, underline = true })
	hi(0, "@markup.raw", { fg = c.amber })
	hi(0, "@markup.list", { fg = c.teal })
	hi(0, "@markup.quote", { fg = c.amber_dim, italic = true })

	-- Diff
	hi(0, "@diff.plus", { fg = c.green })
	hi(0, "@diff.minus", { fg = c.red_bright })
	hi(0, "@diff.delta", { fg = c.blue_bright })

	hi(0, "@embedded", { fg = c.text })
end

return M
