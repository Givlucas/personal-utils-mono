{
writeShellApplication, mkpasswd, ...
} :
  writeShellApplication {
    name = "pswd";

    runtimeInputs = [
      mkpasswd
    ];

    text = ''
      set -e

      file_path="/persist/secrets/$2-password"
      
      password=$(mkpasswd -m sha-512 "$1")

      echo "$password" > "$file_path"

    '';
}
