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

        cursor = {
          text = bright.white;
          cursor = bright.black;
        };
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

      font = let
        offset = 0;
      in {
        size = 10.5;
        offset.y = offset;
        glyph_offset.y = if offset == 0 then 0 else offset;

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
