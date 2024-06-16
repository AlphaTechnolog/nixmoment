{
  inputs,
  pkgs,
}: let
  normal = with pkgs.vscode-extensions; [
    bbenoist.nix
    sumneko.lua
    kamadorueda.alejandra
    xaver.clang-format
    ziglang.vscode-zig
  ];

  commExtensions = inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;

  community = with commExtensions; [
    ms-python.python
    ms-python.black-formatter
    johnnymorganz.stylua
    rvest.vs-code-prettier-eslint
    rust-lang.rust-analyzer
  ];
in
  []
  ++ normal
  ++ community
