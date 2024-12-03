{ pkg, ... }:

{
  system.defaults = {
    controlcenter = { BatteryShowPercentage = false; };

    dock = {
      autohide = false;
      # scale, genie
      mineffect = "scale";
    };
  };
}
