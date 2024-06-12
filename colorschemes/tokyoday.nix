{
  wallpaper = ./wallpapers/bright.png;

  neovim = pkgs: {
    colorschemes.tokyonight = {
      enable = true;
      settings.style = "day";
    };
  };

  palette = rec {
    scheme = "light";

    accents = {
      primary = "blue";
      secondary = "cyan";
    };

    primary = {
      background = "#e1e2e7";
      foreground = "#3760bf";
    };

    normal = {
      black = "#a1a6c5";
      red = "#f52a65";
      green = "#587539";
      yellow = "#8c6c3e";
      blue = "#2e7de9";
      magenta = "#9854f1";
      cyan = "#007197";
      white = "#6172b0";
    };

    bright = normal // {
      black = "#7e84af";
      white = "#3760bf";
    };
  };
}

