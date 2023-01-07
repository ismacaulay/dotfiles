lua << EOF
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = "> ",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require('telescope').load_extension('fzy_native')

require('telescope').load_extension('coc')
EOF

" Find files using Telescope command-line sugar.
map <C-p> <cmd>Telescope find_files<cr>
map <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>g <cmd>Telescope grep_string<cr>
nnoremap <leader>tg <cmd>Telescope git_branches<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
