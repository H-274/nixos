{ self, ... }: {
  flake.nixosModules.coloursHome = { ... }: {
    imports = [
      self.nixosModules.coloursUser
      inputs.home-manager.nixosModules.home-manager
    ];

    self.home-manager.users.colours = {
      home.packages = [ ];
      wayland.windowManager.hyprland.enable = true; # enable Hyprland

      programs = {
        home-manager.enable = true;
        git.enable = true;
        github-cli.enable = true;
        firefox.enable = true;
        kitty.enable = true; # required for the default Hyprland config
      };

      home.stateVersion = "26.05";
    };
  };
}