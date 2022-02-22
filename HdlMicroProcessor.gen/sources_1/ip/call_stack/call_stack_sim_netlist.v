// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sun Jan 16 14:21:18 2022
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
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
hjmLWP8QQt3h/tNYZAYl90Alpskm1CgTlgJh6g==
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
