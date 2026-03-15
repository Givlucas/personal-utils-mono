{
rustPlatform, ...
} : rustPlatform.buildRustPackage {
  pname = "hello-world";
  version = "1";
  src = ./.;
  cargoLock = {
    lockFile = ./Cargo.lock;
  };
}
