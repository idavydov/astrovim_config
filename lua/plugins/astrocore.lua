---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        colorcolumn = "80,100,120",
        scrolloff = 5, -- set the number of lines to keep above and below the cursor when scrolling

        expandtab = true,
        shiftwidth = 2,
        tabstop = 2,
        softtabstop = 2,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        ["<leader>gg"] = { "<cmd>Neogit<cr>", desc = "Neogit" },

        -- Meta + arrows to resize
        ["<M-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<M-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<M-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<M-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

        -- quickly navigate quickfix
        ["]q"] = { "<cmd>cnext<cr>", desc = "Next quickfix" },
        ["[q"] = { "<cmd>cprev<cr>", desc = "Previous quickfix" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["jj"] = { "<C-\\><C-n>", desc = "Exit Terminal Mode" },
        ["jk"] = { "<C-\\><C-n>", desc = "Exit Terminal Mode" },
        ["JJ"] = { "<C-\\><C-n>", desc = "Exit Terminal Mode" },
        ["JK"] = { "<C-\\><C-n>", desc = "Exit Terminal Mode" },
      },
      i = {
        ["<C-s>"] = { "<esc>:w<cr>", desc = "Save File" },
      },
    },
  },
}
