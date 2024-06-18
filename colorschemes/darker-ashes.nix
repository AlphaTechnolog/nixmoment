{
  wallpaper = ./wallpapers/cozy.png;

  # no neovim config ;-;
  neovim = _: {};

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "cyan";
    };

    primary = {
      background = "#141416";
      foreground = "#dfe2e5";
    };

    normal = {
      black = "#2c2c30";
      red = "#c79595";
      green = "#aec795";
      yellow = "#c7c795";
      blue = "#95aec7";
      magenta = "#ae95c7";
      cyan = "#95c7ae";
      white = "#dfe2e5";
    };

    bright = normal // {
      black = "#3f3f45";
      white = "#f3f4f5";
    };
  };
}

