{
  inputs,
  pkgs,
  ...
}: {
  home = {
    packages = [pkgs.discord];

    # may be broken in mainstream, but installing it anyways.
    file = {
      ".config/Vencord/themes/Decay.theme.css" = {
        source = "${inputs.decay-discord-src}/Decay.theme.css";
      };
    };
  };
}
