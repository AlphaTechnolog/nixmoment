{
  flakeConfig,
  pkgs,
  lib,
  ...
}: {
  programs.nh = let
    inherit
      (flakeConfig)
      user
      hostname
      ;
  in {
    enable = true;
    flake = "/home/${user.name}/.${hostname}";

    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
    };
  };

  system = {
    activationScripts = {
      diff = {
        supportsDryActivation = true;

        text = let
          nvd = lib.getExe pkgs.nvd;
        in ''
          ${nvd} --nix-bin-dir=${pkgs.nix}/bin diff /run/current-system "$systemConfig"
        '';
      };
    };
  };
}
