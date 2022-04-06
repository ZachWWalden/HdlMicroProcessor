// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Thu Mar 31 21:10:20 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ call_stack_sim_netlist.v
// Design      : call_stack
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "call_stack,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20368)
`pragma protect data_block
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
uUgD+5WAyPdtivyhRCc3nMyJFQ==
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
