module rom_example(
    addr,
    data,
    clk,
);
    input [0:1] addr;
    input clk;
    output wire [0:3] data;
    reg [0:3]data_temp;
    reg [0:3]mem[0:3];

    always @(negedge clk)
    begin
        mem[0] = 4'b0010;
        mem[1] = 4'b0011;
        mem[2] = 4'b0100;
        mem[3] = 4'b0101;
        data_temp = mem[addr];
    end
    assign data = data_temp;

endmodule