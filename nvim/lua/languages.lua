require('go').setup{} -- setup nvim-go

local lspconfig = require('lspconfig')
local completion = require('completion')

require('go').setup({
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = 'revive',
    -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
    linter_flags = {},
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = 'vt',
    -- formatter: goimports, gofmt, gofumpt
    formatter = 'goimports',
    -- test flags: -count=1 will disable cache
    test_flags = {'-v'},
    test_timeout = '30s',
    test_env = {},
    -- show test result with popup window
    test_popup = true,
    test_popup_width = 80,
    test_popup_height = 10,
    -- test open
    test_open_cmd = 'edit',
    -- struct tags
    tags_name = 'json',
    tags_options = {'json=omitempty'},
    tags_transform = 'snakecase',
    tags_flags = {'-skip-unexported'},
    -- quick type
    quick_type_flags = {'--just-types'},
})

-- lspconfig.clangd.setup{on_attach=completion.on_attach}        -- C & C++
lspconfig.gopls.setup{on_attach=completion.on_attach}         -- Go
lspconfig.pyright.setup{on_attach=completion.on_attach}       -- Python
lspconfig.rust_analyzer.setup{on_attach=completion.on_attach} -- Rust
lspconfig.tsserver.setup{on_attach=completion.on_attach}      -- TypeScript

-- Ruby
-- Install Solargraph with gem install --user-install solargraph
lspconfig.solargraph.setup{on_attach=completion.on_attach}

-- To use the Java language server
-- 1. Download JDT LS at https://github.com/eclipse/eclipse.jdt.ls
-- 2. Install appropriate version of JDK (e.g. JDK 11 for jdtls 1.0.0)
-- 3. Build it: `./mvnw clean install -DskipTests`
-- 4. Update paths here.
local jdtls_dir = tostring(vim.fn.getenv("HOME")) .. "/java/eclipse.jdt.ls"
local jdtls_jar = jdtls_dir .. "/org.eclipse.jdt.ls.product/target/repository/plugins/" ..
    "org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar"
-- TODO: Auto-detect OS.
local jdtls_config = jdtls_dir .. "/org.eclipse.jdt.ls.product/target/repository/config_mac"

vim.fn.setenv("JAR", jdtls_jar)
vim.fn.setenv("JDTLS_CONFIG", jdtls_config)
vim.fn.setenv("WORKSPACE", vim.fn.getenv("HOME") .. "/java")
vim.fn.setenv("GRADLE_HOME", "/opt/homebrew/opt/gradle")

lspconfig.jdtls.setup{}
