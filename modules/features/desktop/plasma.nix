{ lib, config, ... }: {
  options.desktop.plasma.enable = lib.mkEnableOption;

  lib.mkIf config.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
  };
}