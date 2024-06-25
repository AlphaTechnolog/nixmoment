{
  wallpaper = ./wallpapers/mountain.png;

  neovim = _: {
    colorschemes.base16 = {
      enable = true;
      colorscheme = "default-dark";
    };
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "magenta";
    };

    primary = {
      background = "#181818";
      foreground = "#d8d8d8";
    };

    normal = {
      black = "#363636";
      red = "#ab4642";
      green = "#a1b56c";
      yellow = "#f7ca88";
      blue = "#7cafc2";
      magenta = "#ba8baf";
      cyan = "#86c1b9";
      white = "#d8d8d8";
    };

    bright =
      normal
      // {
        black = "#585858";
        white = "#f8f8f8";
      };
  };
}
