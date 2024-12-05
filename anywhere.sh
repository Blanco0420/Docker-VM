#!/bin/bash

for i in {1..2}; do
  nix run --extra-experimental-features 'nix-command flakes' github:nix-community/nixos-anywhere -- --flake .#docker-master-$i nixos@10.1.2.1$i
done

for i in {1..4}; do
  nix run --extra-experimental-features 'nix-command flakes' github:nix-community/nixos-anywhere -- --flake .#docker-worker-$i nixos@10.1.2.10$i
done
