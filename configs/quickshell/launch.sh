#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Niri QML plugin ships libNiri.so beside the plugin; add it for the loader.
NIRI_QML_LIB="/usr/lib/qt6/qml/Niri"
if [[ -d "$NIRI_QML_LIB" ]]; then
  export LD_LIBRARY_PATH="${NIRI_QML_LIB}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

# Omarchy bar panels call helper scripts from the Omarchy checkout (network, audio, brightness, …).
if [[ -n "${OMARCHY_PATH:-}" && -d "${OMARCHY_PATH}/bin" ]]; then
  export PATH="${OMARCHY_PATH}/bin:${PATH}"
elif [[ -d "${HOME}/Experiment/omarchy/bin" ]]; then
  export PATH="${HOME}/Experiment/omarchy/bin:${PATH}"
fi

# Always load this checkout — not ~/.config/quickshell (may be an old unrelated config).
exec quickshell -p "$ROOT" "$@"
