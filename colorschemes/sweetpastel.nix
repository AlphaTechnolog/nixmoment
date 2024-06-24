{
  wallpaper = ./wallpapers/city.png;

  # no neovim config ;-;
  neovim = _: {};

  palette = rec {
    scheme = "dark";

    accents = {
      primary = "blue";
      secondary = "cyan";
    };

    primary = {
      background = "#1B1F23";
      foreground = "#DEE2E6";
    };

    normal = {
      black = "#2f3337";
      red = "#e5a3a1";
      green = "#9EDABE";
      yellow = "#ECE3B1";
      blue = "#A3CBE7";
      magenta = "#B1A8FB";
      cyan = "#C9D4FF";
      white = "#F8F9FA";
    };

    bright =
      normal
      // {
        black = "#4b4f53";
        white = "#F8F9FA";
      };
  };
}
