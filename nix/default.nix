{ sources ? import ./sources.nix }:
with
  { overlay = _: pkgs:
      { inherit (import sources.niv {}) niv;
        packages = pkgs.callPackages ./packages.nix {};
        sources = sources;
      };
  };
import sources.nixpkgs
  { overlays = [ overlay ] ; config = {}; }
