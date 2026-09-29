#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_xosc_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_XOSC.v" \
  "$ROOT/verify/beh_model/CF_XOSC_core.v" \
  "$ROOT/verify/beh_model/tb_CF_XOSC.v"
vvp "$OUT"
