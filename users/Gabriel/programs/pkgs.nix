{pkgs, ...}: {
  home.packages = with pkgs; [
    unityhub
    fmodstudio
    github-cli
    git-lfs
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
    vlc
    clang
    clang-tools
    file
    nix-index
  ];
}
