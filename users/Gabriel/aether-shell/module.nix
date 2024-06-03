{ pkgs, lib, config, flakeConfig, ... }: let
  inherit (flakeConfig) user;
  inherit (flakeConfig.modules.homeManager) aetherShell;

  default-configuration = import ./default-configuration.nix {
    inherit lib flakeConfig pkgs;
  };
in {
  meta.maintainers = [lib.maintainers.alphatechnolog];

  options.programs.aether-shell = with lib; {
    enable = mkEnableOption "aether-shell";

    autostart = mkOption (let
      inherit (default-configuration) autostart;
    in {
      type = types.listOf types.str;
      example = autostart;
      default = autostart;

      description = ''
        Define the programs to autostart
      '';
    });

    general-behavior = mkOption (let
      inherit (default-configuration) general-behavior;
    in {
      type = types.attrs;
      example = general-behavior;
      default = general-behavior;

      description = ''
        General behavior variables such as feature flags
      '';
    });

    user-likes = mkOption (let
      inherit (default-configuration) user-likes;
    in {
      type = types.attrs;
      example = user-likes;
      default = user-likes;

      description = ''
        The user likes configuration for the aether shell env.
      '';
    });
  };

  config = let
    cfg = config.programs.aether-shell;
    jsonFormat = pkgs.formats.json {};
  in {
    xdg.configFile."aether-shell/user-likes.json" = lib.mkIf (cfg.user-likes != { }) {
      source = jsonFormat.generate "user-likes.json" cfg.user-likes;
    };

    xdg.configFile."aether-shell/autostart.json" = lib.mkIf (cfg.autostart != [ ]) {
      source = jsonFormat.generate "autostart.json" cfg.autostart;
    };

    xdg.configFile."aether-shell/general-behavior.json" = lib.mkIf (cfg.general-behavior != { }) {
      source = jsonFormat.generate "general-behavior.json" cfg.general-behavior;
    };

    home.activation = lib.mkIf cfg.enable {
      installAetherShell = let
        username = user.name;
        git = lib.getExe pkgs.git;
      in ''
        if ! test -d ~/.config/awesome; then
          ${git} clone https://github.com/alphatechnolog/aether-shell.git --recursive \
            ~/.config/awesome || true

          # check if it got cloned successfully, it shouldn't fial if so
          if test -d ~/.config/awesome; then
            chown -R ${username} ~/.config/aether-shell
            chown -R ${username} ~/.config/awesome
          fi
        fi
      '';
    };
  };
}
