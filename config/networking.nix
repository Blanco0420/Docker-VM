{ config, pkgs, lib, ... }:

{ ipAddress, hostname }:

{
  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = ipAddress;
        prefixLength = 24;
      }];
    };
    hostname = hostname;
  };
}
