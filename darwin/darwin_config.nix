{ pkgs, lib, vars, ... }:

{
  imports = (import ./modules);

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
    extra-platforms = x86_64-darwin aarch64-darwin
  '';

  system = { stateVersion = 5; };

  # for personal user
  home-manager.users.${vars.user} = {
    # home = "/Users/${vars.user}";
    home = "/Users/${vars.user}";
    stateVersion = "24.05";
    # set fish as a default shell
    programs.fish.enable = true;
    shell = pkgs.fish;
  };

  # for system user
  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
    #   # set fish as a default shell
    shell = pkgs.fish;
  };

  # create /etc/bashrc that loads the nix-darwin environment
  # programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # fonts
  fonts.enableFontDir = true;
  fonts.fonts = with pkgs; [
    recursive
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  #
  nix = {
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  networking.hostName = vars.user;
  networking.computerName = vars.user;

  shellHook = ''
    if test -n "$FISH_VERSION"; then
      alias tf="terraform"
      alias tfa="terraform apply"
      alias tfd="terraform destroy"
      alias tfs="terraform show"
      alias tfplan="terraform plan"
    fi
  '';

}
