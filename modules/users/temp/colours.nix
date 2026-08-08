{
  flake.nixosModules.tempUser = { ... }: {
    users.users.colours = {
      isNormalUser = true;
      description = "temp";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}