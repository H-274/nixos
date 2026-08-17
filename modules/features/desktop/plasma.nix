{
  flake.nixosModules.plasma = { lib, config, ... }:
  let
    cfg = config.desktop.plasma;
    options.desktop.plasma.enable = lib.mkEnableOption "Enable Plasma desktop";
  in {

    config = lib.mkIf cfg.enable {
      services.desktopManager.plasma6.enable = true;
      # add other Plasma‑specific settings here later
    };
  };
}