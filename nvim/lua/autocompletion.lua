vim.g.completeopt = 'menu,menuone,noselect'

-- Setup nvim-cmp.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
  local cmp = require'cmp'

  cmp.setup({
    preselect = cmp.PreselectMode.None,
    experimental = {
      ghost_text = true
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {	  
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
         cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
         cmp.complete()
        else
         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
     end, { "i", "s" }),

     ["<S-Tab>"] = cmp.mapping(function()
       if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    },
    sources = cmp.config.sources({
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'nvim_lsp' },
	  { name = 'treesitter' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
-- -- require'cmp'.setup {
  -- -- enabled = true;
  -- -- autocomplete = true;
  -- -- debug = false;
  -- -- min_length = 1;
  -- -- preselect = 'enable';
  -- -- throttle_time = 80;
  -- -- source_timeout = 200;
  -- -- resolve_timeout = 800;
  -- -- incomplete_delay = 400;
  -- -- max_abbr_width = 100;
  -- -- max_kind_width = 100;
  -- -- max_menu_width = 100;
  -- -- documentation = {
    -- -- border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    -- -- winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    -- -- max_width = 120,
    -- -- min_width = 60,
    -- -- max_height = math.floor(vim.o.lines * 0.3),
    -- -- min_height = 1,
  -- -- };

  -- -- source = {
    -- -- path = true;
    -- -- buffer = true;
    -- -- calc = true;
    -- -- nvim_lsp = true;
    -- -- nvim_lua = true;
    -- -- vsnip = false;
    -- -- ultisnips = false;
    -- -- luasnip = false;
    -- -- treesitter = true;
  -- -- };
-- -- }

-- require'cmp'.setup({
    -- snippet = {
      -- -- REQUIRED - you must specify a snippet engine
      -- expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- end,
    -- },
    -- mapping = {
      -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      -- ['<C-e>'] = cmp.mapping({
        -- i = cmp.mapping.abort(),
        -- c = cmp.mapping.close(),
      -- }),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- },
    -- sources = cmp.config.sources({
      -- { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- -- { name = 'luasnip' }, -- For luasnip users.
      -- -- { name = 'ultisnips' }, -- For ultisnips users.
      -- -- { name = 'snippy' }, -- For snippy users.
    -- }, {
      -- { name = 'buffer' },
    -- })
  -- })
  

-- -- require'cmp'.setup({
    -- -- snippet = {
      -- -- expand = function(args)
        -- -- require('luasnip').lsp_expand(args.body)
      -- -- end,
    -- -- },
    -- -- mapping = {
      -- -- ["<Tab>"] = cmp.mapping(function(fallback)
        -- -- if cmp.visible() then
          -- -- cmp.select_next_item()
        -- -- elseif luasnip.expand_or_jumpable() then
          -- -- luasnip.expand_or_jump()
        -- -- elseif has_words_before() then
          -- -- cmp.complete()
        -- -- else
          -- -- fallback()
        -- -- end
      -- -- end, { "i", "s" }),
      -- -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        -- -- if cmp.visible() then
          -- -- cmp.select_prev_item()
        -- -- elseif luasnip.jumpable(-1) then
          -- -- luasnip.jump(-1)
        -- -- else
          -- -- fallback()
        -- -- end
      -- -- end, { "i", "s" }),
      -- -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      -- -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      -- -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      -- -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      -- -- ['<C-e>'] = cmp.mapping({
        -- -- i = cmp.mapping.abort(),
        -- -- c = cmp.mapping.close(),
      -- -- }),
      -- -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    -- -- },
    -- -- sources = cmp.config.sources({
      -- -- { name = 'nvim_lsp' },
      -- -- { name = 'luasnip' },
      -- -- { name = 'path' },
      -- -- { name = 'buffer' },
	  -- -- { name = 'treesitter' },
	  
    -- -- })
  -- -- })
-- -- select first option when none selected
-- vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm({ 'keys': '<CR>', 'select': v:true })", { expr = true })

-- -- inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
-- -- inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
