#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${SCRIPT_DIR}/build"
INSTALL_PREFIX="${HOME}/.local"

mkdir -p "${BUILD_DIR}"

cmake -S "${SCRIPT_DIR}" -B "${BUILD_DIR}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}"

cmake --build "${BUILD_DIR}" --parallel "$(nproc)"

cmake --install "${BUILD_DIR}"
