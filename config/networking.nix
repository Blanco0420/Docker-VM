{ config, pkgs, lib, ... }:

{
  options.networkConf = {
    ipAddress = lib.mkOption {
      type = lib.types.string;
    };
    hostname = lib.mkOption {
      type = lib.types.string;
    };
  };
  config = {
  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = config.networkConf.ipAddress;
        prefixLength = 24;
      }];
    };
    hostName = config.networkConf.hostname;
  };
  };
}
