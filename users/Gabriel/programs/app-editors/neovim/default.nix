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
    ];

    plugins = {
      telescope = {
        enable = true;
        keymapsSilent = true;
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

      lsp = {
        enable = true;

        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer.enable = true;
        };
      };
    };
  };
}
