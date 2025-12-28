local jdtls_setup = require('jdtls.setup')

-- Set the project root
local j_project_root = jdtls_setup.find_root({
    "gradlew",
    "mvnw",
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
})

local git_root = jdtls_setup.find_root({
    ".git",
})

local java_root = function(fname)
    return j_project_root(fname) or find_git_root(fname)
end

-- Customize settings of nvim jdtls
vim.lsp.config("jdtls", {
    cmd = { "jdtls" },
    root_dir = java_root,
})

-- enables JDTLS
vim.lsp.enable('jdtls')
