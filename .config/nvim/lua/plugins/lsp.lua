return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      local mason_lsp = require("mason-lspconfig")
      local servers = {
        "lua_ls",
        "pyright",
        "vtsls",
        "svelte",
        "bashls",
        "html",
        "intelephense",
        "jdtls",
        "terraformls"
      }

      mason_lsp.setup({
        ensure_installed = servers
      })

      local function on_attach(_, bufnr)
        local opts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      end

      for _, server in ipairs(servers) do
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        if pcall(require, "cmp_nvim_lsp") then
          capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        end

        vim.lsp.config(server, {
          on_attach = on_attach,
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({}),
        sources = { { name = "nvim_lsp" } },
      })
    end,
  },
}

