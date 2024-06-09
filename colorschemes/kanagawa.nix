{
  wallpaper = ./wallpapers/kanagawa.png;

  neovim = pkgs: {
    extraPlugins = [pkgs.vimPlugins.kanagawa-nvim];
    colorscheme = "kanagawa-dragon";
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "yellow";
    };

    primary = {
      background = "#181616";
      foreground = "#c5c9c5";
    };

    normal = {
      black = "#242121";
      red = "#c4746e";
      green = "#8a9a7b";
      yellow = "#c4b28a";
      blue = "#8ba4b0";
      magenta = "#a292a3";
      cyan = "#8ea4a2";
      white = "#C8C093";
    };

    bright = normal // {
      black = "#2f2c2c";
      white = "#c5c9c5";
    };
  };
}

