IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_event_timestamp4 -o build/sim rtl/event_timestamp4.sv tb/tb_event_timestamp4.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/event_timestamp4.sv; hierarchy -check -top event_timestamp4; synth -top event_timestamp4; stat'
