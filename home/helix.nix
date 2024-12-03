{
  apply_dotfiles = import ./apply_dotfiles.nix;   
}
# { pkgs, lib, ... }:

# {
#   options.programs.helix = {
#     enable = lib.mkOption {
#       type = lib.types.bool;
#       default = false;
#       description = "Enable Helix text editor";
#     };

#     settings = lib.mkOption {
#       type = lib.types.attrsOf lib.types.any;
#       default = {};
#       description = "Helix editor settings";
#     };
#   };

#   config = lib.mkIf config.programs.helix.enable {
#     programs.helix = {
#       settings = {
#         theme = "autumn_night_transparent";
#         editor.cursor-shape = {
#           normal = "block";
#           insert = "bar";
#           select = "underline";
#         };
#       };

#       languages.language = [
#         {
#           name = "nix";
#           auto-format = true;
#           formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
#         }
#       ];

#       themes = {
#         authmn_night_transparent = {
#           "inherits" = "autumn_night";  
#           "ui.background" = {};
#         };
#       };
#     };
#   };
# }
