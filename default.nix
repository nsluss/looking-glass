(import ./reflex-platform {}).project ({ pkgs, ... }: {
  packages = {
    lib-looking-glass = ./lib-looking-glass;
    looking-glass-app = ./looking-glass-app;
  };

  shells = {
    ghc = ["lib-looking-glass" "looking-glass-app"];
    ghcjs = ["looking-glass-app"];
  };
})