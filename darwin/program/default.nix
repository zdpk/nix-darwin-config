# { pkgs, ... }:
# {
#   imports = [
#     ./zsh.nix    
#   ];
# }

{ pkg, vars, ... }:

let
  modules = [
    ./zsh.nix
  ];
in {
  imports = modules;
}
