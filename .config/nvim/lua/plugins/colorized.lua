return {
	{
		"norcalli/nvim-colorizer.lua",
    -- just use command "ColorizerToggle" to open
		event = "BufEnter",
		config = function()
			require("colorizer").setup()
		end,
	},
}
