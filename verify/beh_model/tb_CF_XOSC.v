`timescale 1ns / 1ps

module tb_CF_XOSC;
    reg vpwr;
    reg pwr_en;
    reg clk_en_hv;
    reg xip;
    wire clk;
    wire xop;
    wire vpwr_sw;
    wire wd_err_n;
    integer errors;

    CF_XOSC dut (
        .vpwr(vpwr),
        .pwr_en(pwr_en),
        .clk_en_hv(clk_en_hv),
        .xip(xip),
        .clk(clk),
        .xop(xop),
        .vpwr_sw(vpwr_sw),
        .wd_err_n(wd_err_n)
    );

    initial begin
        errors = 0;
        vpwr = 1'b1;
        pwr_en = 1'b0;
        clk_en_hv = 1'b1;
        xip = 1'b1;
        #1;
        if (clk !== 1'b0 || wd_err_n !== 1'b0 || xop !== 1'bz || vpwr_sw !== 1'bz) begin
            $display("FAIL disabled clk=%b wd=%b xop=%b sw=%b", clk, wd_err_n, xop, vpwr_sw);
            errors = errors + 1;
        end
        pwr_en = 1'b1;
        #1;
        if (clk !== 1'b1 || xop !== 1'b0 || vpwr_sw !== 1'b1 || wd_err_n !== 1'b1) begin
            $display("FAIL run high clk=%b xop=%b sw=%b wd=%b", clk, xop, vpwr_sw, wd_err_n);
            errors = errors + 1;
        end
        xip = 1'b0;
        #1;
        if (clk !== 1'b0 || xop !== 1'b1) begin
            $display("FAIL run low clk=%b xop=%b", clk, xop);
            errors = errors + 1;
        end
        clk_en_hv = 1'b0;
        xip = 1'b1;
        #1;
        if (clk !== 1'b0 || vpwr_sw !== 1'b1) begin
            $display("FAIL clk gated clk=%b sw=%b", clk, vpwr_sw);
            errors = errors + 1;
        end
        if (errors == 0) $display("PASS");
        else begin
            $display("FAIL %0d", errors);
            $fatal(1);
        end
        $finish;
    end
endmodule
