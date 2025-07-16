return {
	'Shatur/neovim-session-manager',

	dependencies = {
		'nvim-lua/plenary.nvim',
	},

	config = function()
		local conf = require('session_manager.config')
		require('session_manager').setup({
			autoload_mode = conf.AutoloadMode.Disabled,
		})
	end
}
