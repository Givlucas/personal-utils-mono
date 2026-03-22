#action
#discovery

# Note

# Statement of action
Create a helper script which will create hashed password files to be used with your current nix configuration strategy

# Statement of inputs
- [[./actions/Create repo structure.md]]

# Statement of specifications

# Statement of design

Create a helper script using the standard repo structure + the `pkgs.writeShellApplication` nix function to create a derviation. This is chosen over other utilities because it allows for runtime dependnacies to be set.

Create a new project directory call "pswd". This script should take the user name of the user the password should be made for and the password for the user.

Then using the `mkpasswd` unix command it should write a password file to the directory. `/persist/secrets/{user name}-password`.

the password should be encrypted using sha256
