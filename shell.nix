with import <nixpkgs> { };
mkShell {
  buildInputs = with pkgs; [
    clang-tools
    clang
    clang-analyzer
    # sumneko-lua-language-server
    stylua
  ];
  shellHook = ''
    export CLANG=${pkgs.clang}/bin/clang
    export CLANGD=${pkgs.clang-tools}/bin/clangd
  '';
}
