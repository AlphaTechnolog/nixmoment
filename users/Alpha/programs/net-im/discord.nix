{
  inputs,
  pkgs,
  ...
}: {
  home.file = {
    ".config/Vencord/themes/Decay.theme.css" = {
      source = "${inputs.decay-discord-src}/Decay.theme.css";
    };
  };
}
