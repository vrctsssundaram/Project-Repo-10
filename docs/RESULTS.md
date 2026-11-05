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

**Evidence:** Tool-reported Icarus Verilog regression and Yosys synthesis results for the source revision cited above.
