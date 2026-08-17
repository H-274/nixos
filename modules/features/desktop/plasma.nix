# modules/features/desktop/plasma.nix
{ lib, config, ... }:
let
  cfg = config.desktop.plasma;
in {
  options.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma desktop";

  config = lib.mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
  };
}