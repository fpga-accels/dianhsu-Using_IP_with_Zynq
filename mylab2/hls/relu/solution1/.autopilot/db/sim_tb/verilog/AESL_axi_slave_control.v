// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_control (
    clk,
    reset,
    TRAN_s_axi_control_AWADDR,
    TRAN_s_axi_control_AWVALID,
    TRAN_s_axi_control_AWREADY,
    TRAN_s_axi_control_WVALID,
    TRAN_s_axi_control_WREADY,
    TRAN_s_axi_control_WDATA,
    TRAN_s_axi_control_WSTRB,
    TRAN_s_axi_control_ARADDR,
    TRAN_s_axi_control_ARVALID,
    TRAN_s_axi_control_ARREADY,
    TRAN_s_axi_control_RVALID,
    TRAN_s_axi_control_RREADY,
    TRAN_s_axi_control_RDATA,
    TRAN_s_axi_control_RRESP,
    TRAN_s_axi_control_BVALID,
    TRAN_s_axi_control_BREADY,
    TRAN_s_axi_control_BRESP,
    TRAN_control_write_data_finish,
    TRAN_control_read_data_finish,
    TRAN_control_start_in,
    TRAN_control_idle_out,
    TRAN_control_ready_out,
    TRAN_control_ready_in,
    TRAN_control_done_out,
    TRAN_control_write_start_in   ,
    TRAN_control_write_start_finish,
    TRAN_control_interrupt,
    TRAN_control_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_din "./c.relu_top.autotvin_din.dat"
`define TV_IN_dout "./c.relu_top.autotvin_dout.dat"
`define TV_IN_positive_r "./c.relu_top.autotvin_positive_r.dat"
`define TV_OUT_positive_r "./rtl.relu_top.autotvout_positive_r.dat"
`define TV_IN_negative "./c.relu_top.autotvin_negative.dat"
`define TV_OUT_negative "./rtl.relu_top.autotvout_negative.dat"
parameter ADDR_WIDTH = 7;
parameter DATA_WIDTH = 32;
parameter din_DEPTH = 1;
reg [31 : 0] din_OPERATE_DEPTH = 0;
parameter din_c_bitwidth = 64;
parameter dout_DEPTH = 1;
reg [31 : 0] dout_OPERATE_DEPTH = 0;
parameter dout_c_bitwidth = 64;
parameter positive_r_DEPTH = 1;
reg [31 : 0] positive_r_OPERATE_DEPTH = 0;
parameter positive_r_c_bitwidth = 32;
parameter negative_DEPTH = 1;
reg [31 : 0] negative_OPERATE_DEPTH = 0;
parameter negative_c_bitwidth = 32;
parameter START_ADDR = 0;
parameter relu_top_continue_addr = 0;
parameter relu_top_auto_start_addr = 0;
parameter din_data_in_addr = 16;
parameter dout_data_in_addr = 28;
parameter positive_r_data_in_addr = 40;
parameter negative_data_in_addr = 56;
parameter positive_r_data_out_addr = 48;
parameter positive_r_valid_out_addr = 52;
parameter negative_data_out_addr = 64;
parameter negative_valid_out_addr = 68;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_AWADDR;
output  TRAN_s_axi_control_AWVALID;
input  TRAN_s_axi_control_AWREADY;
output  TRAN_s_axi_control_WVALID;
input  TRAN_s_axi_control_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_control_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_ARADDR;
output  TRAN_s_axi_control_ARVALID;
input  TRAN_s_axi_control_ARREADY;
input  TRAN_s_axi_control_RVALID;
output  TRAN_s_axi_control_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_RDATA;
input [2 - 1 : 0] TRAN_s_axi_control_RRESP;
input  TRAN_s_axi_control_BVALID;
output  TRAN_s_axi_control_BREADY;
input [2 - 1 : 0] TRAN_s_axi_control_BRESP;
output TRAN_control_write_data_finish;
output TRAN_control_read_data_finish;
input     clk;
input     reset;
input     TRAN_control_start_in;
output    TRAN_control_done_out;
output    TRAN_control_ready_out;
input     TRAN_control_ready_in;
output    TRAN_control_idle_out;
input  TRAN_control_write_start_in   ;
output TRAN_control_write_start_finish;
input     TRAN_control_interrupt;
input     TRAN_control_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [din_c_bitwidth - 1 : 0] mem_din [din_DEPTH - 1 : 0];
reg din_write_data_finish;
reg [dout_c_bitwidth - 1 : 0] mem_dout [dout_DEPTH - 1 : 0];
reg dout_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_positive_r [positive_r_DEPTH - 1 : 0];
reg positive_r_write_data_finish;
reg positive_r_read_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_negative [negative_DEPTH - 1 : 0];
reg negative_write_data_finish;
reg negative_read_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
reg process_5_finish = 0;
reg process_6_finish = 0;
reg process_7_finish = 0;
//write din reg
reg [31 : 0] write_din_count = 0;
reg write_din_run_flag = 0;
reg write_one_din_data_done = 0;
//write dout reg
reg [31 : 0] write_dout_count = 0;
reg write_dout_run_flag = 0;
reg write_one_dout_data_done = 0;
//write positive_r reg
reg [31 : 0] write_positive_r_count = 0;
reg write_positive_r_run_flag = 0;
reg write_one_positive_r_data_done = 0;
//write negative reg
reg [31 : 0] write_negative_count = 0;
reg write_negative_run_flag = 0;
reg write_one_negative_data_done = 0;
//read positive_r reg
reg [31 : 0] read_positive_r_count = 0;
reg read_positive_r_run_flag = 0;
reg read_one_positive_r_data_done = 0;
//read negative reg
reg [31 : 0] read_negative_count = 0;
reg read_negative_run_flag = 0;
reg read_one_negative_data_done = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_control_AWADDR = AWADDR_reg;
assign TRAN_s_axi_control_AWVALID = AWVALID_reg;
assign TRAN_s_axi_control_WVALID = WVALID_reg;
assign TRAN_s_axi_control_WDATA = WDATA_reg;
assign TRAN_s_axi_control_WSTRB = WSTRB_reg;
assign TRAN_s_axi_control_ARADDR = ARADDR_reg;
assign TRAN_s_axi_control_ARVALID = ARVALID_reg;
assign TRAN_s_axi_control_RREADY = RREADY_reg;
assign TRAN_s_axi_control_BREADY = BREADY_reg;
assign TRAN_control_write_start_finish = AESL_write_start_finish;
assign TRAN_control_done_out = AESL_done_index_reg;
assign TRAN_control_ready_out = AESL_ready_out_index_reg;
assign TRAN_control_idle_out = AESL_idle_index_reg;
assign TRAN_control_read_data_finish = 1 & positive_r_read_data_finish & negative_read_data_finish;
assign TRAN_control_write_data_finish = 1 & din_write_data_finish & dout_write_data_finish & positive_r_write_data_finish & negative_write_data_finish;
always @(TRAN_control_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish or process_5_finish or process_6_finish or process_7_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 5 && process_5_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 6 && process_6_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 7 && process_7_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 32; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth <= 1024 & bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_control_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_control_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_control_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_control_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_control_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_control_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_control_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_control_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        din_write_data_finish <= 0;
        write_din_run_flag <= 0; 
        write_din_count = 0;
        count_operate_depth_by_bitwidth_and_depth (din_c_bitwidth, din_DEPTH, din_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            din_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_din_run_flag <= 1; 
            write_din_count = 0;
        end
        if (write_one_din_data_done === 1) begin
            write_din_count = write_din_count + 1;
            if (write_din_count == din_OPERATE_DEPTH) begin
                write_din_run_flag <= 0; 
                din_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_din
    integer write_din_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] din_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = din_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_1_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_din_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write din data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (din_c_bitwidth < 32) begin
                        din_data_tmp_reg = mem_din[write_din_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < din_c_bitwidth) begin
                                din_data_tmp_reg[j] = mem_din[write_din_count][i*32 + j];
                            end
                            else begin
                                din_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (din_data_in_addr + write_din_count * four_byte_num * 4 + i * 4, din_data_tmp_reg, write_din_resp);
                end
                process_busy = 0;
                write_one_din_data_done <= 1;
                @(posedge clk);
                write_one_din_data_done <= 0;
            end   
            process_1_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        dout_write_data_finish <= 0;
        write_dout_run_flag <= 0; 
        write_dout_count = 0;
        count_operate_depth_by_bitwidth_and_depth (dout_c_bitwidth, dout_DEPTH, dout_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            dout_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_dout_run_flag <= 1; 
            write_dout_count = 0;
        end
        if (write_one_dout_data_done === 1) begin
            write_dout_count = write_dout_count + 1;
            if (write_dout_count == dout_OPERATE_DEPTH) begin
                write_dout_run_flag <= 0; 
                dout_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_dout
    integer write_dout_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] dout_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = dout_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_2_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_dout_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write dout data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (dout_c_bitwidth < 32) begin
                        dout_data_tmp_reg = mem_dout[write_dout_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < dout_c_bitwidth) begin
                                dout_data_tmp_reg[j] = mem_dout[write_dout_count][i*32 + j];
                            end
                            else begin
                                dout_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (dout_data_in_addr + write_dout_count * four_byte_num * 4 + i * 4, dout_data_tmp_reg, write_dout_resp);
                end
                process_busy = 0;
                write_one_dout_data_done <= 1;
                @(posedge clk);
                write_one_dout_data_done <= 0;
            end   
            process_2_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        positive_r_write_data_finish <= 0;
        write_positive_r_run_flag <= 0; 
        write_positive_r_count = 0;
        count_operate_depth_by_bitwidth_and_depth (positive_r_c_bitwidth, positive_r_DEPTH, positive_r_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            positive_r_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_positive_r_run_flag <= 1; 
            write_positive_r_count = 0;
        end
        if (write_one_positive_r_data_done === 1) begin
            write_positive_r_count = write_positive_r_count + 1;
            if (write_positive_r_count == positive_r_OPERATE_DEPTH) begin
                write_positive_r_run_flag <= 0; 
                positive_r_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_positive_r
    integer write_positive_r_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] positive_r_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = positive_r_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_3_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_positive_r_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write positive_r data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (positive_r_c_bitwidth < 32) begin
                        positive_r_data_tmp_reg = mem_positive_r[write_positive_r_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < positive_r_c_bitwidth) begin
                                positive_r_data_tmp_reg[j] = mem_positive_r[write_positive_r_count][i*32 + j];
                            end
                            else begin
                                positive_r_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (positive_r_data_in_addr + write_positive_r_count * four_byte_num * 4 + i * 4, positive_r_data_tmp_reg, write_positive_r_resp);
                end
                process_busy = 0;
                write_one_positive_r_data_done <= 1;
                @(posedge clk);
                write_one_positive_r_data_done <= 0;
            end   
            process_3_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        negative_write_data_finish <= 0;
        write_negative_run_flag <= 0; 
        write_negative_count = 0;
        count_operate_depth_by_bitwidth_and_depth (negative_c_bitwidth, negative_DEPTH, negative_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            negative_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_negative_run_flag <= 1; 
            write_negative_count = 0;
        end
        if (write_one_negative_data_done === 1) begin
            write_negative_count = write_negative_count + 1;
            if (write_negative_count == negative_OPERATE_DEPTH) begin
                write_negative_run_flag <= 0; 
                negative_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_negative
    integer write_negative_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] negative_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = negative_c_bitwidth;
    process_num = 4;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_4_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_negative_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write negative data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (negative_c_bitwidth < 32) begin
                        negative_data_tmp_reg = mem_negative[write_negative_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < negative_c_bitwidth) begin
                                negative_data_tmp_reg[j] = mem_negative[write_negative_count][i*32 + j];
                            end
                            else begin
                                negative_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (negative_data_in_addr + write_negative_count * four_byte_num * 4 + i * 4, negative_data_tmp_reg, write_negative_resp);
                end
                process_busy = 0;
                write_one_negative_data_done <= 1;
                @(posedge clk);
                write_one_negative_data_done <= 0;
            end   
            process_4_finish <= 1;
        end
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_control_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 5;
    while (1) begin
        process_5_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_5_finish <= 1;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        positive_r_read_data_finish <= 0;
        read_positive_r_run_flag <= 0; 
        read_positive_r_count = 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            read_positive_r_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            positive_r_read_data_finish <= 0;
            read_positive_r_count = 0; 
        end
        if (read_one_positive_r_data_done === 1) begin
            read_positive_r_count = read_positive_r_count + 1;
            if (read_positive_r_count == positive_r_OPERATE_DEPTH) begin
                read_positive_r_run_flag <= 0; 
                positive_r_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_positive_r
    integer read_positive_r_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = positive_r_c_bitwidth;
    process_num = 6;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_6_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_positive_r_run_flag === 1) begin
                process_busy = 1;
                get_vld = 0;
                //read positive_r vld
                read (positive_r_valid_out_addr, RDATA_reg, read_positive_r_resp);
                if (RDATA_reg[0 : 0] == 1) begin
                    get_vld = 1;
                end
                if (get_vld == 1) begin
                    //read positive_r data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (positive_r_data_out_addr + read_positive_r_count * four_byte_num * 4 + i * 4, RDATA_reg, read_positive_r_resp);
                        if (positive_r_c_bitwidth < 32) begin
                            mem_positive_r[read_positive_r_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < positive_r_c_bitwidth) begin
                                    mem_positive_r[read_positive_r_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_positive_r_data_done <= 1;
                    @(posedge clk);
                    read_one_positive_r_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_6_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        negative_read_data_finish <= 0;
        read_negative_run_flag <= 0; 
        read_negative_count = 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            read_negative_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            negative_read_data_finish <= 0;
            read_negative_count = 0; 
        end
        if (read_one_negative_data_done === 1) begin
            read_negative_count = read_negative_count + 1;
            if (read_negative_count == negative_OPERATE_DEPTH) begin
                read_negative_run_flag <= 0; 
                negative_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_negative
    integer read_negative_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = negative_c_bitwidth;
    process_num = 7;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_7_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_negative_run_flag === 1) begin
                process_busy = 1;
                get_vld = 0;
                //read negative vld
                read (negative_valid_out_addr, RDATA_reg, read_negative_resp);
                if (RDATA_reg[0 : 0] == 1) begin
                    get_vld = 1;
                end
                if (get_vld == 1) begin
                    //read negative data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (negative_data_out_addr + read_negative_count * four_byte_num * 4 + i * 4, RDATA_reg, read_negative_resp);
                        if (negative_c_bitwidth < 32) begin
                            mem_negative[read_negative_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < negative_c_bitwidth) begin
                                    mem_negative[read_negative_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_negative_data_done <= 1;
                    @(posedge clk);
                    read_one_negative_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_7_finish <= 1;
        end
        @(posedge clk);
    end    
end
//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [151 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_din_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [din_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (din_c_bitwidth , factor);
  fp = $fopen(`TV_IN_din ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_din); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < din_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_din [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_din [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_din [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_din [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_din [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_dout_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [dout_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (dout_c_bitwidth , factor);
  fp = $fopen(`TV_IN_dout ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_dout); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < dout_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_dout [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_dout [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_dout [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_dout [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_dout [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_positive_r_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [positive_r_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (positive_r_c_bitwidth , factor);
  fp = $fopen(`TV_IN_positive_r ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_positive_r); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < positive_r_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_positive_r [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_positive_r [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_positive_r [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_positive_r [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_positive_r [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_positive_r_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [positive_r_c_bitwidth - 1 : 0] mem_tmp; 
  reg [ 100*8 : 1] str;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (positive_r_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (positive_r_read_data_finish !== 1 || TRAN_control_transaction_done_in === 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_positive_r, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_positive_r); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (positive_r_DEPTH - positive_r_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_positive_r[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_positive_r[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  mem_tmp = mem_positive_r[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  mem_tmp = mem_positive_r[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_positive_r[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_positive_r[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_positive_r[i]);
          end
      end 
      if (factor == 4) begin
          if ((positive_r_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][23:16]);
          end
          if ((positive_r_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][15:8]);
          end
          if ((positive_r_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((positive_r_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_positive_r[positive_r_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
      while (TRAN_control_start_in !== 1) begin
          @(posedge clk);
      end
  end 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_negative_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [negative_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (negative_c_bitwidth , factor);
  fp = $fopen(`TV_IN_negative ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_negative); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < negative_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_negative [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_negative [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_negative [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_negative [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_negative [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_negative_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [negative_c_bitwidth - 1 : 0] mem_tmp; 
  reg [ 100*8 : 1] str;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (negative_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (negative_read_data_finish !== 1 || TRAN_control_transaction_done_in === 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_negative, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_negative); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (negative_DEPTH - negative_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_negative[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_negative[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  mem_tmp = mem_negative[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  mem_tmp = mem_negative[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_negative[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_negative[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_negative[i]);
          end
      end 
      if (factor == 4) begin
          if ((negative_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][23:16]);
          end
          if ((negative_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][15:8]);
          end
          if ((negative_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((negative_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_negative[negative_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
      while (TRAN_control_start_in !== 1) begin
          @(posedge clk);
      end
  end 
end 
 
endmodule
