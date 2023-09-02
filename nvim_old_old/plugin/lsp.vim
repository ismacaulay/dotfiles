" lua << EOF
" local function on_attach()
" end

" require'lspconfig'.gopls.setup{
"     on_attach=on_attach,
"     cmd = {"gopls", "serve"},
"     settings = {
"         gopls = {
"             analyses = {
"                 unusedparams = true,
"             },
"             staticcheck = true,
"         },
"     },
" }

" require'lspconfig'.tsserver.setup{
"     on_attach=on_attach
" }

" require'lspconfig'.svelte.setup{
"     on_attach=on_attach
" }

" require'lspconfig'.pyright.setup{
"     on_attach=on_attach
" }

" EOF

" nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
" nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.resolve_timeout = 800
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true

" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true
" let g:compe.source.luasnip = v:true
" let g:compe.source.emoji = v:true

" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
