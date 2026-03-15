#action
#document

# notesa

## Refrences
https://nixos.org/manual/nixpkgs/unstable/#trivial-builder-writeShellApplication

# Statment of inputs
- [[./Create repo structure.md]]

# Statement of specifications
- [x] Must be able to execute on non-nixos machines that can have nix installed
- [x] Must be able to execute for any repo in said machine

# Statement of design

To find the root of a git repostiory you can use the command

``` bash
git rev-parse --show-toplevel
  
```

On a normal machine you could set

``` bash
git config --global alias.root 'rev-parse --show-toplevel'
  
```

You could do the same on a nixos machine but then that config would not be transferable onto systems that only have access to nix, and not nixos configurations

Instead we will create a small shell application using `pkgs.writeShellApplication`. This will allow you to us it not just with nixos but with nix only systems as well.

This application will return the path to the git root only.

writeShellApplication allows for runtime dependancies so it is preffered over other options.

Create a new project directoy in pkgs called "gitroot", with a very simple default.nix derivation using the aformentioned utility.


