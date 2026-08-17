{ lib, ... }: {
  plasma.enable = lib.mkEnableOption;

  config = lib.mkIf plasma.enable {
    services.desktopManager.plasma6.enable = true;
  }
}