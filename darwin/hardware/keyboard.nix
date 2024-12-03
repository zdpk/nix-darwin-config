# { config, lib, pkgs, ... }:

# with lib;

# let
#   cfg = config.system.keyboard;

#           # Right Cmd
#   srcKeyHex = "0x7000000E7";
#           # F17
#           dstKeyHex = "0x70000006C";
# in

# {
#   options = {
#     system.keyboard.enableKeyMapping = mkOption {
#       type = types.bool;
#       default = false;
#     };

#     system.keyboard.remapAToB = mkOption {
#       type = types.bool;
#       default = false;
#     };

#     system.keyboard.userKeyMapping = mkOption {
#       type = types.listOf (types.attrsOf types.int);
#       default = [];
#     };
#   };

#   config = {

#     system.keyboard.enableKeyMapping = mkDefault (cfg.userKeyMapping != []);

#     system.keyboard.userKeyMapping = mkMerge [
#       (mkIf cfg.remapAToB [{ HIDKeyboardModifierMappingSrc = ${srcKeyHex}; HIDKeyboardModifierMappingDst = ${dstKeyHex}; }])
#       # ...
#     ];

#     system.activationScripts.keyboard.text = optionalString cfg.enableKeyMapping ''
#       # Configuring keyboard
#       echo "remapping keys..." >&2
#       hidutil property --set '{"UserKeyMapping":${builtins.toJSON cfg.userKeyMapping}}'
#     '';

#   };
# }
{ pkgs, ... }:

let

in {

  system.defaults = {
    NSGlobalDomain = {
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
    };
    CustomUserPreferences = {
      NSGlobalDomain = {
        # Languages & Region
        AppleLanguages = [ "en-US" "ko-KR" ];
        # AppleLocale = "ko_KR";
      };
      "com.apple.HIToolbox" = {
        # AppleCurrentKeyboardLayoutInputSourceID = "com.apple.keylayout.ABC";
        AppleDictationAutoEnable = 0;
        AppleEnabledInputSources = [
          {
            InputSourceKind = "Keyboard Layout";
            "KeyboardLayout ID" = 252;
            "KeyboardLayout Name" = "ABC";
          }
          # ---------------------------------------------------------------------------
          # check current input sources by `defaults read com.apple.HIToolBox`
          # for using Korean keyboard, 2 of records below are mandatory. don't know why
          # ---------------------------------------------------------------------------
          {
            "Bundle ID" = "com.apple.inputmethod.Korean";
            "Input Mode" = "com.apple.inputmethod.Korean.2SetKorean";
            InputSourceKind = "Input Mode";
          }
          {
            "Bundle ID" = "com.apple.inputmethod.Korean";
            InputSourceKind = "Keyboard Input Method";
          }
        ];
        # AppleSelectedInputSources = [

        # ];
      };

      # 
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          # Input Sources - Select prev input sources
          "60" = {
            enabled = true;
            value = {
              type = "standard";
              parameters = [
                191 # F17
                0
                0
                # 32
                # 49
                # 786432
              ];
            };
          };
          # Disable Select next input sources
          "61" = { enabled = false; };
        };
      };
    };

  };
  # system.launchd.services = {
  #   disableTextReplacement = {
  #     description = "Disable macOS Text Replacement";
  #     program = "/usr/bin/defaults";
  #     args = [
  #       "write"
  #       "NSGlobalDomain"
  #       "NSReplacementsDisabled"
  #       "-bool"
  #       "true"
  #     ];
  #     runAtLoad = true;
  #   };
  # };
  # system.activationScripts = {
  #     disableTextReplacement = ''
  #       defaults write NSGlobalDomain NSReplacementsDisabled -bool true
  #     '';        
  #   };
  # system.keyboard = {
  #   enableKeyMapping = true;
  # };

  # "Remap `Right Cmd` to `F17`"
  launchd.user.agents.UserKeyMapping.serviceConfig = {
    ProgramArguments = [
      "/usr/bin/hidutil"
      "property"
      # "--match"
      "--set"
      (
        # [refer to Apple Developer Documentation for more key codes]
        # https://developer.apple.com/library/archive/technotes/tn2450/_index.html
        let
          # Right Cmd
          srcKeyHex = "0x7000000E7";
          # F17
          dstKeyHex = "0x70000006C";
        in ''
          {
            "UserKeyMapping": [
              {
                 "HIDKeyboardModifierMappingSrc": ${srcKeyHex},
                 "HIDKeyboardModifierMappingDst": ${dstKeyHex}
              }
            ]
          }
        '')
    ];
    # exec whenever rebooted
    RunAtLoad = true;
  };
}
