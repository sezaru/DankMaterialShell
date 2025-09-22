{ self, dgop, dms-cli, ... }: {config, pkgs, lib, ...}: let
  cfg = config.programs.dankMaterialShell;
in {
  options.programs.dankMaterialShell = (import ./options.nix { inherit lib pkgs; }).niri;

  config = lib.mkIf cfg.enable (lib.mkMerge [
    (import ./configs/default.nix { inherit self cfg lib pkgs dgop dms-cli; })
    (import ./configs/niri.nix { inherit config cfg lib; })
  ]);
}
