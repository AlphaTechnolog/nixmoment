{pkgs, ...}: {
  home.packages = with pkgs; [
    github-cli
    slack
    rofi
    pavucontrol
    pfetch
    cutefetch
    obs-studio
    playerctl
    psmisc
    htop
    firefox
    maim
    unityhub
    vlc
    clang
    clang-tools
    file
    nix-index
  ];
}
