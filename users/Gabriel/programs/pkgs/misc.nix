{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    pavucontrol
    pfetch
    cutefetch
    playerctl
    psmisc
    htop
    maim
    webx
  ];
}
