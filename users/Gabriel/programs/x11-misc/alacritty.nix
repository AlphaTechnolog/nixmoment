{ flakeConfig, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      window = let
        value = 12;
      in {
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
