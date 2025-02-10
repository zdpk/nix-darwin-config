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
      "pulumi"
      "yq"
      "jq"
      "postgresql"
      "cocoapods"
      "terraform-ls"
      # "terraform"
    ];

    casks = [
      "flutter"
      "firefox"
      "wezterm"
      "raycast"
      "obs"
      "chatgpt"
      "claude"
      "google-chrome"
      "google-chrome@dev"
      "google-drive"
      "discord"
      "rectangle"
      "slack"
      "docker"
      "visual-studio-code"
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
      "gather"
      "rustdesk"
      "datagrip"
      "orbstack"
      "ghostty"
      "vrew"
    ];

    masApps = {
      "KakaoTalk" = 869223134;
      "ChannelTalk" = 1102655071;
      "Perplexity" = 6714467650;
      "밀리의 서재" = 1213788923;
      "Ridi" = 338813698;
      "Taza" = 452941048;
      "Final Cut" = 424389933;
      "Pixelmator Pro" = 1289583905;
      "XCode" = 497799835;
      "Compressor" = 424390742;
    };
  };
}
