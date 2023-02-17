with import <nixpkgs> { };
mkShell {
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    glibc
    stdenv.cc.cc
  ];
  NIX_LD = lib.fileContents "${stdenv.cc}/nix-support/dynamic-linker";
  buildInputs = with pkgs; [
    sumneko-lua-language-server stylua
    nodePackages.prettier
    nodePackages.prettier-plugin-toml
    treefmt pre-commit
  ];
  shellHook = ''
    export NODE_PATH=${nodePackages.prettier-plugin-toml}/lib/node_modules:$NODE_PATH
  '';
}
