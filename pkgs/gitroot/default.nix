{
writeShellApplication, git, ...
} :
  writeShellApplication {
    name = "gitroot";

    runtimeInputs = [
      git
    ];

    text = ''
      git rev-parse --show-toplevel
    '';
}
