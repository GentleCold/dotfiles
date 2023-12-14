return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		-- change default fast_wrap
		require("nvim-autopairs").setup({
			fast_wrap = {
				map = "<C-s>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				before_key = "h",
				after_key = "l",
				cursor_pos_before = true,
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				manual_position = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})
	end,
}
