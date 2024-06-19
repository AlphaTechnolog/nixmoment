{
  pkgs,
  lib,
}: {
  silentScript = name: content: let
    drv = pkgs.writeShellScriptBin name content;
  in "${lib.getExe drv}";
}
