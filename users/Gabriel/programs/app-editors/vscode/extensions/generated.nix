# check out the script [.scripts/code-update-installed-exts.sh](https://github.com/alphatechnolog/crazy/tree/main/.scripts/code-update-installed-exts.sh)
# in order to generate more extensions here when adding more manually.
{pkgs}:
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "tokyo-night";
    publisher = "enkia";
    version = "1.0.6";
    sha256 = "0a0f7d0rk0z4hs3gfw96piyrz1xqhrj2c3ij6kfvy2wj9q0m8rsm";
  }
  {
    name = "rust-bundle";
    publisher = "1yib";
    version = "1.0.0";
    sha256 = "19d53vkmn08rvysg934xdhhxbiwd52ha1dwjfwhnaan1s9gwfsqv";
  }
  {
    name = "one-monokai";
    publisher = "azemoh";
    version = "0.5.0";
    sha256 = "1rqg3np6jc9lrl9xqq8iq74y4ag3wnj5c0zv9h9ljpk5xzp4rdva";
  }
  {
    name = "rust-syntax";
    publisher = "dustypomerleau";
    version = "0.6.1";
    sha256 = "0rccp8njr13jzsbr2jl9hqn74w7ji7b2spfd4ml6r2i43hz9gn53";
  }
  {
    name = "nix-ide";
    publisher = "jnoortheen";
    version = "0.3.1";
    sha256 = "1cpfckh6zg8byi6x1llkdls24w9b0fvxx4qybi9zfcy5gc60r6nk";
  }
  {
    name = "vscode-clangd";
    publisher = "llvm-vs-code-extensions";
    version = "0.1.28";
    sha256 = "1kys452zd99519jwvw5yqil0lm8wjvfaczsb555l0lk9lligbn35";
  }
  {
    name = "symbols";
    publisher = "miguelsolorio";
    version = "0.0.17";
    sha256 = "0b9mknig6fmhzs0fy1mwsa7bnwkqabsrwjmrcdmggrx9p8956v42";
  }
  {
    name = "theme-monokai-pro-vscode";
    publisher = "monokai";
    version = "1.3.2";
    sha256 = "0ws594m3s1l4143r3vamdmpb2z77ny0g5zn2srv06az5iiag4f9z";
  }
  {
    name = "color-highlight";
    publisher = "naumovs";
    version = "2.8.0";
    sha256 = "14capk3b7rs105ij4pjz42zsysdfnkwfjk9lj2cawnqxa7b8ygcr";
  }
]
