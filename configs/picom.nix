{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    experimentalBackends = true;
  };
}
