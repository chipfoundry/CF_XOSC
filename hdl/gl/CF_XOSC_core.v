// Empty blackbox stub for hierarchical integration LVS.
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
endmodule
