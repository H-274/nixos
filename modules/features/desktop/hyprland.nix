{ lib, config, ... }: {
  desktop.hyprland.enable = lib.mkEnableOption;

  config = lib.mkIf config.desktop.hyprland.enable {
    # todo
  };
}