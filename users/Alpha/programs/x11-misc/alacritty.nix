{flakeConfig, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      # flakeConfig.colorscheme already follows the alacritty colors spec (mostly).
      # ignoring some meta info such as `scheme`.
      colors = with flakeConfig.colorscheme; {
        inherit
          primary
          normal
          bright
          ;
      };

      cursor = {
        style.shape = "Beam";
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
      };

      font = {
        size = 11;
        offset.y = -2;
        glyph_offset.y = -1;

        normal = {
          family = "monospace";
          style = "Semibold";
        };

        italic = {
          family = "monospace";
          style = "Semibold";
        };
      };
    };
  };
}
