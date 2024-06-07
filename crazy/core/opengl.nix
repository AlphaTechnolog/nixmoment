{ pkgs, ... }: {
  hardware.opengl = {
    enable = true;
    extraPackages = [pkgs.mesa.drivers];
  };
}
