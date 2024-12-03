{ pkgs, ... }:

{
  # Apps
  environment.systemPackages = with pkgs; [
    awscli2
    mkalias
    neovim
    helix
    terraform
    gh
    git
    python3
    rustup
    rustc
    cargo
    go
    nixfmt
    direnv
    nil
  ];

  # Fonts
  # fonts = {
  #   # enableDefaultPackages = true;
  #   packages = with pkgs; [
  #     fira
  #     fira-code
  #     fira-mono
  #     geist-font
  #     jetbrains-mono
  #     noto-fonts
  #     noto-fonts-color-emoji
  #     roboto
  #     # (nerdfonts.override {
  #     #   fonts = [
  #     #     "GeistMono"
  #     #   ];
  #     # })
  #   ];
  #   # defaultFonts = {
  #   #   monospace = ["Geist Mono"];
  #   #   serif = ["Geist"];
  #   #   sansSerif = ["Geist"];
  #   #   emoji = ["Noto Color Emoji"];
  #   # };
  #   # fontDir = {
  #   #   enable = true;
  #   #   # decompressFonts = true;
  #   # };
  # };

}
