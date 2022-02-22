// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sun Jan 16 14:21:17 2022
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
kUe19OubyKbZKl7wpacuOnxEfA==
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
