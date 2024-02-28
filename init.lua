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

Output_Dir = vim.fn.tempname()

vim.fn.mkdir(Output_Dir, "p")
-- Get the path to the nvim config directory
local config_dir = vim.fn.stdpath("config")
Css_Path = config_dir .. "/solarized-dark.css"
function enable_markdown_preview()
    local current_file = vim.fn.expand("%:p")

    local cmd =
        string.format("pandoc %s -s -o %s/index.html --include-in-header=%s", current_file, Output_Dir, Css_Path)
    print(string.format("Executing: %s", cmd))

    -- Run Pandoc command
    vim.fn.system(cmd)

    if vim.g.already_running == 0 then
        -- Launch live-server in the background
        local live_server_cmd = string.format("live-server --watch=%s %s", Output_Dir, Output_Dir)
        --kil live server
        cmd = "lsof -i :8080 -sTCP:LISTEN |awk 'NR > 1 {print $2}'  |xargs kill -15"
        print(vim.fn.system(cmd))

        --vim.fn.system(live_server_cmd)
        vim.fn.jobstart(live_server_cmd, { detach = 1 })

        vim.g.already_running = 1
    end
end

function update_markdown_preview()
    if vim.g.already_running == 1 then
        local current_file = vim.fn.expand("%:p")
        local cmd = string.format(
            "pandoc %s -s -o %s/index.html --include-in-header=%s",
            current_file,
            Output_Dir,
            Css_Path
        )

        -- Run Pandoc command
        
        print(vim.fn.system(cmd))
    end
end

vim.api.nvim_create_autocmd("bufwritepost", {
    callback = function()
        update_markdown_preview()
    end,
})

vim.keymap.set("n", "<Leader>mp", ":lua enable_markdown_preview()<CR>", { noremap = true, silent = true })
