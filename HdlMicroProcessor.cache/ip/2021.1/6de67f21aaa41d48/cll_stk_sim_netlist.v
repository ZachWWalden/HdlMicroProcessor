// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sat Apr  2 19:11:52 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cll_stk_sim_netlist.v
// Design      : cll_stk
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cll_stk,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    d,
    clk,
    we,
    spo);
  input [7:0]a;
  input [13:0]d;
  input clk;
  input we;
  output [13:0]spo;

  wire [7:0]a;
  wire clk;
  wire [13:0]d;
  wire [13:0]spo;
  wire we;
  wire [13:0]NLW_U0_dpo_UNCONNECTED;
  wire [13:0]NLW_U0_qdpo_UNCONNECTED;
  wire [13:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "spartan7" *) 
  (* C_HAS_CLK = "1" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_i_ce = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_parser_type = "1" *) 
  (* c_pipeline_stages = "0" *) 
  (* c_qualify_we = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "14" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(clk),
        .d(d),
        .dpo(NLW_U0_dpo_UNCONNECTED[13:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[13:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[13:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(we));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JqLVJNxQZkLohSEqQ9ITFybNm9QPcaTh8kyc7h4uGNwD1GaEe9dZHqj61sUilGTlF+FUk7afNjXe
+9yQ4e75SyWC3Z6F0o0CdI6t84E2VRqNvne6PMLMbSrRPmTgt8cbodbZa3saUKncQltVwK/zTxXc
dXyeIJwoVnylCRZ8MPU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RMR60V/K16S3hDpcgdlFzH6vzNttFBxzcEIP9k8l6xLxOXzEGeRk2beZg3IkkpX9ywpiLolj/ijd
pAlaBccK0sBT48q6qTKLouly7vRT3U8EOwOAJBZoDUnL/NwrlIomkg8Pj/4x8iecc9IFkdcLg53k
dreGnJ/4ti8Qi6sHP5Vsy0qpJoYpWsOBc2cmgH9vayWn6WlV7QL8YjnFQ6bQnWuyarN2QQK+bLzc
JrPAdTBzH05U9MiHwKRG1GlZxJA5fxQttnLA39Nwggz6r5qeYai4Vo+J8h0NQDa/GYHeYKSYsF9p
VKrYe14mz3CSYvF3+NMCtnCz+VeW7lF95iKCXA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k6iMAgjYok8KaQLMY/TME6/aSCYTKFMZWtHwbD2VKIKOoM9woUSioI0NuiYfkPizuiBJEl8Af3NJ
M5VmpW3SVM0lwPjVSCSNmHMIfc2krrmg962M4XaG4w+tnp7hwZbdNZ8ahj6pOLDYSTGKwdGQanuk
rIQbC+15rT9WEK2XGDQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lHyAdhaPyzMCy12MalQZTt5ud3be/nityQmJ518pNrYUzgCs2nz/J1pZZgf+RWFgX9JUwWOgttjl
3vfihnzL/+pRWaWe8tlTToa5xX6V/jpw3hAcktXx9YKYreiOr2qpeTLkbp0k6MDPx0OZ6zF6OnXU
mj71WlXFOMXCx/95ZDxCuphivrOiA+pFZwGv2NIFmX/Oh4q8NTSFzJYzF3L9rWrI08UUEu9QuuxY
Iqlhuw+fXq//x9+jC7JNcedTSCXVkefBvZdJcbH0kbNA5ChG445apiF/OiKhKxTUjVKp7Rkm62fE
cFEo6KH1Cp+QaVxNQ55dcOTpVSSDpQGvshrQzw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D53lVPGhmka10zY9LQFvI7i1UPoiOm2NaQ+1PpDUs4OCbAMqPLHQSHIZ3EMPWpwgdfAtW9t+9lxl
o33XZq60DBUJ4ZKPRvcfbZCHmpPyjm3Rs8+ACxnIH7G37stehOSCzSXeqM9ORqajk0MjoE3bDLx9
FtW+eEPY1KauFU6KHAWAdaZPPnc5QfgBkK0c27Y7CfkJ049Sjv4lFwtiVOmSkCvdDDisv3/WAcSs
c5Zo+cJIWzw/prfWYTGIB0goZNZRXZpB/aULwQ5itLufopA2f9cHo50fqlIvQX4YoYlfQTXpj3Lj
Qd+7/1UmFCqQLsnOUXy9D/tgspVDu7POGbmsiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bN8g8/EQJ5JNLmcuNioMXeo6xxPhQlbGMqXyUcnPTkqRMGYI+G4Ejpt9cT2XLx48MsTE+bzhGByG
1H1pqr4NO588pcozvxJ5bo7FJRCIhLP1e3pwipkX+z6IlClWyStmkrlQmh4o/jTM/s88Fv0m7FSH
jNd3hhAeYNPIdw9Btn4UcBuZre9QZnCZ+Qb3nW7FuuEd1RxTmP0y9EFC185+bRy+SMigW3FTt75l
qdmakEvm3BkGv3IiztGz6MLRqvBdHQYtaZ17Jeh1xGZ//F4QzRytN/lcdqSrZA6MOo1ObtGE9SFJ
SDo82E2CZlkQZfPVe6EC4/a7V7wIwES5EDHHnw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ewjro/5A8FySdAgSJfHQFGxdnPvtSB6vt25wsSfZkZlB9FCU7IhXRDEGCyqtZv1GE8Vi5CjQkNFt
lkkrCSRYIU5yoD/IUiSUo3oerXD+F7eyfUTsdMH8pyAOmszG4J/U4h2F0oGz4IGjnQhlKadatt3U
Pet1uDdo6p7Uz7fluWoE453v5O5Ag7QL3l2r7pK9QbtKW2b2ZgHI0FP1PfpuAESmBITtaB68uLNI
9IqIpc/l+MM956Gz3Ei4nFXbBqRkNnOoEIr1KKujTAkLJl3zAW45fRxt/SNdspyyOfwqw8HQ4aKl
7gQZLNfO7M9S9RaTP7tfDlNXrjIs40/SiH7VMA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
BU7byHg11K8bY2oU9sv2hTEzfbBQxIL/wbPRcw3zRiIVklygkCLwToVotzcIxQi5+AgzzF89UJr5
6GTSf74dEO/L+7MiiVhop835AvOvvIFH3e15os3Ed8MZ/CykLdSs8kOVPSgygUECxKL/9FDmPOPu
fo2rClbqDh81jw/cX48EVuss3UxP/PNd7DI06TMx7v4Cwbv+pkvbuSJ9JUQBcJB2a2vbXuFSdPnT
ejL1XTVXeTbl2M6D7N0iqk4rwD1DAC1ao/d+axn50hvVPzigrvjqcQX/U1IENh7yF/bcNB1NT4d2
IdXJlmV2SEYwQNjb9ZTuSLUlehhVKrT3vH5zFJC80glrrjZK2l4tx9ZECJLmYjz00oxWf1dNVI0i
SuSyr3w6cWekzZQOv6vsFN+CRqWOkos5IUF5EaLFMFmcV5BtlgtZ9rm6OCo3zn726oQF5zZNaTBv
qrb5vLe4ELSA4fL4YBwiVDxVDpGpLzJNu+m6WS/V5oWJs1UQV1sRHSGu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dAIafnl1hEJ76Z8bYZlZKSAU+OyCQ2PwlK+IUKj9QNvxJJYU8c0z5dZmxP4ePLBS+vp0Lekmf+JK
ZmwpMP0AH+BW93Y8Y+QNBeNdszz6mwXF1zf7ZAzf+51PzoZEli3SBCs9JMOdSCtnTg1W+j4FkEYs
NWN3ZK6tfrYSbplsV4lsmoYu2c81xW2Ns3lV8YRQCE8VSADdb1pe8pEztQYXzBmAfCVgwFNJ1kXV
pEtDN1MRi07FvYZeUJ/cX+ebYB0p5w0vxVO4vSr0XOHKMcQkxb/64oEoe4AhHQNWURWYKDxNNzm+
jElAKl1fJL20OmItj+GmJlETFK09uAgqwtZ5HQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13936)
`pragma protect data_block
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
nLEq2daA42d3DH7bx/vUAqd9VYkW/0P1+PHwhA==
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
