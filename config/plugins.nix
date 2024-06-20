{pkgs, ...}: {
  colorschemes.nightfox.enable = true;  

  plugins = {
    luasnip.enable = true;

    bufferline.enable = true;
    lualine.enable = true;

    treesitter.enable = true;
    telescope.enable = true;
    ccc.enable = true;

    oil.enable = true;

    markdown-preview.enable = true;
    todo-comments.enable = true;

    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    # language server
    lsp = {
      enable = true;
      servers = {
        # Rust
        rust-analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        # Nix
        nil-ls.enable = true;
        # Bash
        #  bashls.enable = true;
        # Markdown
        marksman.enable = true;
        # Python
        pyright.enable = true;
        # C/C++
        clangd.enable = true;
      };
    };
  
  # autocomplete interface
  cmp = {
      enable = true;
      settings = {
        experimental = { ghost_text = true; };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          { name = "nvim_lua"; }
          { name = "path"; }
        ];
      

      mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping.close()";
          "<Tab>" =
            # lua 
            ''
              function(fallback)
                local line = vim.api.nvim_get_current_line()
                if line:match("^%s*$") then
                  fallback()
                elseif cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                  fallback()
                end
              end
            '';
          "<Down>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif require("luasnip").expand_or_jumpable() then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
          "<Up>" =
            # lua
            ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif require("luasnip").jumpable(-1) then
                  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                  fallback()
                end
              end
            '';
        };
      };
    };

    none-ls = {
      enable = true;
      cmd = ["bash -c nvim"];
      debug = true;
      sources = {
        code_actions = {
          statix.enable = true;
          gitsigns.enable =  true;
        };
      };
    };

  };
}
