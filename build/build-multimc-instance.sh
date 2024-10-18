#!/usr/bin/env bash
set -euxo pipefail

BUILD_DIR=$(mktemp -dt "minecraft-modpack-build-XXXX")
BUILD_DIR_MC="${BUILD_DIR}/minecraft"

echo "Creating modpack instance at ${BUILD_DIR}"

echo "Copying vendored datapacks to ${BUILD_DIR_MC}"
mkdir "${BUILD_DIR_MC}"
cp -r ./vendor/datapacks "${BUILD_DIR_MC}"

echo "Copying vendored server list to ${BUILD_DIR_MC}"
cp ./vendor/servers.dat "${BUILD_DIR_MC}"

echo "Copying MultiMC pack configuration to ${BUILD_DIR}"
cp ./vendor/multimc/* "${BUILD_DIR}"

PACKWIZ_PATH="${BUILD_DIR_MC}/packwiz-installer-bootstrap.jar"
echo "Obtaining the latest packwiz installer bootstrap jar and placing it at ${PACKWIZ_PATH}"
curl -LfSs https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar -o "${PACKWIZ_PATH}"

echo "Creating a Prism Launcher / MultiMC / PolyMC compatible instance zip"
OUTPUT_DIR=${PWD}
pushd "${BUILD_DIR}"
zip -r "${OUTPUT_DIR}/Marka Modpack 1.20.1.zip" .
popd