`timescale 1ns / 1ps

// Ideal functional model of analog leaf CF_XOSC_core.
// Drop this file in place of hdl/gl/CF_XOSC_core.v for simulation.
// Do not add it to OpenLane VERILOG_FILES.
//
// Assumed protocol (ideal, not silicon-verified):
//   * pwr_en low clears clk, test, and wd_err_n. xop and vpwr are high-Z.
//   * pwr_en high drives vpwr from vcc, drives xop as the complement of xip,
//     and, when clk_en_hv is high, drives clk from xip.
// This is not a 4–33 MHz crystal oscillator. Startup delay, amplitude
// control, frequency trim, and the watchdog are not modeled.
// vcc, vdd, vpump, vssd, vssq, and vref are supply or reference inputs.

module CF_XOSC_core (
    clk,
    test,
    wd_err_n,
    xop,
    agc_en,
    atrim,
    clk_en_hv,
    ftrim,
    gtrim,
    itrim,
    pwr_en_hv,
    rtrim,
    test_sel,
    vcc,
    vdd,
    vpump,
    vref,
    vref_sel,
    vssd,
    vssq,
    wdtrim,
    xip,
    pwr_en,
    vpwr
);
    output clk;
    output test;
    output wd_err_n;
    output xop;
    input agc_en;
    input [2:0] atrim;
    input clk_en_hv;
    input [1:0] ftrim;
    input [1:0] gtrim;
    input [5:0] itrim;
    input pwr_en_hv;
    input [1:0] rtrim;
    input [3:0] test_sel;
    input vcc;
    input vdd;
    input vpump;
    input vref;
    input vref_sel;
    input vssd;
    input vssq;
    input [1:0] wdtrim;
    input xip;
    input pwr_en;
    output vpwr;

    wire run = (pwr_en === 1'b1);
    assign vpwr = run ? vcc : 1'bz;
    assign xop = run ? ~xip : 1'bz;
    assign clk = (run && (clk_en_hv === 1'b1)) ? xip : 1'b0;
    assign test = 1'b0;
    assign wd_err_n = run ? 1'b1 : 1'b0;
endmodule
