{ flakeConfig, pkgs, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      window = let
        value = 12;
      in {
        padding = {
          x = value;
          y = value;
        };
      };

      cursor = {
        style.shape = "Beam";
        thickness = 1;
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

        offset = {
          y = 6;
        };

        glyph_offset = {
          y = 3;
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
