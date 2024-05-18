{
  lib,
  pkgs,
  flakeConfig,
  ...
}: {
  programs = {
    dconf.enable = true;
  };

  services = {
    libinput.enable = true;
    openssh.enable = true;

    xserver = {
      enable = true;

      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+awesome";

        autoLogin = {
          enable = true;
          user = flakeConfig.user.name;
        };
      };

      windowManager.awesome = {
        enable = true;

        luaModules = lib.attrValues {
          inherit
            (pkgs.luaPackages)
            lgi
            ldbus
            luadbi-mysql
            luaposix
            ;
        };
      };
    };
  };
}
