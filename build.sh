#!/usr/bin/env sh
set -eu

MANIFEST="$(pwd)/io.neovim.nvim.yaml"
BUILDDIR="$(pwd)/build-dir"

case ${1:-build} in
	install)
		sudo flatpak-builder --force-clean --export-only --install "${BUILDDIR}" "${MANIFEST}"
		printf "\n\ninstall completed\n"
		;;
	*)
		flatpak-builder --force-clean --build-only "${BUILDDIR}" "${MANIFEST}"
		printf "\n\nbuild completed\n"
		printf "\nrun: %s install to install\n" "$0"
		;;
esac
