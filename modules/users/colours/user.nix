{
  flake.nixosModules.coloursUser = { pkgs, ... }: {
    users.users.colours = {
      isNormalUser = true;
      description = "colours";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        kdePackages.kate
      ];
    };
  };
}