// Structural PG wrapper. Analog leaf is CF_XOSC_core.
// Customer rails are vpwr/vgnd; well taps vpb/vnb/vpbe are tied inside.
module CF_XOSC (
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
    vpwr,
    vdd,
    vpump,
    vref,
    vref_sel,
    vgnd,
    vssq,
    wdtrim,
    xip,
    pwr_en,
    vpwr_sw
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
    input vpwr;
    input vdd;
    input vpump;
    input vref;
    input vref_sel;
    input vgnd;
    input vssq;
    input [1:0] wdtrim;
    input xip;
    input pwr_en;
    output vpwr_sw;
    CF_XOSC_core u_core (
        .clk(clk),
        .test(test),
        .wd_err_n(wd_err_n),
        .xop(xop),
        .agc_en(agc_en),
        .atrim(atrim),
        .clk_en_hv(clk_en_hv),
        .ftrim(ftrim),
        .gtrim(gtrim),
        .itrim(itrim),
        .pwr_en_hv(pwr_en_hv),
        .rtrim(rtrim),
        .test_sel(test_sel),
        .vcc(vpwr),
        .vdd(vdd),
        .vpump(vpump),
        .vref(vref),
        .vref_sel(vref_sel),
        .vssd(vgnd),
        .vssq(vssq),
        .wdtrim(wdtrim),
        .xip(xip),
        .pwr_en(pwr_en),
        .vpwr(vpwr_sw)
    );
endmodule
