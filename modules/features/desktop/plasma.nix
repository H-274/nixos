{ lib, config, ... }: {
  flake.nixosModules.plasma = { lib, config, ... }: let
    cfg = config.desktop.plasma;
  in {
    options.desktop.plasma.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Plasma desktop";
    };

    config = lib.mkIf cfg.enable {
      services.desktopManager.plasma6.enable = true;
    };
  };
}