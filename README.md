# EventChrono-4

Four-source event edge timestamp and priority aggregation subsystem.

## Features

- 64-bit free-running clock timestamp
- Per-source pending event state and fixed-priority selection
- Overrun accounting and ready/valid output

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Scope:** Input event edges need CDC synchronization if generated outside the clock domain; no deep event queue.

Project owner: Sundaram S S.
