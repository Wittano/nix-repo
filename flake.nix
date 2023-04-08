{
  description = "Wittano nixpkgs repository";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };

      lib = nixpkgs.lib.extend (self: super: {
        my = import ./lib { inherit pkgs; lib = self; };
      });
    in
    {
      inherit lib;

      packages.x86_64-linux = self.lib.my.pkgs.importPkgs ./pkgs;

      # TODO Use other package as default package
      defaultPackage.x86_64-linux = self.packages.x86_64-linux.wings;

    };
}
