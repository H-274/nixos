{
  flake.nixosModules.coloursHome = { self, pkgs, ... }: {

    home-manager.users.colours = {
      home.packages = [
        pkgs.cowsay
      ];
      wayland.windowManager.hyprland.enable = true; # enable Hyprland

      programs = {
        home-manager.enable = true;
        git.enable = true;
        gh.enable = true;
        firefox.enable = true;
        kitty.enable = true; # required for the default Hyprland config
        cowsay.enable = true;
      };

      home.stateVersion = "25.05";
    };
  };
}