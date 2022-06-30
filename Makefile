DAY_NAME = day$(DAY)
DAY_FILE = $(DAY_NAME)/$(DAY_NAME)
DAY_SYNTH = $(DAY_NAME)/synth.ys

TIME = $$(date +'%Y%m%d-%H%M%S')

TOOLCMD = iverilog -o sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

compile: clean
	cd $(DAY_NAME) && $(TOOLCMD) -s $(DAY_NAME) $(DAY_NAME).v;

sim: clean
	cd $(DAY_NAME) && $(TOOLCMD) -s $(DAY_NAME)_tb $(DAY_NAME).v $(DAY_NAME)_tb.v
	cd $(DAY_NAME) && vvp ./sim.vvp
	cd $(DAY_NAME) && gtkwave $(DAY_NAME).vcd -r ../gtkwaverc &

build:
	touch $(DAY_NAME)/synth.ys
	cd $(DAY_NAME) && echo "read -vlog2k $(DAY_NAME).v" > synth.ys
	cd $(DAY_NAME) && echo "hierarchy -top $(DAY_NAME)" >> synth.ys
	cd $(DAY_NAME) && echo "proc; opt; techmap; opt" >> synth.ys
	cd $(DAY_NAME) && echo "write_verilog synth.v" >> synth.ys
	cd $(DAY_NAME) && echo "show -prefix $(DAY_NAME) -colors $(TIME)" >> synth.ys

synth: build
	cd $(DAY_NAME) && yosys synth.ys

clean:
	rm -rf $(DAY_NAME)/sim.vvp $(DAY_NAME)/synth.ys $(DAY_NAME)/synth.v $(DAY_FILE).dot $(DAY_FILE).dot.pid $(DAY_FILE).vcd
