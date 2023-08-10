`timescale 1ns / 1ps

module neuron(clk, a1, a2, q1, q2, bias, Vp, out);
    input clk;
    input signed [7:0] a1, a2; //input for neuron
    input signed [7:0] q1, q2, bias; // weights
    output reg out = 0; // spike output
    output reg signed [15:0] Vp = 0;
    
    parameter leak = 16'd1;
    parameter signed vth = 16'd30;
    parameter signed reset = 16'd0;
    
    always @ (posedge clk)
        begin
            Vp = Vp + (a1*q1) + (a2*q2) + bias;
            if(Vp>0) Vp = Vp-leak;
            if(Vp>vth)
                begin
                    out = 1; // pulse 내보내기
                    Vp = reset;
                end
            else if(Vp < vth)
                begin
                    out = 0; // step sfunction
                end
        end 
endmodule
