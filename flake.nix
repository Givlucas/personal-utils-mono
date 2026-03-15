{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in rec {

    pkgs-list = builtins.readDir ./pkgs;

    packages.${system} = builtins.mapAttrs (name: value: {
      ${name} = pkgs.callPackage "./pkgs/${name}";      
    }) pkgs-list;

    devShells.${system}.default = pkgs.mkShell {
      packages = [
        pkgs.cargo
      ];
    };
    
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    
  };
}
