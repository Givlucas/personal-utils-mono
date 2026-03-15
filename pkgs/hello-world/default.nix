{
rustplatform
}
  :
rustplatform.buildRustPackage {
  pname = "hello-world";
  version = "1";
  src = ./.;
}
