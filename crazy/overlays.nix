{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = let
    fontsOverlays = _: prev: {
      material-symbols = prev.callPackage ./pkgs/material-symbols.nix {};

      nerdfonts = prev.nerdfonts.override {
        fonts = ["Hack" "JetBrainsMono" "IosevkaTerm" "Iosevka" "NerdFontsSymbolsOnly"];
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
      inherit (inputs) cutefetch;
    in {
      cutefetch = cutefetch.packages.${system}.default;

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
    [
      inputs.nixpkgs-f2k.overlays.window-managers
      inputs.nixpkgs-f2k.overlays.compositors
      inputs.webx.overlays.x86_64-linux.default
    ]
    ++ [
      awmOverlay
      fontsOverlays
      miscOverlays
      monorepoOverlays
    ];
}
