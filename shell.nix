with import <nixpkgs> { };
mkShell {
  buildInputs = with pkgs; [
    clang
    clang-tools
    clang-analyzer
    sumneko-lua-language-server
    stylua
  ];
  shellHook = ''
    export CLANG=${pkgs.clang}/bin/clang
    export CLANGD=${pkgs.clang-tools}/bin/clangd
  '';
}
