{ pkgs, vars, ... }: {
  users.users.${vars.user} = {
    home = "/Users/${vars.user}";
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
  };

  environment = {
    variables = {
      EDITOR = vars.editor;
      VISUAL = vars.editor;
    };
    systemPackages = with pkgs; [ eza go ];
  };
}
