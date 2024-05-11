{
  lib,
  pkgs,
  inputs,
  theme,
  ...
}:

{
  programs.vscode = let
    userSettings =
      {}
      // (import ./settings/four-tabs-langs.nix {inherit lib;})
      // (import ./settings/editor.nix)
      // (import ./settings/workbench.nix)
      // (import ./settings/window.nix)
      // (import ./settings/misc.nix)
      // (import ./settings/lsp.nix {inherit lib pkgs;});

    extensions =
      []
      ++ (import ./extensions/general.nix {inherit inputs pkgs;})
      ++ (import ./extensions/generated.nix {inherit pkgs;});
  in {
    enable = true;

    inherit
      userSettings
      extensions
      ;
  };
}
