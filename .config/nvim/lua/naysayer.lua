-- Naysayer Color Scheme for Neovim
-- Inspired by the Emacs naysayer theme

local colors = {
	background = "#062329",
	text = "#d1b897",
	selection = "#0000ff",
	comments = "#44b340",
	punctuation = "#8cde94",
	keywords = "#ffffff",
	variables = "#c1d1e3",
	functions = "#ffffff",
	strings = "#2ec09c",
	constants = "#7ad0c6",
	macros = "#8cde94",
	numbers = "#7ad0c6",
	white = "#ffffff",
	error = "#ff0000",
	warning = "#ffaa00",
	highlight_line = "#0b3335",
	line_fg = "#126367",
}

local highlight = function(group, color)
	local style = color.style and "gui=" .. color.style or "gui=NONE"
	local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
	local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
	local sp = color.sp and "guisp=" .. color.sp or ""

	vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
end

local naysayer = {}

naysayer.normal = {
	a = { fg = colors.background, bg = colors.text, gui = "bold" },
	b = { fg = colors.text, bg = colors.background },
	c = { fg = colors.text, bg = colors.background },
}

naysayer.visual = {
	a = { fg = colors.background, bg = colors.selection, gui = "bold" },
	b = { fg = colors.text, bg = colors.background },
}

naysayer.inactive = {
	a = { fg = colors.text, bg = colors.background, gui = "bold" },
	b = { fg = colors.text, bg = colors.background },
	c = { fg = colors.text, bg = colors.background },
}

naysayer.replace = {
	a = { fg = colors.background, bg = colors.error, gui = "bold" },
	b = { fg = colors.text, bg = colors.background },
}

naysayer.insert = {
	a = { fg = colors.background, bg = colors.strings, gui = "bold" },
	b = { fg = colors.text, bg = colors.background },
}

local function load_highlights()
	-- Syntax highlighting
	highlight("Normal", { fg = colors.text, bg = colors.background })
	highlight("Comment", { fg = colors.comments })
	highlight("Constant", { fg = colors.constants })
	highlight("String", { fg = colors.strings })
	highlight("Character", { fg = colors.strings })
	highlight("Number", { fg = colors.numbers })
	highlight("Boolean", { fg = colors.constants })
	highlight("Float", { fg = colors.numbers })
	highlight("Identifier", { fg = colors.variables })
	highlight("Function", { fg = colors.functions })
	highlight("Statement", { fg = colors.keywords })
	highlight("Conditional", { fg = colors.keywords })
	highlight("Repeat", { fg = colors.keywords })
	highlight("Label", { fg = colors.keywords })
	highlight("Operator", { fg = colors.punctuation })
	highlight("Keyword", { fg = colors.keywords })
	highlight("Exception", { fg = colors.keywords })
	highlight("PreProc", { fg = colors.macros })
	highlight("Include", { fg = colors.macros })
	highlight("Define", { fg = colors.macros })
	highlight("Macro", { fg = colors.macros })
	highlight("PreCondit", { fg = colors.macros })
	highlight("Type", { fg = colors.punctuation })
	highlight("StorageClass", { fg = colors.keywords })
	highlight("Structure", { fg = colors.keywords })
	highlight("Typedef", { fg = colors.keywords })
	highlight("Special", { fg = colors.punctuation })
	highlight("SpecialChar", { fg = colors.strings })
	highlight("Tag", { fg = colors.punctuation })
	highlight("Delimiter", { fg = colors.punctuation })
	highlight("SpecialComment", { fg = colors.comments })
	highlight("Debug", { fg = colors.warning })
	highlight("Underlined", { fg = colors.text, style = "underline" })
	highlight("Ignore", { fg = colors.text })
	highlight("Error", { fg = colors.error })
	highlight("Todo", { fg = colors.warning, style = "bold" })

	-- Editor highlights
	highlight("ColorColumn", { bg = colors.highlight_line })
	highlight("Cursor", { fg = colors.background, bg = colors.white })
	highlight("CursorColumn", { bg = colors.highlight_line })
	highlight("CursorLine", { bg = colors.highlight_line })
	highlight("Directory", { fg = colors.functions })
	highlight("DiffAdd", { fg = colors.strings, bg = colors.background })
	highlight("DiffChange", { fg = colors.warning, bg = colors.background })
	highlight("DiffDelete", { fg = colors.error, bg = colors.background })
	highlight("DiffText", { fg = colors.constants, bg = colors.background })
	highlight("ErrorMsg", { fg = colors.error })
	highlight("VertSplit", { fg = colors.background, bg = colors.text })
	highlight("Folded", { fg = colors.comments, bg = colors.background })
	highlight("FoldColumn", { fg = colors.comments, bg = colors.background })
	highlight("SignColumn", { fg = colors.text, bg = colors.background })
	highlight("IncSearch", { fg = colors.background, bg = colors.strings })
	highlight("LineNr", { fg = colors.line_fg, bg = colors.background })
	highlight("CursorLineNr", { fg = colors.white, bg = colors.background })
	highlight("MatchParen", { fg = colors.warning, style = "underline" })
	highlight("ModeMsg", { fg = colors.strings })
	highlight("MoreMsg", { fg = colors.strings })
	highlight("NonText", { fg = colors.comments })
	highlight("Pmenu", { fg = colors.text, bg = colors.background })
	highlight("PmenuSel", { fg = colors.background, bg = colors.selection })
	highlight("PmenuSbar", { bg = colors.background })
	highlight("PmenuThumb", { bg = colors.text })
	highlight("Question", { fg = colors.strings })
	highlight("Search", { fg = colors.background, bg = colors.strings })
	highlight("SpecialKey", { fg = colors.comments })
	highlight("SpellBad", { fg = colors.error, style = "underline" })
	highlight("SpellCap", { fg = colors.warning })
	highlight("SpellLocal", { fg = colors.warning })
	highlight("SpellRare", { fg = colors.warning })
	highlight("StatusLine", { fg = colors.text, bg = colors.background })
	highlight("StatusLineNC", { fg = colors.text, bg = colors.background })
	highlight("TabLine", { fg = colors.text, bg = colors.background })
	highlight("TabLineFill", { fg = colors.text, bg = colors.background })
	highlight("TabLineSel", { fg = colors.background, bg = colors.text })
	highlight("Title", { fg = colors.functions })
	highlight("Visual", { bg = colors.selection })
	highlight("VisualNOS", { bg = colors.selection })
	highlight("WarningMsg", { fg = colors.warning })
	highlight("WildMenu", { fg = colors.background, bg = colors.selection })
end

function naysayer.load()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "naysayer"

	load_highlights()
end

return naysayer
