import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start LED blink test")

    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    await ClockCycles(dut.clk, 2)
    assert int(dut.uo_out.value) == 0, f"Verwachtte 0 na reset, kreeg {dut.uo_out.value}"

    await ClockCycles(dut.clk, 100)
    assert int(dut.uo_out.value) == 0