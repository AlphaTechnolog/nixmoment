{
  lib,
  stdenv,
  dpkg,
  makeWrapper,
  buildFHSEnv,
  fetchurl,
  ...
}: let
  system = "x86_64-linux";
  version = "2.02.22";

  # this comes with lfs in this repository.
  src = ../misc/fmodstudio20222linux64-installer.deb;
in stdenv.mkDerivation rec {
  pname = "fmodstudio20222linux64-installer";

  inherit
    version
    system
    src
  ;

  nativeBuildInputs = [
    makeWrapper
    dpkg
  ];

  fhsEnv = buildFHSEnv {
    name = "${pname}-fhs-env";
    runScript = "";

    targetPkgs = pkgs: with pkgs; [
      xorg.libXrandr
      xdg-utils
      gsettings-desktop-schemas
      hicolor-icon-theme
      fontconfig
      freetype
      lsb-release
    ];

    multiPkgs = pkgs: with pkgs; [
      cups
      gtk3
      expat
      libxkbcommon
      alsa-lib
      nss
      libdrm
      mesa
      nspr
      atk
      dbus
      at-spi2-core
      pango
      libva
      openssl
      cairo
      libnotify
      libuuid
      udev
      libappindicator
      wayland
      cpio
      icu
      libpulseaudio
      libglvnd
      glib
      gdk-pixbuf
      libxml2
      zlib
      clang
      git
      gnome2.GConf
      libcap
    ] ++ (with pkgs.xorg; [
      libXcomposite
      libXext
      libXdamage
      libXfixes
      libxcb
      libxshmfence
      libXScrnSaver
      libXtst
      libX11
      libXcursor
      libXi
      libXrender
    ]);
  };

  unpackCmd = "dpkg -x $curSrc src";

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    mv opt/ usr/share/ $out

    makeWrapper ${fhsEnv}/bin/${pname}-fhs-env $out/opt/fmodstudio/fmodstudio.wrapped \
      --add-flags $out/opt/fmodstudio/fmodstudio \
      --argv0 fmodstudio.wrapped

    mkdir -p $out/bin
    ln -s $out/opt/fmodstudio/fmodstudio.wrapped $out/bin/fmodstudio

    substituteInPlace $out/share/applications/fmodstudio.desktop \
      --replace /opt/fmodstudio/fmodstudio $out/opt/fmodstudio/fmodstudio.wrapped

    runHook postInstall
  '';
}

