{
writeShellApplication, mkpasswd, ...
} :
  writeShellApplication {
    name = "pswd";

    runtimeInputs = [
      mkpasswd
    ];

    text = ''
      mkpasswd -m sha-256 $1 > /persist/secrets/$2-password
    '';
}
