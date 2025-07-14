module tb_SyncRAM;

reg clk, we, re;
reg [3:0] addr, din;
wire [3:0] dout;

SyncRAM uut (.clk(clk), .we(we), .re(re), .addr(addr), .din(din), .dout(dout));

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
end

initial begin
    $display("Time\tWE\tRE\tAddr\tDin\tDout");

    // Write 4 into address 2
    we = 1; re = 0; addr = 4'd2; din = 4'd4; #10;
    $display("%0t\t%b\t%b\t%h\t%h\t%h", $time, we, re, addr, din, dout);

    // Write 7 into address 5
    addr = 4'd5; din = 4'd7; #10;
    $display("%0t\t%b\t%b\t%h\t%h\t%h", $time, we, re, addr, din, dout);

    // Disable write, enable read from address 2
    we = 0; re = 1; addr = 4'd2; #10;
    $display("%0t\t%b\t%b\t%h\t%h\t%h", $time, we, re, addr, din, dout);

    // Read from address 5
    addr = 4'd5; #10;
    $display("%0t\t%b\t%b\t%h\t%h\t%h", $time, we, re, addr, din, dout);

    $finish;
end

endmodule
