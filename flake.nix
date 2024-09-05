{
  description = "spotube";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs
      (system: _:
        let pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.callPackage ./pkg.nix { };
        }
      )
      inputs.nixpkgs.legacyPackages;
  };
}
