{
	  description = "Dev shell with just and Tectonic";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      forAllSystems = f:
        nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
          (system: f (import nixpkgs { inherit system; }));
    in {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.just
            pkgs.watchexec
            pkgs.tectonic
          ];
          shellHook = ''
            echo "Welcome to the Nix devShell with just and Tectonic!"
          '';
        };
      });
    };
}

