{ lib, pkgs, ... }: {
  pkgs = import ./pkgs.nix { inherit pkgs lib; };
}
