{
  wallpaper = ./wallpapers/waves.png;

  # no config yet
  neovim = _: {};

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "cyan";
    };

    primary = {
      background = "#0c0e0f";
      foreground = "#edeff0";
    };

    normal = {
      black = "#232526";
      red = "#df5b61";
      green = "#78b892";
      yellow = "#de8f78";
      blue = "#6791c9";
      magenta = "#bc83e3";
      cyan = "#67afc1";
      white = "#e4e6e7";
    };

    bright =
      normal
      // {
        black = "#2c2e2f";
        white = "#f2f4f5";
      };
  };
}
