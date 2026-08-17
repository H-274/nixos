{ lib, config, ... }: {
  options.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma desktop";

  services.desktopManager.plasma6.enable = lib.mkIf config.desktop.plasma.enable true;
}