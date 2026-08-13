{
  flake.nixosModules.shell = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      oh-my-posh
      zsh
      kitty
    ];

    programs = {
      zsh.enable = true;
      zsh.promptInit = ''eval "$(oh-my-posh init zsh --config ${./oh-my-posh.toml})"'';
    };
  };
}