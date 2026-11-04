module event_timestamp4 (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [3:0]  event_in,
    output reg  [1:0]  m_event_id,
    output reg  [63:0] m_timestamp,
    output reg         m_valid,
    input  wire        m_ready,
    output reg  [3:0]  pending_events,
    output reg  [31:0] overrun_events,
    output reg  [63:0] time_counter
);
    timeunit 1ns; timeprecision 1ps;
    reg [3:0] event_previous;
    reg [63:0] captured_time [0:3];
    reg [3:0] pending_next;
    reg [3:0] overrun_mask;
    reg select_valid;
    reg [1:0] select_id;
    wire [3:0] rising_events = event_in & ~event_previous;
    integer p;
    always @* begin
        select_valid = 0;
        select_id = 0;
        for (integer k=0; k<4; k=k+1)
            if (!select_valid && pending_events[k]) begin
                select_valid = 1;
                select_id = k[1:0];
            end
        pending_next = pending_events;
        overrun_mask = 0;
        if ((!m_valid || m_ready) && select_valid)
            pending_next[select_id] = 0;
        for (integer j=0; j<4; j=j+1) begin
            if (rising_events[j]) begin
                if (pending_next[j]) overrun_mask[j] = 1;
                else pending_next[j] = 1;
            end
        end
    end
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            event_previous <= 0;
            pending_events <= 0;
            m_event_id <= 0;
            m_timestamp <= 0;
            m_valid <= 0;
            overrun_events <= 0;
            time_counter <= 0;
            for (i=0; i<4; i=i+1) captured_time[i] <= 0;
        end else begin
            time_counter <= time_counter + 1;
            event_previous <= event_in;
            pending_events <= pending_next;
            overrun_events <= overrun_events + overrun_mask[0] +
                             overrun_mask[1] + overrun_mask[2] + overrun_mask[3];
            if (!m_valid || m_ready) begin
                m_valid <= select_valid;
                if (select_valid) begin
                    m_event_id <= select_id;
                    m_timestamp <= captured_time[select_id];
                end
            end
            for (i=0; i<4; i=i+1) begin
                if (rising_events[i]) begin
                    if (!overrun_mask[i]) captured_time[i] <= time_counter;
                end
            end
        end
    end
endmodule
