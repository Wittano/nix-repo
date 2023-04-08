with (import <nixpkgs> { });
mkShell {
  buildInputs = with pkgs; [ rnix-lsp nixfmt nixpkgs-fmt ];
}
