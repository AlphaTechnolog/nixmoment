{ pkgs, lib, flakeConfig, ... }: let
  config = {
    enable = true;
    enableMan = false;
    defaultEditor = true;
    viAlias = true;

    clipboard = {
      register = "unnamedplus";
    };

    opts = {
      background = "dark";
      number = true;
      tabstop = 2;
      showmode = false;
      shiftwidth = 2;
      expandtab = true;
      wrap = false;
    };

    extraConfigLua = ''
      for _, x in ipairs { 'c', 'cpp', 'tsx', 'typescript', 'zig', 'rust', 'php' } do
        vim.cmd("autocmd FileType " .. x .. " setlocal tabstop=4 shiftwidth=4 expandtab")
      end
    '';

    autoCmd = [
      {
        event = ["VimLeave"];
        command = "set guicursor=n:ver10";
      }
    ];

    keymaps = [
      {
        key = "jk";
        action = "<esc>";
        mode = ["i"];
        options.silent = true;
      }

      {
        key = "<space>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.silent = true;
      }

      {
        key = "-";
        action = "<cmd>Oil<cr>";
        options.silent = true;
      }

      {
        key = "<Tab>";
        action = "<cmd>bn!<cr>";
        options.silent = true;
      }

      {
        key = "<S-Tab>";
        action = "<cmd>bp!<cr>";
        options.silent = true;
      }

      {
        key = "<space>x";
        action = "<cmd>bd!<cr>";
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
          "html" "css" "bash" "python" "nix"
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
          pyright.enable = true;
          clangd.enable = true;
          emmet-ls.enable = true;
          tailwindcss.enable = true;

          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
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
in {
  home.packages = [ pkgs.wl-clipboard-rs ];

  # loading neovim theme definition from the choosen theme.
  programs.nixvim = lib.mkMerge [
    (flakeConfig.metacolorscheme.neovim pkgs)
    config
  ];
}
