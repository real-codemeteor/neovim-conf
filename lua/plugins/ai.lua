-- return {
--     'Exafunction/codeium.vim',
--     event = 'BufEnter'
-- }

return {
	"github/copilot.vim",
    config=function()
        vim.cmd('let g:copilot#enabled = 1')
    end
}
