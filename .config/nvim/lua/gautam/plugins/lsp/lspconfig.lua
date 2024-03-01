local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
	"bashls",
	"clangd",
	"cssls",
	"html",
	"tsserver",
	"ltex",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ capabilities = capabilities })
end

lspconfig.ltex.setup({
	settings = {
		ltex = {
			additionalRules = {
				languageModel = "~/ngrams/",
			},
		},
	},
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local function setup_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
	})
end

setup_diags()
