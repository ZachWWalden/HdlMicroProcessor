// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Thu Mar 31 21:10:20 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top call_stack -prefix
//               call_stack_ call_stack_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20032)
`pragma protect data_block
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
7wHfWpB/n3OizFpDXP1oGJKDf+uTsWNeoA==
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
