{ lib, ... }: {
  options.desktop.hyprland.enable = lib.mkEnableOption;

  config = lib.mkIf options.desktop.hyprland.enable {
    # todo
  };
}