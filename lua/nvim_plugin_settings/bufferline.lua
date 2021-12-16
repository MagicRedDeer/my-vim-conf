local module = {}

module.install = function(use)
 use {
     'akinsho/bufferline.nvim',
     requires = 'kyazdani42/nvim-web-devicons'}
end

module.configure = function ()
    require('bufferline').setup{}
    vim.cmd
    [[
    " These commands will navigate through buffers in order regardless of which mode you are using
    " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent><leader>bn :BufferLineCycleNext<CR>
    nnoremap <silent><leader>bp :BufferLineCyclePrev<CR>

    " These commands will move the current buffer backwards or forwards in the bufferline
    nnoremap <silent><leader>bf :BufferLineMoveNext<CR>
    nnoremap <silent><leader>bb :BufferLineMovePrev<CR>

    " These commands will sort buffers by directory, language, or a custom criteria
    nnoremap <silent>be :BufferLineSortByExtension<CR>
    nnoremap <silent>bd :BufferLineSortByDirectory<CR>
    nnoremap <silent>bi :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
    ]]
end

return module
