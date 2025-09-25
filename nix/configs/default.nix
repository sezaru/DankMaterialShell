{ cfg, lib, pkgs, ... }:

{
  programs.quickshell = {
    enable = true;
    package = cfg.quickshell.package;

    configs.dms = "${pkgs.dankMaterialShell}/etc/xdg/quickshell/DankMaterialShell";
    activeConfig = lib.mkIf cfg.enableSystemd "dms";

    systemd = lib.mkIf cfg.enableSystemd {
      enable = true;
      target = "graphical-session.target";
    };
  };

  home.packages =
    [
      pkgs.material-symbols
      pkgs.inter
      pkgs.fira-code

      pkgs.ddcutil
      pkgs.libsForQt5.qt5ct
      pkgs.kdePackages.qt6ct
      pkgs.dmsCli
    ]
    ++ lib.optional cfg.enableSystemMonitoring pkgs.dgop
    ++ lib.optionals cfg.enableClipboard [pkgs.cliphist pkgs.wl-clipboard]
    ++ lib.optionals cfg.enableVPN [pkgs.glib pkgs.networkmanager]
    ++ lib.optional cfg.enableBrightnessControl pkgs.brightnessctl
    ++ lib.optional cfg.enableNightMode pkgs.gammastep
    ++ lib.optional cfg.enableDynamicTheming pkgs.matugen
    ++ lib.optional cfg.enableAudioWavelength pkgs.cava
    ++ lib.optional cfg.enableCalendarEvents pkgs.khal;
}
