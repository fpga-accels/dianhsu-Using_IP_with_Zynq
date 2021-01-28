############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode m_axi -depth 64 -offset slave "relu_top" din
set_directive_interface -mode m_axi -depth 64 -offset slave "relu_top" dout
set_directive_interface -mode s_axilite "relu_top"
set_directive_top -name relu_top "relu_top"
set_directive_interface -mode s_axilite "relu_top" positive
set_directive_interface -mode s_axilite "relu_top" negative
