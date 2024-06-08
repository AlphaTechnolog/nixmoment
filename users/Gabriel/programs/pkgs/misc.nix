{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    pavucontrol
    pfetch
    cutefetch
    nexusfetch
    playerctl
    psmisc
    htop
    maim
    webx
  ];
}
