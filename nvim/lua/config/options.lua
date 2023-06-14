vim.opt.cursorline = true
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.listchars:append({
	extends = "",
	lead = "·",
	precedes = "",
	tab = "│ ",
	trail = "·",
})

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.wrap = true
vim.g.python_recommended_style = 0
vim.g.vimtex_view_method = 'zathura'
vim.g.tex_flavor='latex'
vim.g.vimtex_quickfix_mode=0
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsListSnippets = '<s-tab>'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsSnippetDirectories = {'UltiSnips'}
vim.opt.conceallevel=1
vim.o.tex_conceal='abdmg'

-- Customize global settings

-- You must set the default ui.
-- Note: native ui
-- https://github.com/Shougo/ddc-ui-native
vim.call('ddc#custom#patch_global', 'ui', 'native')

-- Use around source.
-- https://github.com/Shougo/ddc-source-around
vim.call('ddc#custom#patch_global', 'sources', {'around'})

-- Use matcher_head and sorter_rank.
-- https://github.com/Shougo/ddc-matcher_head
-- https://github.com/Shougo/ddc-sorter_rank

vim.call('ddc#custom#patch_global', 'sources', {'ultisnips'})
vim.call('ddc#custom#patch_global', 'sourceOptions', {
    _ = {
        matchers = {'matcher_head'},
        sorters = {'sorter_rank'},
    },
    ultisnips = {mark = 'US'}
})

-- Mappings

-- <TAB>: completion.
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "<C-n>" : (col(".") <= 1 || getline(".")[col(".") - 2] =~# "\\s") ? "<TAB>" : v:lua.ddc_map_manual_complete()', {expr = true, silent = true})

-- Use ddc.
vim.call('ddc#enable')

vim.api.nvim_command("filetype plugin indent on")
