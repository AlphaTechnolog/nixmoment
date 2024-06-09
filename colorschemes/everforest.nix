{
  wallpaper = ./wallpapers/everforest.png;

  neovim = pkgs: {
    extraPlugins = [pkgs.vimPlugins.everforest];

    colorscheme = "everforest";

    globals = {
      everforest_better_performance = 0;
      everforest_disable_italics = 1;
      everforest_background = "hard";
    };
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "cyan";
      secondary = "green";
    };

    primary = {
      background = "#272e33";
      foreground = "#d3c6aa";
    };

    normal = {
      black = "#414b50";
      red = "#e67e80";
      green = "#a7c080";
      yellow = "#dbbc7f";
      blue = "#7fbbb3";
      magenta = "#d699b6";
      cyan = "#83c092";
      white = "#d3c6aa";
    };

    bright = normal // {
      black = "#475258";
      white = "#d3c6aa";
    };
  };
}

