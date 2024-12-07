{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./system/networking.nix
    ./system/mounts.nix
    ./system/users.nix
    ./system/services.nix
    ./disk-config.nix
  ];


  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = lib.mkForce ["btrfs"];
    kernelPackages = pkgs.linuxPackages_latest;
    resumeDevice = "/dev/disk/by-label/nixos";
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    flake = "github:Blanco0420/Docker-VM";
  };

  nixpkgs = {
    overlays = [ ];
    config = { allowUnfree = true; };
  };

  nix =
    let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
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
    qemu
    sshfs
  ];

  age.secrets = {
    docker-ssh-key.file = ../secrets/docker-ssh-key.age;
    glusterca.file = ../secrets/glusterca.age;
  };
  
    system.stateVersion = "23.05";
  }
