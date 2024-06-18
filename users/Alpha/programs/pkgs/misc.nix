{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    pavucontrol
    pfetch
    cutefetch
    nexusfetch
    psmisc
    htop
    maim
    webx
    spotify
    desmume
  ];
}
