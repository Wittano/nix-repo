{
  description = "Wittano nixpkgs repository";

  outputs = { self, nixpkgs }: {
    pkgs = import nixpkgs {
      system = "x86_64-linux";
    };

    # TODO Add autoimporting packages from pkgs directory
    packages.x86_64-linux = {
      wings-sddm-theme = self.pkgs.callPackage ./pkgs/sddm/theme/wings-sddm-theme { };
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.wings-sddm-theme;

  };
}
