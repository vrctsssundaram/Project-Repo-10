# Verification record

Date: 04 November 2026
Source revision tested: `1491490d2bb592f0edcfc28e5cf9346f7b9d1a64`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-10/actions/runs/41871618384

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | priority, timestamps, output stall and event coalescing |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
