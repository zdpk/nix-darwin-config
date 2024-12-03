{ pkgs, vars, ... }:

{
  # enable touch id instead of password whenever sudo permission is needed
  security.pam.enableSudoTouchIdAuth = true;

  # homebrew settings
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    # user owns the homebrew prefix
    user = vars.user;
    autoMigrate = true;
  };

  # download apps
  homebrew = {
    enable = true;

    # "zap" option ensure only the pkgs specified are installed
    onActivation = {
      upgrade = false;
      cleanup = "zap";
    };

    brews = [
      # for searching app id registered on mac app store
      "mas"
      "fish"
      # "terraform"
    ];

    casks = [
      "alacritty"
      "firefox"
      "wezterm"
      "raycast"
      "chatgpt"
      "claude"
      "google-chrome"
      "discord"
      "rectangle"
      "slack"
      "docker"
      "visual-studio-code"
      "orbstack"
      "intellij-idea"
      "obsidian"
      "notion"
      "zed"
      "iina"
      "daisydisk"
      "coconutbattery"
      "brave-browser"
      # fonts
      "font-geist-mono-nerd-font"
      "font-fira-code-nerd-font"
    ];

    masApps = {
      "KakaoTalk" = 869223134;
      "ChannelTalk" = 1102655071;
      "Perplexity" = 6714467650;
    };
  };
}
