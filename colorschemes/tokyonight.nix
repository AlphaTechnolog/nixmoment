{
  wallpaper = ./wallpapers/tokyonight.png;

  neovim = pkgs: {
    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "cyan";
    };

    primary = {
      background = "#1a1b26";
      foreground = "#c0caf5";
    };

    normal = {
      black = "#2c2e40";
      red = "#f7768e";
      green = "#9ece6a";
      yellow = "#e0af68";
      blue = "#7aa2f7";
      magenta = "#bb9af7";
      cyan = "#7dcfff";
      white = "#a9b1d6";
    };

    bright = normal // {
      black = "#414868";
      white = "#c0caf5";
    };
  };
}

