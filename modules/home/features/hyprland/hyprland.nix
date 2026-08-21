{
  flake.homeManagerModules.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;

      settings = {
        "$mod" = "SUPER";
        bind = [
          
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, moveToWorkspace, ${toString ws}"
            ])
          9)
        );
      };
    };
  };  
}
