{
  description = "marka 1.20 modpack";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: {
    devShells = let
        pkgs = import nixpkgs {
            inherit system;
        };
    in rec {
        minecraft = import ./shell.nix {
            inherit pkgs;
        };
        default = minecraft;
    };
  });
}
