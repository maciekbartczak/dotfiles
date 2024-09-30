return {
	{
		"zaldih/themery.nvim",
		init = function()
			require("themery").setup({
				themes = { "gruvbox", "gruber-darker" },
				livePreview = true,
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
	},
	{ "blazkowolf/gruber-darker.nvim" },
}
