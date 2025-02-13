return {
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    dependencies = { 'mason.nvim', 'jose-elias-alvarez/null-ls.nvim' },
    init = function()
      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          -- For example, create a global function for formatting with null-ls.
          _G.format_with_null_ls = function(buf)
            require('vim.lsp.buf').format {
              bufnr = buf,
              filter = function(client)
                return client.name == 'null-ls'
              end,
            }
          end

          -- Optionally, you could map a key to trigger formatting.
          vim.keymap.set('n', '<leader>f', function()
            _G.format_with_null_ls(0)
          end, { desc = 'Format buffer with null-ls' })
        end,
      })
    end,
    opts = function(_, opts)
      local nls = require 'null-ls'
      opts.root_dir = opts.root_dir or require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git')
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,
        nls.builtins.formatting.prettier,
        -- C
        nls.builtins.formatting.clang_format,
      })
    end,
  },
}
