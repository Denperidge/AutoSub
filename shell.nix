{ pkgs ? import <nixpkgs> { } }:

(pkgs.buildFHSEnv {
  name = "autosub";
  targetPkgs = pkgs: (with pkgs; [
    uv
    gcc
    wget
    libz
    bzip2
  ]);

  profile = ''
    export LD_LIBRARY_PATH="${
      pkgs.lib.makeLibraryPath [
        pkgs.bzip2
      ]
    }''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  '';
}).env

