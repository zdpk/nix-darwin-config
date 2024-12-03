{ pkgs, ... }:

let
  # config files, returns content of files
  wezterm_config = builtins.readFile ./dotfiles/wezterm.lua;
  helix_config = builtins.readFile ./dotfiles/helix.toml;

in {
  
  # home.file."<path>" - update user home directory(copy or overwrite)

  # mkForce set the priority in the home-manager system
  # it prevents the values are replaced by other config
  # home.file.".config/wezterm" = pkgs.lib.mkForce(copy_dir_recursive ./dotfiles/wezterm);
  # home.file.".config/helix" = pkgs.lib.mkForce(copy_dir_recursive ./dotfiles/helix);
  #  environment.systemPackages = [
  #       pkgs.awscli
  #       pkgs.alacritty
  #       pkgs.mkalias
  #       pkgs.neovim
  #       pkgs.helix
  #       pkgs.wezterm
  #       pkgs.gh
  #       pkgs.git
  #       pkgs.python3
  #       # pkgs.go
  # ];   

  #  environment.systemPackages = [
  # pkgs.alacritty
  # pkgs.helix
  # pkgs.wezterm
  # pkgs.neovim
  # pkgs.git
  #  ];

  home-manager.file.".config/wezterm" = {
    source = ./dotfiles/wezterm;
    mkForce = true;
  };

  home-manager.file.".config/helix" = {
    source = ./dotfiles/helix;
    mkForce = true;
  };
}
