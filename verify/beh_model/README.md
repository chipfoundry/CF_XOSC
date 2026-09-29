# CF_XOSC behavioral model

`CF_XOSC_core.v` is an ideal functional model for simulation. Compile it
instead of `hdl/gl/CF_XOSC_core.v`. Do not add it to OpenLane `VERILOG_FILES`.

The protocol is assumed and is not silicon-verified. `run_tb.sh` instantiates
the wrap `CF_XOSC`.
