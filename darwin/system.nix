{ pkgs, config, lib, ... }:

{
  security.pam.enableSudoTouchIdAuth = true;

  environment = {
    loginShell = pkgs.fish;
    systemPackages = [
      pkgs.awscli
      pkgs.alacritty
      pkgs.mkalias
      pkgs.neovim
      pkgs.helix
      pkgs.wezterm
      pkgs.gh
      pkgs.git
      pkgs.python3
      pkgs.go
    ];
  };

  system.defaults.trackpad = {
    Clicking = true;
    TrackpadRightClick = true;
    TrackpadThreeFingerDrag = false;
  };

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  system.defaults = {
    controlcenter = {
      BatteryShowPercentage = true;
      # 18 = display icon in menu bar, 24 = hide icon in menu bar
      Bluetooth = true;
      Display = true;
      FocusModes = true;
      NowPlaying = true;
    };
    dock = {
      largesize = 64;
      autohide = true;
      mineffect = "scale";
      mru-spaces = false; # most recently used spaces
    };
    # dock.persistent-apps = [];
    loginwindow.GuestEnabled = false;

    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      # false = non natural scroll direction(need reboot)
      "com.apple.swipescrolldirection" = false;
      # Key
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false; # Double space -> period
    };

  };
  services.nix-daemon.enable = true;

  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog

  # The platform the configuration will be used on.
}
