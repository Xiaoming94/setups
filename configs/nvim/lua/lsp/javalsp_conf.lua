vim.lsp.config("jdtls", {
    cmd = { "jdtls" },
    root_markers = {
        "gradlew",
        "mvnw",
        "pom.xml",
        "build.gradle",
        "build.gradle.kts",
        ".git",
    },
})

-- enable jdtls
vim.lsp.enable('jdtls')
