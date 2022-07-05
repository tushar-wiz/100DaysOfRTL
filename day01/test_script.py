import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def first_test(dut):
    dut.sel.value = 0
    dut.a.value = 0
    dut.b.value = 1
    await Timer(1,units="ns")
    assert dut.c.value == dut.a.value
    dut._log.info("My signal is %s", dut.c.value)
    

    dut.sel.value = 1
    await Timer(1, units="ns")

    dut._log.info("My signal is %s", dut.c.value)
    assert dut.c.value == dut.b.value