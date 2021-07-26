require('go').setup{} -- setup nvim-go

local lspconfig = require('lspconfig')
local completion = require('completion')

lspconfig.gopls.setup{on_attach=completion.on_attach}    -- Go
lspconfig.tsserver.setup{on_attach=completion.on_attach} -- TypeScript
lspconfig.pyright.setup{on_attach=completion.on_attach}  -- Python
lspconfig.clangd.setup{on_attach=completion.on_attach}   -- C & C++

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
