{
  description = "Flake for the BreezeX-Hyprcursor Theme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: let
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.black = pkgs.stdenv.mkDerivation {
      pname = "BreezeX-Hyprcursor-Black";
      version = "2.0.1";

      src = ./black;

      buildPhase = "";
      installPhase = ''
        mkdir -p $out/BreezeX-Black
        mv ./* $out/BreezeX-Black
      '';
    };
    packages.x86_64-linux.default = inputs.self.packages.x86_64-linux.black;
  };
}
