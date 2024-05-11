{flakeConfig, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        size = 10.5;

        normal = {
          family = "monospace";
          style = "Semibold";
        };

        italic = {
          family = "monospace";
          style = "Semibold";
        };

        offset = {
          y = 2;
        };

        glyph_offset = {
          y = 1;
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

      window = let
        padding = 16;
      in {
        padding = {
          x = padding;
          y = padding;
        };
      };
    };
  };
}
