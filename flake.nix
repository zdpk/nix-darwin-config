{
  description = "nix-darwin system flake";

  # inputs, outputs only can be used in the root module
  # submodules must be injected dependencies by root module
  inputs = {
    # unstable branch is the most recent versions of packages in the nix pkg repo
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };

    # User environment manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MacOS package manager
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Homebrew package manager
    homebrew = { url = "github:zhaofengli-wip/nix-homebrew"; };

    # local-config.url = "path:configuration.nix";
  };

  outputs = inputs@{ self, nixpkgs, darwin, homebrew, home-manager, ... }:
    let
      # cfg = (import ./config.nix); 
      vars = {
        user = "x";
        arch = "aarch64";
        platform = "darwin";
        editor = "helix";
        terminal = "alacritty";
      };
    in {
      nixpkgs.hostPlatform = "${vars.arch}-${vars.platform}";
      # system.stateVersion = 5;
      # darwinConfigurations = import ./darwin {
      #     inherit (nixpkgs) lib;
      #     inherit inputs nixpkgs darwin homebrew home-manager vars;
      # };
      darwinConfigurations = import ./darwin {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs darwin homebrew home-manager vars;
      };

      homeConfigurations = import ./home {
        # pick out nixpkgs.lib -> create a separate variable
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager vars;
      };

      # Expose the package set. including overlays. for convenience
      darwinPackages = self.darwinConfigurations.${vars.user}.pkgs;

    };
}
