{
  pkgs,
  inputs,
  system,
  ...
}: {
  nixpkgs.overlays = let
    fontsOverlays = _: prev: {
      nerdfonts = prev.nerdfonts.override {
        fonts = ["CascadiaCode" "Hack" "JetBrainsMono" "IosevkaTerm" "Iosevka" "NerdFontsSymbolsOnly"];
      };
    };

    awmOverlay = final: _: let
      inherit (final) system;
      inherit (inputs) nixpkgs-f2k;
    in
      with nixpkgs-f2k.packages.${system}; {
        awesome = awesome-luajit-git;
      };

    # packages included at `../repo`
    monorepoOverlays = _: prev: {
      fmodstudio = prev.callPackage ../repo/fmodstudio.nix {};
    };

    miscOverlays = _: prev: let
      inherit (prev) system;
    in {
      picom-git = prev.picom.overrideAttrs (old: {
        src = inputs.picom-sdhand-src;
        version = "sdhand-git";
        buildInputs =
          (old.buildInputs or [])
          ++ [
            pkgs.pcre
            pkgs.xorg.xcbutil
          ];
      });

      discord-canary = prev.discord-canary.override {
        withOpenASAR = true;
        withVencord = true;
      };
    };
  in
    (with inputs; [
      nixpkgs-f2k.overlays.window-managers
      nixpkgs-f2k.overlays.compositors
      webx.overlays.${system}.default
      cutefetch.overlays.${system}.default
      nexusfetch.overlays.${system}.default
    ])
    ++ [
      awmOverlay
      fontsOverlays
      miscOverlays
      monorepoOverlays
    ];
}
