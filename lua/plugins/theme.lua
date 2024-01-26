return { 
    "lifepillar/vim-solarized8",
    name="vim-solarized8",
    priority = 1000,
    config = function()
        vim.cmd("set background=dark")
        vim.cmd("colorscheme solarized8")
    end
}
