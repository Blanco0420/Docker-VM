{
  description = "Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    agenix.url = "github:ryantm/agenix";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, agenix, comin, ... }@inputs:
    let inherit (self) outputs;
    in {
      nixosConfigurations = {
        docker-master-1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/master-1.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
        docker-master-2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/master-2.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
        docker-worker-1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-1.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
        docker-worker-2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-2.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
        docker-worker-3 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-3.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
        docker-worker-4 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nixos/configuration.nix
            ./hosts/worker-4.nix
            comin.nixosModules.comin
            agenix.nixosModules.default
            ({ ... }: {
              services.comin = {
                enable = true;
                remotes = [{
                  name = "origin";
                  url = "https://github.com/Blanco0420/Docker-VM.git";
                  branches.main.name = "main";
                  #                  branches.testing.name = "beta";
                  #                  auth.access_token_path = ${config.age.secrets.comin-auth-token.path};
                }];
              };
            })
          ];
          #        machineId = "22823ba6c96947e78b006c51a56fd89c";
        };
      };
    };
}
