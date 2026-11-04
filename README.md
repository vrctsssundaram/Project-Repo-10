# EventChrono-4

Four-source event-capture engine with a free-running 64-bit timestamp counter, rising-edge event capture, deterministic fixed-priority output and valid/ready backpressure.

Captured events are retained per source until selected for transmission. The output reports the source ID and the original capture timestamp.

Run `make test` for simultaneous-event priority, timestamp ordering and output-stall regression.

Project owner: Sundaram S S.
