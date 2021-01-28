onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib relu_bd_opt

do {wave.do}

view wave
view structure
view signals

do {relu_bd.udo}

run -all

quit -force
