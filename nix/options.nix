{ lib, pkgs, ... }: let
  inherit (lib.types) bool;

  basic = {
    enable = lib.mkEnableOption "DankMaterialShell";

    enableSystemd = lib.mkEnableOption "DankMaterialShell systemd startup";
    enableSystemMonitoring = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to use system monitoring widgets";
    };
    enableClipboard = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to use the clipboard widget";
    };
    enableVPN = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to use the VPN widget";
    };
    enableBrightnessControl = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to have brightness/backlight support";
    };
    enableNightMode = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to have night mode support";
    };
    enableDynamicTheming = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to have dynamic theming support";
    };
    enableAudioWavelength = lib.mkOption {
      type = bool;
      default = true;
      description = "Add needed dependencies to have audio waveleng support";
    };
    enableCalendarEvents = lib.mkOption {
      type = bool;
      default = true;
      description = "Add calendar events support via khal";
    };
    quickshell = {
      package = lib.mkPackageOption pkgs "quickshell" {};
    };
  };

  niri = basic // {
    niri = {
      enableKeybinds = lib.mkEnableOption "DankMaterialShell niri keybinds";
      enableSpawn = lib.mkEnableOption "DankMaterialShell niri spawn-at-startup";
    };
  };
in {
  inherit basic niri;
}
