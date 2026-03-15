{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }: rec {

    pkgs-list = builtins.readDir ./pkgs;

    packages.x86_64-linux = builtins.mapAttrs (name: value: {
      name = "./pkgs/${name}";      
    }) pkgs-list;
  
    # packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
    
  };
}
