{ lib, ... }: {
  options.desktop.plasma.enable = lib.mkEnableOption;

  config = lib.mkIf options.desktop.plasma.enable {
    services.desktopManager.plasma6.enable = true;
  }
}