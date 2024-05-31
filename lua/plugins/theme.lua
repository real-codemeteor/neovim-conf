return {
    "catppuccin/nvim",
    name = "catppuccin",
    --"lifepillar/vim-solarized8",
    --name="vim-solarized8",
    priority = 1000,
    config = function()
        require("catppuccin.palettes").get_palette "mocha"
        vim.cmd("set background=dark")
        --vim.cmd("colorscheme solarized8")
        vim.cmd.colorscheme("catppuccin")
    end,
}
