module tb_event_timestamp4;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0;
    reg [3:0] event_in=0;
    reg ready=0;
    wire [1:0] id;
    wire [63:0] stamp,time_counter;
    wire valid;
    wire [3:0] pending;
    wire [31:0] overruns;
    integer received=0;
    reg [63:0] previous_stamp=0;
    event_timestamp4 dut(.clk(clk),.rst_n(rst_n),.event_in(event_in),
        .m_event_id(id),.m_timestamp(stamp),.m_valid(valid),.m_ready(ready),
        .pending_events(pending),.overrun_events(overruns),.time_counter(time_counter));
    always @(posedge clk) if (rst_n && valid && ready) begin
        if ((received==0 && id!=1) || (received==1 && id!=3) ||
            (received==2 && id!=0) || (received==3 && id!=1) ||
            (received==4 && id!=2)) $fatal(1,"Event priority/order mismatch");
        if (stamp < previous_stamp) $fatal(1,"Timestamp order regression");
        previous_stamp=stamp;
        received=received+1;
    end
    initial begin
        #22;rst_n=1;
        @(negedge clk);event_in=4'b1010;
        @(negedge clk);event_in=0;
        repeat(3) @(posedge clk);
        if (!valid || id!=1 || !pending[3])
            $fatal(1,"Event queueing/backpressure failed");
        @(negedge clk);ready=1;
        wait(received==2);
        @(negedge clk);event_in=4'b0001;
        @(negedge clk);event_in=0;
        wait(received==3);
        @(negedge clk);ready=0;event_in=4'b0110;
        @(negedge clk);event_in=0;
        repeat(2) @(posedge clk); // Source 1 occupies held output; source 2 stays pending.
        @(negedge clk);event_in=4'b0100; // Repeated source 2 while pending.
        @(negedge clk);event_in=0;
        repeat(2) @(posedge clk);
        if (overruns!=1) $fatal(1,"Expected one coalesced event overrun");
        @(negedge clk);ready=1;
        wait(received==5);
        $display("PASS: priority, timestamps, output stall and event coalescing");
        $finish;
    end
    initial begin #15000;$fatal(1,"Watchdog timeout");end
endmodule
