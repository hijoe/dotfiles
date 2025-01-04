return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					separator = true,
					text_align = center,
				},
			},

			indicator = {
				style = "underline",
			},

			--mode = "tabs",
			separator_style = "slant",
		},
	},
}
