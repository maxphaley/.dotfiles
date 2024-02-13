return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'j-hui/fidget.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    require('neodev').setup()
    local cmp_lsp = require('cmp_nvim_lsp')
    local capabilities = cmp_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('fidget').setup({
      notification = {
        window = {
          winblend = 0,
          border = 'rounded',
          relative = 'editor',
        }
      }
    })
    require('mason').setup({
      ui = {
        border = 'rounded'
      },
    })

    local lsp_server_settings = {
      lua_ls = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        }
      }
    }

    local user_keymaps = require('mph.keymaps')
    local lsp_on_attach = function(_, bufnr)
      user_keymaps.lsp_keymaps(bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    require('mason-lspconfig').setup({
      ensure_installed = vim.tbl_keys(lsp_server_settings),
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            on_attach = lsp_on_attach,
            settings = lsp_server_settings[server_name],
          })
        end,
      }
    })
  end
}
