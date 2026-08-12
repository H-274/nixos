{
  flake.nixosModules.coloursUser = { ... }: {
    users.users.colours = {
      isNormalUser = true;
      description = "colours";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}