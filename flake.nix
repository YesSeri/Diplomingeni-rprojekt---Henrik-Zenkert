{
	  description = "bachelor thesis dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

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
			pkgs.pandoc
          ];
          shellHook = ''
            echo "lets go write some report yo"
          '';
        };
      });
    };
}

