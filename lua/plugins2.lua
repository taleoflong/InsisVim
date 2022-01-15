-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/

-- 自动安装 Packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.notify("正在安装Pakcer.nvim...")
end

-- 每次保存 plugins.lua 自动安装插件
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------
    -- nvim-tree
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    -- rainbow
    use("p00f/nvim-ts-rainbow")
    -- Comment
    use("numToStr/Comment.nvim")
    -- nvim-autopairs
    use("windwp/nvim-autopairs")
    -- surround
    use("blackCauldron7/surround.nvim")
    -- nvim-coloizer
    use("norcalli/nvim-colorizer.lua")
    -- diffview.nvim
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
    -- telescope
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
    use("arkav/lualine-lsp-progress")
    -- use 'feline-nvim/feline.nvim'
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- :MarkdownPreview 命令，默认无需配置
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })
    use("akinsho/toggleterm.nvim")
    -- which-key
    -- use 'folke/which-key.nvim'
    -------------------------- lsp -------------------------------------------
    -- lspconfig
    use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
    -- nvim-cmp
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/nvim-cmp")
    -- vsnip
    use("hrsh7th/cmp-vsnip") -- { name = 'vsnip' }
    use("hrsh7th/vim-vsnip")
    use("rafamadriz/friendly-snippets")
    -- lspkind
    use("onsails/lspkind-nvim")
    -- use 'github/copilot.vim'
    -- use("mhartington/formatter.nvim")
    use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("simrat39/rust-tools.nvim")
    -----------------------------------------------------------------------------
    -- null-ls
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use("moll/vim-bbye")
    -- jsonls schemas
    use("b0o/schemastore.nvim")

    ------------------------- dap
    -- use("mfussenegger/nvim-dap")
    -- use("nvim-telescope/telescope-dap.nvim")
    -- use("Pocco81/DAPInstall.nvim")
    -- vimspect
    use("puremourning/vimspector")

    --------------------------- colorscheme ------------------------------------
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- zephyr
    use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- tokyonight
    use("folke/tokyonight.nvim")
    use("EdenEast/nightfox.nvim")
    ------------------------------------

    if paccker_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://github.com.cnpmjs.org/%s",
      -- default_url_format = "https://hub.fastgit.org/%s",
      -- default_url_format = "https://codechina.csdn.net/mirrors/%s",
    },
    -- display = {
    --   open_fn = function()
    --     return require("packer.util").float({ border = "single" })
    --   end,
    -- },
  },
})