// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Thu Mar 31 21:10:21 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim
//               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/call_stack/call_stack_sim_netlist.v
// Design      : call_stack
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "call_stack,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module call_stack
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [13:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [13:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [13:0]dina;
  wire [13:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [13:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [13:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.637899 mW" *) 
  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "call_stack.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "14" *) 
  (* C_READ_WIDTH_B = "14" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "14" *) 
  (* C_WRITE_WIDTH_B = "14" *) 
  (* C_XDEVICEFAMILY = "spartan7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  call_stack_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[13:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[13:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20320)
`pragma protect data_block
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
QNs7csfAl10DxK37Ll49PMnV5GehfTEaQMaLLA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
