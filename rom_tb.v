module rom_tb;
    reg [0:1] addr;
    reg clk;
    wire [0:3] data;
    
    initial begin
        $dumpfile("rom_tb.vcd");
        $dumpvars(0, rom_tb);
    end

    rom_example uut(
        .addr(addr),
        .data(data),
        .clk(clk)
    );

    always #5 clk = ~clk;

    initial begin
        clk <= 1'b1;
        for (addr = 0; addr <= 2; addr = addr + 1)
            repeat(2) @ (negedge clk);
        $finish;
    end
endmodule