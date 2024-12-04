{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    flake = "github:Blanco0420/Docker-VM";
  };

  networking = {
    networkmanager.enable = true;
    defaultGateway = "10.1.2.1";
    nameservers = [ "10.1.2.1" "1.1.1.1" "1.0.0.1" ];
  };

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;

    registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  environment.systemPackages = with pkgs; [
    git
    systemd
    cifs-utils
  ];
  users = {
    users = {
      docker = {
        isNormalUser = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICvuFtf+mfqywoE4+BNNJ6yhI20i99guVc0fkfslShO7 blanco@blancorog"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIEII8saSYun/OtVtCJrPJFjoTaN8XFTMNy9R1giZPcvlAAAAGHNzaDpNeWxlc0JvbHRvbl9NYWluX1NTSA=="
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIAlij2lxj8OoCoDNurBmYuRucZ7eGZ65vy0/goCY9mmDAAAAGnNzaDpNeWxlc0JvbHRvbl9CYWNrdXBfU1NI"
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIN8dNdBOC+PSZRM2JlGgCrm+aBF/cZtuWsJ4jOmqPgkyAAAAHHNzaDpQaGlvblNlY3VyaXR5X0JhY2t1cF9TU0g="
          "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIL4juA+knvCJmmL8BKmtCHxdwQewdNUXY25UK5jyH1l3AAAAGnNzaDpQaGlvblNlY3VyaXR5X01haW5fU1NI"
        ];
        extraGroups = [ "wheel" "docker" ];
      };
    };
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  virtualisation.docker = {
    enable = true;
    daemon.settings.live-restore = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.qemuGuest.enable = true;

  age.secrets = {
    local-smb.file = ../secrets/local-smb.age;
    external-smb.file = ../secrets/external-smb.age;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts =
      [ 22 2376 2377 7946 4789 ]; # Allow SSH and Docker Swarm ports
    allowedUDPPorts = [ 7946 4789 ]; # Allow Docker Swarm UDP ports
  };
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };
  system.stateVersion = "23.05";
}
