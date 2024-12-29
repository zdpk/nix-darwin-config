{ pkgs, vars, ... }:

{
  # home.packages = [
  #   pkgs.fishPlugins.done
  #   pkgs.fishPlugins.github-copilot-cli-fish
  # ];

  # Apps
  environment.systemPackages = with pkgs; [
    cloc
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
    nodejs
    google-cloud-sdk
    # [currently error to download pulumi]
    # pulumi
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    zoxide
    starship
    fish
    pnpm
    uv
    ruff
    openssl
    cargo-lambda
    poetry
    lefthook
    dprint
    docker
  ];

  users.users.${vars.user} = {
    shell = pkgs.fish;
    home = "/Users/${vars.user}";
  };
  programs.fish = {
    enable = true;
  };

  # programs.fish.shellAliases = with pkgs; {
  #     # Nix related
  #   drb = "darwin-rebuild build --flake ${nixConfigDirectory}";
  #   drs = "darwin-rebuild switch --flake ${nixConfigDirectory}";
  #   flakeup = "nix flake update ${nixConfigDirectory}";
  #   nb = "nix build";
  #   nd = "nix develop";
  #   nf = "nix flake";
  #   nr = "nix run";
  #   ns = "nix search";
  #   # Other
  #   ".." = "cd ..";
  #   ":q" = "exit";
  #   cat = "${bat}/bin/bat";
  #   du = "${du-dust}/bin/dust";
  #   g = "${gitAndTools.git}/bin/git";
  #   la = "ll -a";
  #   ll = "ls -l --time-style long-iso --icons";
  #   ls = "${eza}/bin/eza";
  #   tb = "toggle-background";
  # };
  # programs.zsh = {
  #   enable = true;
  #   enableBashCompletion = true;
  #   # enableCompletiontrue = true;
  #   # enableLsColors = true;
  #   # histFile = 5000;
  #   # histSize = 5000;
  #   # autosuggestions = true;
  #   # plugins = [
  #   #   "zsh-autosuggestions"
  #   #   "zsh-syntax-highlighting"
  #   # ];
  #   promptInit = ''
  #     autoload -Uz compinit && compinit

  #     # zsh autosuggestions
  #     # source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  #     source $(dirname $fpath[1])/zsh-autosuggestions/zsh-autosuggestions.zsh

  #     # zsh syntax highlighting
  #     # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  #     source $(dirname $path[1])/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  #     # history
  #     # number of commands to be saved inside of history
  #     HISTSIZE=5000 
  #     # file that's used to store all of command history
  #     HISTFILE=~/.zsh_history
  #     # must be same size as $HISTSIZE
  #     SAVEHIST=$HISTSIZE
  #     # erase any duplicates inside of history
  #     HISTDUP=erase

  #     # append new commands to the history file instead of overwrite
  #     setopt appendhistory
  #     # share command history across all zsh sessions
  #     setopt sharehistory
  #     # prevent a command from being written to the history by adding a space before it
  #     setopt hist_ignore_space

  #     setopt hist_ignore_all_dups
  #     setopt hist_ignore_dups
  #     setopt hist_save_no_dups

  #     # prevent any duplicates from being shown to us inside of historical search
  #     setopt hist_find_no_dups


  #     # completion case insensitive
  #     zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  #     # zstyle ':completion:*' list-colors "$(s.:.)LS_COLORS"
  #     zstyle ':completion:*' menu no

  #     # aliases
  #     alias ls='ls --color'
  #     alias c='clear'

  #     # shell integration
  #     eval "$(starship init zsh)"
  #     eval "$(fzf --zsh)"
  #     eval "$(zoxide init zsh)"

  #     # keybindings
  #     bindkey -e
  #     bindkey '^p' history-search-backward
  #     bindkey '^n' history-search-forward
  #   '';
  # };

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
