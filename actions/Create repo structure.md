#action
#published

# Note
- can use a flake, then each project gets to create a default.nix. This is imported into a named output in the main flake in the root

# Statement of action
Create the basic structure of the flakes and directories for the repo.

# Statement of specifications
- [x] Must be able to auto-discover new packages in the repo
- [x] Must provide a devshell
- [x] Must be pure nix
- [x] Must follow standard nixos conventions
- [x] Have nixpkgs "follows" option
- [x] Must build for all nix systems

# Statement of design
Following idiomatic nix and the nixpkgs repo, this repo will have the following structure

```
./
pkgs
  PACKAGE 1
    default.nix
  etc...
flake.nix
flake.lock
README.md
```

All packages and utilites will be stored under `pkgs` with the project name as the directory name. Each with its own default.nix derivation file.

The flake will be relatively simple, it should be a basic flake, but  It should use the `builtins.readDir` for auto pkgs discovery. Then using this list of packages automatically call the packages and export it as your "packages" output.

It should import from the most recent version of nixpkgs. 

inputs.EXT-FLAKE.inputs.nixpkgs.follows is a nixpkgs feature, not something you need to implement in your flake, so no work is needed there.

entire flake output should be built for all systems using flake utils helper function
