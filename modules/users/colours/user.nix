{
  let userConfig =  {
    users.users.colours = {
      isNormalUser = true;
      description = "colours";
      initialPassword = "12345";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  } in {
    flake.nixosModules.coloursUser = userConfig;
    userConfig;
  }
}