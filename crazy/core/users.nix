{
  lib,
  pkgs,
  flakeConfig,
  ...
}:
with flakeConfig.user; {
  users.users."${name}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];

    inherit initialPassword;

    packages = lib.mkIf packages.enable (
      packages.generator pkgs
    );
  };
}
