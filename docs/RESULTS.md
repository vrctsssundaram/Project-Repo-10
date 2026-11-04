# Verification record

Date: 05 November 2026
Source revision tested: `df799d2554726b95fe03faf482965cb2d42143df`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-10/actions/runs/41902480647
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-10/actions/runs/41902480506

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | priority, timestamps, output stall and event coalescing |
| Generic Yosys synthesis | **PASS**; 1,128 technology-independent cells |
| Device-specific FPGA/ASIC utilization | **Not measured** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.

The generic cell count is obtained from the cited Yosys `stat` output and is not an FPGA LUT estimate, ASIC area, or a timing result.
