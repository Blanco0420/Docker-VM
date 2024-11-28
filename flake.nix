{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, comin, ... }@inputs:
    let inherit (self) outputs;
    in {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        docker-master1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            ./hosts/master-1.nix
            comin.nixosModules.comin
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                }];
              };
            })
          ];
        };
        docker-worker1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-1.nix
            comin.nixosModules.comin
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                }];
              };
            })
          ];
        };
        docker-worker2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-2.nix
            comin.nixosModules.comin
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                }];
              };
            })
          ];
        };
        docker-worker3 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-3.nix
            comin.nixosModules.comin
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                }];
              };
            })
          ];
        };

      };
    };
}
