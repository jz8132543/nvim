with import <nixpkgs> { };
mkShell {
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    glibc
    stdenv.cc.cc
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  buildInputs = with pkgs; [
    clang-tools
    clang
    clang-analyzer
    sumneko-lua-language-server
    stylua
  ];
  shellHook = ''
    export CLANG=${pkgs.clang}/bin/clang
    export CLANGD=${pkgs.clang-tools}/bin/clangd
  '';
}
