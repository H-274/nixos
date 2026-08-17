{ lib, ... }: {
  hyprland.enable = lib.mkEnableOption;

  config = lib.mkIf hyprland.enable {
    # todo
  }
}