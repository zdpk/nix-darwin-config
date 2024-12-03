{ pkg, vars, ... }:

let
  modules = [
    ./keyboard.nix
    ./screen.nix
  ];
in {
  imports = modules;
}
