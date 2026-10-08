#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NIRI_QML_LIB="/usr/lib/qt6/qml/Niri"
if [[ -d "$NIRI_QML_LIB" ]]; then
  export LD_LIBRARY_PATH="${NIRI_QML_LIB}${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

exec quickshell -p "$ROOT" "$@"
