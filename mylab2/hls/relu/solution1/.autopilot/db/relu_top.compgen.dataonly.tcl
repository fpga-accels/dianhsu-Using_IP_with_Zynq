# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
din { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
dout { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
positive_r_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
positive_r_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
negative_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
negative_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict control $port_control


