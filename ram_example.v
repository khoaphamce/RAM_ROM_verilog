module ram_example(
    addr,
    wr,
    clk,
    data_in,
    data_out,
    set_mem);

    input       clk, wr, set_mem;
    input[0:3]  data_in;
    input[0:2]  addr;
    input[0:3]  data_out;
    reg  [0:3]  data_out_temp;
    reg  [0:3]  mem [0:3];

    always @(negedge clk)
    begin
        if (set_mem == 1'b0)
        begin
            mem[0] = 4'b0010;
            mem[1] = 4'b0011;
            mem[2] = 4'b0100;
            mem[3] = 4'b0101;
        end

        if (wr == 1'b1)
        begin
            mem[addr] <= data_in;
        end
        else if (wr == 1'b0)
        begin
            data_out_temp = mem[addr];
        end
    end
    assign data_out = data_out_temp;
endmodule