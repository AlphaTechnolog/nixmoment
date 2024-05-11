{
  lib,
  pkgs,
}: {
  "black-formatter.path" = [(lib.getExe pkgs.black)];
  "stylua.styluaPath" = lib.getExe pkgs.stylua;
  "Lua.misc.executablePath" = "${pkgs.sumneko-lua-language-server}/bin/lua-language-server";
  "nix.serverPath" = lib.getExe pkgs.nil;
  "nix.enableLanguageServer" = true;
  "zig.path" = lib.getExe pkgs.zig;
  "zig.initialSetupDone" = true;
  "zig.zls.path" = lib.getExe pkgs.zls;
  "[lua]"."editor.defaultFormatter" = "JohnnyMorganz.stylua";
}
