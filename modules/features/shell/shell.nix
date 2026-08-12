{
  flake.nixosModules.shell = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      oh-my-posh
      kitty
    ];
  };
}