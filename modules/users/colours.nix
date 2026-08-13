{ self, ... }: {
  flake.nixosModules.coloursUser = { pkgs, ... }: {
    users.users.colours = {
      isNormalUser = true;
      description = "colours";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = self.packages.${pkgs.stdenv.hostPlatform.system}.fish;
    };
  };
}