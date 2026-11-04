# Technical design

Each synchronous event input is edge-detected. On a rising edge, its timestamp is stored in a per-source register and a pending bit is set. A fixed-priority selector (ID 0 highest) moves one pending event into an output register whenever the register can advance.

The output remains stable until accepted. Events from a source are coalesced while its pending slot is occupied. Inputs must already be synchronous to the local clock; asynchronous sources require preceding synchronizers.

This revision is a bounded four-entry event aggregator, not an unbounded trace recorder or safety-certified event logger.
