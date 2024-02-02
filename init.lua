local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("lazy").setup("plugins")

vim.g.already_running = 0

function preview_markdown()
	local current_file = vim.fn.expand("%:p")
	local output_dir = "/tmp/" --vim.fn.tempname()

	local cmd =
		string.format("pandoc %s -s -o %s/index.html --include-in-header=solarized-dark.css", current_file, output_dir)

	-- Run Pandoc command
	vim.fn.system(cmd)

	if vim.g.already_running == 0 then
		print("Start server")
		-- Launch live-server in the background
		local live_server_cmd = string.format("live-server --watch=%s %s", output_dir, output_dir)
		print(live_server_cmd)
		--kil live server
		cmd = "lsof -i :8080 -sTCP:LISTEN |awk 'NR > 1 {print $2}'  |xargs kill -15"
		vim.fn.system(cmd)

		--vim.fn.system(live_server_cmd)
		vim.fn.jobstart(live_server_cmd, { detach = 1 })

		vim.g.already_running = 1
	else
		print("No restart needed")
	end
end

vim.keymap.set("n", "<Leader>mp", ":lua preview_markdown()<CR>", { noremap = true, silent = true })
