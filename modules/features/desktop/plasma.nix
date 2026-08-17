{ lib, config, ... }: {
  flake.nixosModules.plasma = { lib, config, ... }: {
    options.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma desktop";

    config = lib.mkIf config.desktop.plasma.enable {
      services.desktopManager.plasma6.enable = true;
    };
  };
}