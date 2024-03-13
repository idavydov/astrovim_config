-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

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
  c = {
    ["jj"] = { "<C-c>", desc = "Exit Command Mode" },
    ["jk"] = { "<C-c>", desc = "Exit Command Mode" },
    ["JJ"] = { "<C-c>", desc = "Exit Command Mode" },
    ["JK"] = { "<C-c>", desc = "Exit Command Mode" },
  },
}
