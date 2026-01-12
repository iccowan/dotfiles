return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  event = "BufRead",
  branch = "main",
  build = ":TSUpdate",
  config = function(_, opts)
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      callback = function(event)
        local bufnr = event.buf
        local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

        if filetype == "" then
          return
        end

        local parser_name = vim.treesitter.language.get_lang(filetype)
        if not parser_name then
          return
        end

        local parser_configs = require("nvim-treesitter.parsers")
        if not parser_configs[parser_name] then
          return
        end

        local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

        if not parser_installed then
          require("nvim-treesitter").install({ parser_name }):wait(30000)
        end

        parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

        if parser_installed then
          vim.treesitter.start(bufnr, parser_name)
        end
      end,
    })
  end,
}
