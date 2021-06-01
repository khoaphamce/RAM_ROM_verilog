module ram_tb;
    reg         clk, wr, set_mem;
    reg  [0:3]  data_in;
    reg  [0:2]  addr;
    wire [0:3]  data_out;

    initial begin
        $dumpfile("ram_tb.vcd");
        $dumpvars(0, ram_tb);
    end

    ram_example ram_1(
        .addr(addr),
        .wr(wr),
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out),
        .set_mem(set_mem)
    );

    always #5 clk = ~clk;

    initial begin
        clk <= 1'b1;
        set_mem = 1'b0;
        for (addr = 0; addr <= 3; addr = addr + 1)
        begin
            wr = 1'b0;
            repeat(2) @ (negedge clk);
        end
        set_mem = 1'b1;
        for (addr = 0; addr <= 3; addr = addr + 1)
        begin
            wr = 1'b1;
            data_in = addr;
            repeat(2) @ (negedge clk);
            wr = 1'b0;
            repeat(2) @ (negedge clk);
        end
        
        $finish;
    end
endmodule