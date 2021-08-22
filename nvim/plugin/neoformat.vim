
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_svelte_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'svelte', '--plugin-search-dir=.'],
        \ 'stdin': 1,
        \ }
let g:neoformat_enabled_svelte = ['prettier']
