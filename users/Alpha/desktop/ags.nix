{pkgs, ...}: {
  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      accountsservice
      gtksourceview
      webkitgtk
    ];
  };
}
