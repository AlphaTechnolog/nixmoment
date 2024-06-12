# Simple user configuration example.
rec {
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

      # wether or not i should enable gtk configurations
      # disable if per example you're gonna use gnome as main
      # desktop environment
      gtk = {
        enable = true;
      };

      aetherShell = {
        enable = true;

        # these are the colors to be used in aether shell, by default
        # it takes the ones at `flakeConfig.colorscheme` but you can override
        # them all here, first arg is `flakeConfig.colorscheme`
        colors = colors: colors;
      };
    };
  };

  # select a colorscheme definition from `./colorschemes/*.nix`.
  metacolorscheme = import ./colorschemes/tokyoday.nix;

  # exports the palette attribute of metacolorscheme to be able to call
  # the colors from the themeable applications, even the awm one.
  colorscheme = metacolorscheme.palette;

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
