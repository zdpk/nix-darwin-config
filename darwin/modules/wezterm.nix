{ config, lib, pkgs, ... }:

with lib;

let

  cfg = config.programs.wezterm;
  tomlFormat = pkgs.formats.toml { };

  shellIntegrationStr = ''
    source "${cfg.package}/etc/profile.d/wezterm.sh"
  '';

in {
  options.programs.wezterm = {
    enable = mkEnableOption "wezterm";

    package = mkOption {
      type = types.package;
      default = pkgs.wezterm;
      defaultText = literalExpression "pkgs.wezterm";
      description = "The Wezterm package to install";
    };
  };
}
