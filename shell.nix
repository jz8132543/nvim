with import <nixpkgs> {};
  mkShell {
    buildInputs = with pkgs; [
      sumneko-lua-language-server
      stylua
      nil
      alejandra
      taplo
      lefthook
    ];
  }
