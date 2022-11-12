local nvim_home = os.getenv('NVIM_HOME')

local java_path = nvim_home .. 'share/java/java'
local jdtls_path = nvim_home .. 'share/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local jdtls_config_path = nvim_home .. 'share/jdtls/config_mac'
local lombok_path = nvim_home .. 'share/lombok/lombok.jar'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = nvim_home .. 'workspace/' .. project_name

local config = {
  cmd = {
    java_path,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. lombok_path,
    '-jar', jdtls_path,
    '-configuration', jdtls_config_path,
    '-data', workspace_dir
  },
  settings = {
    java = {
    }
  },
  init_options = {
    bundles = {}
  },
}

require('jdtls').start_or_attach(config)
