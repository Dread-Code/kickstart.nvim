return {
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    dependencies = { 'mason.nvim' }, -- ya no necesitas 'jose-elias-alvarez/null-ls.nvim'
    init = function()
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          _G.format_with_none_ls = function(buf)
            vim.lsp.buf.format {
              bufnr = buf,
              filter = function(client)
                return client.name == 'none-ls'
              end,
            }
          end

          vim.keymap.set('n', '<leader>f', function()
            _G.format_with_none_ls(0)
          end, { desc = 'Format buffer with none-ls' })
        end,
      })
    end,
    opts = function(_, opts)
      local nls = require('null-ls') -- todavía se llama así internamente
      opts.root_dir = opts.root_dir or require('null-ls.utils').root_pattern(
        '.null-ls-root',
        '.neoconf.json',
        'Makefile',
        '.git'
      )
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.clang_format,
      })
    end,
  },
}
