{
  # this is where the configuration of the system will begin at
  # crazy is the default one and serves as an example on how to use all
  # the configs listed in this file.
  mainModule = ./crazy;

  # defines some important data consumed mostly by the flake & the mainModule config
  # in the flake we use the hostname so it's required, but timezone is used by ./crazy
  hostname = "crazy";
  timeZone = "America/Caracas";

  # this is required since it's being used by the flake itself, allows the user (you) to
  # enable/disable home-manager support, if enabled, the flake will look for ./${mainModule}/home-manager.nix
  # to load a functional home manager configuration which is the one that consumes the userConfig one
  modules = {
    homeManager = {
      enable = true;
      userConfig = ./users/Gabriel;

      aetherShell = {
        enable = true;

        # these are the colors to be used in aether shell, by default
        # it takes the ones at `flakeConfig.colorscheme` but you can override
        # them all here, first arg is `flakeConfig.colorscheme`
        colors = colors: colors;
      };
    };
  };

  # define the colorscheme used for the themeable applications
  # some of them may not be themeable because they may be not
  # "nixerized", e.g: the awesomewm config (at least yet).
  colorscheme = rec {
    # colors:
    #   primary:
    #     background: "#161616"
    #     foreground: "#ffffff"
    #   search:
    #     matches:
    #       foreground: CellBackground
    #       background: '#ee5396'
    #     footer_bar:
    #       background: '#262626'
    #       foreground: '#ffffff'
    #   normal:
    #     black: "#262626"
    #     magenta: "#ff7eb6"
    #     green: "#42be65"
    #     yellow: "#ffe97b"
    #     blue: "#33b1ff"
    #     red: "#ee5396"
    #     cyan: "#3ddbd9"
    #     green: "#42be65"
    #     yellow: "#ffe97b"
    #     blue: "#33b1ff"
    #     red: "#ee5396"
    #     cyan: "#3ddbd9"
    #     white: "#ffffff"

    primary = {
      background = "#161616";
      foreground = "#ffffff";
    };

    cursor = {
      text = primary.background;
      cursor = "#ffffff";
    };

    normal = {
      black = "#262626";
      red = "#ee5396";
      green = "#42be65";
      yellow = "#ffe97b";
      blue = "#33b1ff";
      magenta = "#ff7eb6";
      cyan = "#3ddbd9";
      white = "#ffffff";
    };

    bright = normal // {
      black = "#393939";
    };
  };

  # this is used across all the flake content, defines metadata for the user, such as the name and
  # the initial password.
  user = {
    name = "Gabriel";

    # the securest password in the world fr
    initialPassword = "alpha123.";

    # here you can install packages only for the main user, these packages aren't being managed by
    # home manager but by nixos directly... see `user.packages.generator` to specify them.
    packages = {
      enable = false;

      # this is where you can specify unmanaged packages for your user
      # generator = pkgs; with pkgs; [ firefox ];
    };
  };
}
