module SyncRAM (
    input clk,
    input we,            // Write enable
    input re,            // Read enable
    input [3:0] addr,    // 4-bit address = 16 locations
    input [3:0] din,     // Data in
    output reg [3:0] dout // Data out
);

    reg [3:0] memory [15:0];  // 16 locations of 4-bit each

    always @(posedge clk) begin
        if (we)
            memory[addr] <= din;
        if (re)
            dout <= memory[addr];
    end

endmodule
