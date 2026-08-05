{ self, ... }: {
  flake.nixosModules.coloursUser = { inputs, nixpkgs, pkgs, ... }: {

    users.users."colours" = {
      isNormalUser = true;
      description = "colours";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };

    #(if pkgs.has home-manager 
    #then homeConfigurations.colours = pkgs.home-manager.lib.homeManagerConfiguration {
    #  perSystem = { nixpkgs, lib, system, ... }: {
    #    pkgs = import nixpkgs { system }
    #
    #    modules = [
    #      inputs.self.homeModules.bash {
    #        home.username = "colours";
    #        home.homeDirectory = "/home/colours";
    #        home.stateVersion = "25.11";
    #      }
    #    ];
    #  };
    #};
    #else null)
  };

}