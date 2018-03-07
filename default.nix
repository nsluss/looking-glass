(import ./reflex-platform {}).project ({ pkgs, ... }: {
  packages = {
    lib-looking-glass = ./lib-looking-glass;
    looking-glass-app = ./looking-glass-app;
    looking-glass-app-front-end = ./looking-glass-app-front-end;
  };

  shells = {
    ghc = ["lib-looking-glass" "looking-glass-app" "looking-glass-app-front-end"];
    ghcjs = ["looking-glass-app" "looking-glass-app-front-end" "lib-looking-glass"];
  };
})
