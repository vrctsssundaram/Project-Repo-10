# Technical design

Each synchronous event input is edge-detected. On a rising edge, its timestamp is stored in a per-source register and a pending bit is set. A fixed-priority selector (ID 0 highest) moves one pending event into an output register whenever the register can advance.

The output holds data until accepted; each occupied source slot coalesces repeated events. Event inputs are synchronous to the local clock.

The four per-source pending registers feed a priority-coded, timestamped event output.
