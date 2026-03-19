{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {

        pkgs-list = builtins.readDir ./pkgs;

        packages = builtins.mapAttrs (name: value:
          pkgs.callPackage ./pkgs/${name} {}
        ) pkgs-list;

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.cargo
          ];
        };
      }
  );      
}
