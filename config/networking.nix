{ config, lib, ... }:

{
  options.networkConf = {
    ipAddress = lib.mkOption {
      type = lib.types.str;
    };
    hostname = lib.mkOption {
      type = lib.types.str;
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
