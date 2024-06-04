{ flakeConfig, pkgs, ... }: {
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
    };
  };
}
