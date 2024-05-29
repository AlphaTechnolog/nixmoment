{ pkgs, ... }: {
  home.packages = [ pkgs.wl-clipboard-rs ];

  programs.nixvim = {
    enable = true;
    enableMan = false;
    defaultEditor = true;
    viAlias = true;

    colorscheme = "gruvbox-material";

    clipboard = {
      register = "unnamedplus";
    };

    extraPlugins = with pkgs.vimPlugins; [
      gruvbox-material
    ];

    opts = {
      background = "dark";
      number = true;
      tabstop = 2;
      showmode = false;
      shiftwidth = 2;
      expandtab = true;
    };

    globals = {
      gruvbox_material_better_performance = 0;
      gruvbox_material_background = "hard";
      gruvbox_material_foreground = "material";
    };

    extraConfigLua = ''
      for _, x in ipairs { 'c', 'cpp', 'tsx', 'typescript', 'zig', 'rust', 'php' } do
        vim.cmd("autocmd FileType " .. x .. " setlocal tabstop=4 shiftwidth=4 expandtab")
      end
    '';

    keymaps = [
      {
        action = "<esc>";
        key = "jk";
        mode = ["i"];
        options.silent = true;
      }

      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<space>ff";
        options.silent = true;
      }

      {
        action = "<cmd>Oil<cr>";
        key = "-";
        options.silent = true;
      }
    ];

    plugins = {
      telescope = {
        enable = true;
      };

      nvim-colorizer = {
        enable = true;
      };

      treesitter = {
        enable = true;
        nixvimInjections = true;

        ensureInstalled = [
          "javascript" "typescript" "tsx"
          "c" "cpp" "rust" "zig" "lua"
          "html" "css" "bash" "python"
        ];
      };

      oil = {
        enable = true;

        settings = {
          columns = ["icon"];

          keymaps = {
            "<C-h>" = false;
            "<M-h>" = "actions.select_split";
          };

          view_options = {
            show_hidden = true;
          };
        };
      };

      lsp = {
        enable = true;

        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer.enable = true;
          pyright.enable = true;
          clangd.enable = true;
          emmet_ls.enable = true;
          tailwindcss.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          sources = let
            mk = name: { inherit name; };
          in [
            (mk "nvim_lsp")
            (mk "path")
            (mk "buffer")
          ];

          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };
      };
    };
  };
}
