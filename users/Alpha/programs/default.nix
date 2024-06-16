{
  imports = [
    ./x11-misc/alacritty.nix
    ./x11-misc/picom.nix
    ./net-im/discord.nix
    ./app-editors/vscode
    ./app-editors/neovim
    ./app-misc/tmux.nix

    # not gentoo name-style :sob:
    ./pkgs
  ];
}
