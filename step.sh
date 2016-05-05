#!/bin/bash

# ---------------------
# --- Exit if command fails

set -e

# ---------------------
# --- Required Input

if [ -z "${info_plist_path}" ]; then
	echo "[ERROR] Required input is missing: please provide correct path to Info.plist file"
	exit 1
fi

# ---------------------
# --- Main

DIRECTORY=$(dirname "${info_plist_path}")
FILENAME=$(basename "${info_plist_path}")

echo "|"
echo "[INFO] Switching working directory to [${DIRECTORY}]"
cd "${DIRECTORY}"

if [ ! -f "${FILENAME}" ]; then
	echo "[ERROR] File is not found at given path: [${info_plist_path}]"
	exit 1
fi

echo "[INFO] Reading data from [${info_plist_path}]..."

version=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" "${FILENAME}")
build=$(/usr/libexec/PlistBuddy -c "Print CFBundleVersion" "${FILENAME}")

envman add --key XPI_VERSION --value "${version}"
echo "[INFO] Version: ${version} -> Saved to \$XPI_VERSION environment variable."

envman add --key XPI_BUILD --value "${build}"
echo "[INFO] Build: ${build} -> Saved to \$XPI_BUILD environment variable."

echo "[INFO] Finished extracting data from [${info_plist_path}]."
