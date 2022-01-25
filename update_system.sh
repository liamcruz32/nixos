#!/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

pushd $SCRIPTPATH
sudo nix flake update
popd
