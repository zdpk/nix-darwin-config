{ inputs, nixpkgs, darwin, homebrew, home-manager, vars, ... }:

{
  # username = x

  ${vars.user} = darwin.lib.darwinSystem {
    specialArgs = { inherit inputs nixpkgs vars; };
    modules = [
      {
        nixpkgs.hostPlatform = "${vars.arch}-${vars.platform}";
        nixpkgs.config.allowUnfree = true;
        system.stateVersion = 5;
      }
      homebrew.darwinModules.nix-homebrew
      home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
      # custom modules
      # ./darwin_config.nix
      ./homebrew.nix
      ./app.nix
      ./hardware
      # ./program
    ];
  };

  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
  # # Expose the package set. including overlays. for convenience
  # darwinPackages = self.darwinConfigurations.${username}.pkgs; 
}
