{
  description = "Home Manager configuration of foot";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.inputs.nixpkgs.follows = "nixpkgs"; 
    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin.url = "github:catppuccin/nix";
    stylix.url = "github:nix-community/stylix/release-25.05";

  };

  outputs = { nixpkgs, stylix, catppuccin, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
#	nixpkgs.nerd-fonts.caskaydia-mono;
    in{
      homeConfigurations."foot" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix catppuccin.homeModules.catppuccin  stylix.homeModules.stylix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
#	extraSpecialArgs = { inherit inputs; };
      };
    };
}
