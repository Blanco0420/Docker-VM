{ ... }: {
  imports = [ ../nixos/configuration.nix ];

  networking = {
    interfaces.ens18 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "10.1.2.5";
        prefixLength = 24;
      }];
    };
    defaultGateway = {
      address = "10.1.2.1";
      interface = "ens18";
    };
  };
}
