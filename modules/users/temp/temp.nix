{
  flake.nixosModules.tempUser = { ... }: {
    users.users.temp = {
      isNormalUser = true;
      description = "temp";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}