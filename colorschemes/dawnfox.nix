{
  wallpaper = ./wallpapers/dawnfox.png;

  neovim = pkgs: {
    colorschemes.nightfox = {
      enable = true;
      flavor = "dawnfox";
    };
  };

  palette = rec {
    scheme = "light";

    accents = {
      primary = "magenta";
      secondary = "red";
    };

    primary = {
      background = "#faf4ed";
      foreground = "#575279";
    };

    cursor = {
      text = primary.background;
      cursor = "#4c4769";
    };

    normal = {
      black = "#575279";
      red = "#b4637a";
      green = "#618774";
      yellow = "#ea9d34";
      blue = "#286983";
      magenta = "#907aa9";
      cyan = "#56949f";
      white = "#e5e9f0";
    };

    bright = normal // {
      black = "#5f5695";
    };
  };
}
