{
  wallpaper = ./wallpapers/everforest.png;

  neovim = pkgs: {
    extraPlugins = [pkgs.vimPlugins.everforest];

    colorscheme = "everforest";

    opts = {
      background = "light";
    };

    globals = {
      everforest_better_performance = 0;
      everforest_disable_italics = 1;
      everforest_background = "medium";
    };
  };

  palette = rec {
    scheme = "light";

    accents = {
      primary = "cyan";
      secondary = "green";
    };

    primary = {
      background = "#fdf6e3";
      foreground = "#5c6a72";
    };

    normal = {
      black = "#5c6a72";
      red = "#f85552";
      green = "#8da101";
      yellow = "#dfa000";
      blue = "#3a94c5";
      magenta = "#df69ba";
      cyan = "#35a77c";
      white = "#e0dcc7";
    };

    bright = normal // {
      black = "#6c7d86";
      white = "#e0dcc7";
    };
  };
}

