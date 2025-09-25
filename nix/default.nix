{config, pkgs, lib, ...}: let
  cfg = config.programs.dankMaterialShell;
in {
  options.programs.dankMaterialShell = (import ./options.nix { inherit lib pkgs; }).basic;

  config = lib.mkIf cfg.enable (import ./configs/default.nix { inherit cfg lib pkgs; });
}
