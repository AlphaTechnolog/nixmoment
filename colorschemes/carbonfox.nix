{
  wallpaper = ./wallpapers/carbonfox.png;

  neovim = pkgs: {
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
    };
  };

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "magenta";
    };

    primary = {
      background = "#161616";
      foreground = "#f2f4f8";
    };

    normal = {
      black = "#282828";
      red = "#ee5396";
      green = "#25be6a";
      yellow = "#08bdba";
      blue = "#78a9ff";
      magenta = "#be95ff";
      cyan = "#33b1ff";
      white = "#dfdfe0";
    };

    bright = normal // {
      black = "#484848";
      white = "#e4e4e5";
    };
  };
}

