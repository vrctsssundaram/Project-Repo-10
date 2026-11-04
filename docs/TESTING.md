# Test procedure

Run `make test` and confirm `PASS`.

The directed test applies simultaneous source-1 and source-3 events, stalls the consumer, validates deterministic ordering and timestamp monotonicity, then accepts a source-0 event.

Further qualification: duplicate-edge coalescing, overrun count, full random event matrix, asynchronous inputs, reset coherency and time-counter wrap.
