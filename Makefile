IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_event_timestamp4 -o build/sim rtl/event_timestamp4.sv tb/tb_event_timestamp4.sv
	$(VVP) build/sim
