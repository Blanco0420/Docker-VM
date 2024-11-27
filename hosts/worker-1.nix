{ ... }: {
  imports = [ ../nixos/configuration.nix ];

  networking.interfaces.eth0 = {
    useDHCP = false;
    ipv4.addresses = [{
      address = "10.1.2.3";
      prefixLength = 24;
    }];
    ipv4.gateway = "10.1.2.1";
  };
}
