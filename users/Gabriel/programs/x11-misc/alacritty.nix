{flakeConfig, pkgs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = let
        inherit (pkgs) lib;
        inherit (flakeConfig.modules.homeManager) aetherShell;
        value = 12;
      in lib.mkIf aetherShell.enable {
        padding = {
          x = value;
          y = value;
        };
      };

      font = {
        size = 10;

        normal = {
          family = "monospace";
          style = "Semibold";
        };

        italic = {
          family = "monospace";
          style = "Semibold";
        };
      };

      # flakeConfig.colorscheme already follows the alacritty spec (mostly).
      colors = with flakeConfig;
        colorscheme
        // (with colorscheme; {
          cursor = {
            cursor = normal.white;
            text = "CellForeground";
          };
        });
    };
  };
}
