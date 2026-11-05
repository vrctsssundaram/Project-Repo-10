# Four-source timestamped event collector

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

**Architecture:** Four-source synchronous event timestamp collector with one pending entry per source.

Project owner: Sundaram S S.
