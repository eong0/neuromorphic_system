`timescale 1ns / 1ps

module tb_neuron;

    reg clk;
    reg signed [7:0] a1, a2;
    reg signed [7:0] q1, q2, bias;
    
    wire out;
    wire signed [15:0] Vp;
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    neuron NEURON (clk, a1, a2, q1, q2, bias, Vp, out);
    
    initial 
        begin
            a1 = 8'd0;
            a2 = 8'd0;
            q1 = 8'd0;
            q2 = 8'd0;
            bias = 8'd0;
            
            #400;
            a1 = 8'd1;
            a2 = 8'd1;
            q1 = 8'd3;
            q2 = 8'd2;
            bias = 8'd1;
            
            #400;
            a1 = 8'd1;
            a2 = 8'd1;
            q1 = 8'd3;
            q2 = 8'd9;
            bias = 8'd1;
            
        end
        
endmodule
