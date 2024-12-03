{ inputs, nixpkgs, home-manager, vars, ... }:

{
  ${vars.user} = home-manager.lib.homeManagerConfiguration {
    specialArgs = { inherit inputs nixpkgs vars; };
    modules = [ ./dotfiles.nix ./profile.nix ];
    home-manager.users.${vars.user} = { home.stateVersion = "24.05"; };
    system = { stateVersion = 5; };
  };
}
