// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Sat Apr  2 19:11:53 2022
// Host        : uberbertha running 64-bit Arch Linux
// Command     : write_verilog -force -mode funcsim
//               /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/cll_stk/cll_stk_sim_netlist.v
// Design      : cll_stk
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s50csga324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cll_stk,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module cll_stk
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
  cll_stk_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13888)
`pragma protect data_block
vrH0jYED4OtreXMItQfm9RNzrXFbf8x0nRa7+k5WrfSPauk+G4sSsxWasHrJDZpIyZwxnTG/NnCy
VKg3wej+LQeVg+V1cPY40zLJ9ur1fUg6MQ7QVDjZhUPU2UXfCJTDavQFN/nZtb79WT5W8schCH4u
A5731NBC9i0Jiq5oVUTt50sBtiy3sBu2MefYEV7XHP1Ic/VdO+qDaRHROvJ2B2z3s4czkokSRGmZ
DbPnXFcYK1DfXWDcNSPQTKskpyF5vwOxysDcXXkgtyxUUvXiTWkZc+cEC2ldxZT+Z2ehblho4cBK
7AH8TdsV9/EGOkR2F8DbgKKmm+JROxS3EQ/C9nlPhG0vq9bCs6lY18oSQs2IQHaDtXcRKVy0gPHT
hnR0/IdJbBpUWiwuwhVh8P7qEo+C46zbbieSjx511sWcCcKDDqhwTEcsbVvQw14RTTyXGOHJamss
APF1g5SQmpg3ZWepQ/9dazb1tajTf/fC7ywlhX0jKKvRfMPge9EWmXC1r6BxHuOwLj7o+jjKgEyY
HoheWvGjldUk/SmBTLAJBBJ+ZKpwb9BDWoWdMAmn5lRDS3QEeg5qASo8ZBvLtOfyD2wIGqYT/qsG
38k0cCczIJbmOwHhZz25op7r6Wtg8IT35LRgWtxuO5NhpHMX/4Jwa/ktYlMKSvZvtcGlTnCjuWTp
g+rq+/AI4/tTtcZoug+k+8MjxOeAXAEHwb30piR/osiM5QwQxbuqmq8IpC4dqKWZU2qLa37oArHD
bgYNFK7tPEbg9VL7VkotU01rxMXL4nsTLL1EY4vrA5XOURkegLIWxsdzLw1wzmgPVrwetusCRRwy
udgGMIRLXeCbnQoO+M7yKEk8+lj8U5j5bXb4Zen0EoXiu0lwoxfR74hcrwIh21dzQPGxaBPc2GDq
PUZX+TY+gYwILgGT4nTGal0r6yXu5OQwpTJcsq7xbbnOCWcYJ9AtRYYCDCWHwUfHCux3x/YFJBe+
CDqDgmN0MVcvKD1ad/Eg+GvtGBSi/uoFxwzFZunUoXwopCjfz2QkQw32IO8mPa9QrpQGo3CO1hSz
6bLn3TwCqISS0voG4TPF9UxcrUZnOkZ32vpw2jyjOuATNNUNd+wa2QTVbYeqsb97wkymBQq2v3I6
8NRcQAyYwduGjTOwJGd/BHxzi7p2kmoDOjCmw/C5k+ekxryWBY7urKqNIeyUAalUvT3oCT2T8bMp
9CYVFeWAg12+6mFexpbH6ZZpR3hjmc2l3IYyCUtIqpaKNMcnNjTrexLgWoSx+yPJdXGPrhe+GmFj
n5UAoAgn3j2Fwm90AwvL8jV7TrsvjTq1onZXgpnRH8RW4SV8nf1l3zk8C6h5+tbfQwsLdMuklU1j
iNLGu7BoqbGxrv/9KQBw9KfINaS6cy+6xhaXOLmKKCGTNGWpDMotYpAdHKS+77hWcx/hGu+2Zzwf
Ekt+0EzEch71VzHEu1lWdCKH7DKXTw9CUtgBA09yFqUSi4MxxOycdiqJVnO8FU4yVTkPjnNieJtE
Bg9ZynKZZI2LheqsDpwTihSPxcGW1/SI++21+3Mcbht7ATmvOw1yoF6tIFfNSxGZp2+qZpjRYqOI
AXqGK0TJ8fE7MIG7+VZiA8TUSApj46Dyfplsy2vqxD5zJZxx/tM23BaAFjUtspmcWEqlK4yl0GdF
lbdMFVHlM2AhoC8B/igGvnDA4eWBNn99J/Hg47M6USy7jvHvAqiY26mAaPvmqhrpiSEeJ9YOAlKd
onINu5fCnEDTDLDrf98GuZMEYdQBxE6Fq1r86kwIeSenwuuJ4ndPu+5XC+FEl4WrsWJXO/U3z7e1
a1DOG6st0ETPIrCDyIo0WXsjF9L5tv4PPuKbq/6vW0wlk7c5QAwRNSaLBNO4D9pXn3doX2S36sQT
Un0E9C5oHkfaGahTM8kGFJctyBP/p0/jnVBwo350+VFoG5x9/mwghzJErsX3Db72fB+FOD/H4icw
9h1kxwDDnXM16JwNXI8rc823HwP6tPUz6LxMQ1D7gudLRqComUoOblGFHcfaQk7FsTlkm9KmRMwW
NkrqZ7/NpUk+fwwrVP8eYyhU2ZC04zdAnhevyso5xsBJO9dYLzWDyl75euk6KF2qQU/ynN/IHpz9
zIvTLTDVvsxF4oxnYmMSh+LZ3wJ3NMYO3sf06mz2ek0hJOkHgB0KFIYHfBR1FlAbohJVCrC4/k/m
L9ShVfeOt/A3eTM8ycRdSwKmWmlwWzib3GcUwsbMIoVFMaZ6cpzkFQ38V+x5xOfqhytvjZfAZAnB
8s12Ni4AOTpI3YNEDR1sMGlues8FRIAsG7kOlPRFOcgXK6jxlwxywz6OKRotlvWMpW587+xxeiDa
5HatrSJPAl1XN2a1oVlosS6pqCifT8xk8cOAaIi9yh1yGpUGWybGxwm74oxF+jYDzSZpI1wZT0gv
PtNbaaMupLdTpyR8UmzitKqZ5Az26CNLmGcrJpGit2UTjiSw/hTr+DobEi34CGuha3J8vPTE1Iut
OfS+PzBMIoET8AY3Gz4sEUIaBQ+RvTH+VNhXIdZog4ZAbt/SGtqYqUdjzJgjCwzfb6cdGfGCD0CR
ubeITut36QytSrtdrTOaFmayvn0WXwE59QVFTC14CWE2gDxQT8/k3YMqJKKzHHPGYFVNnm/D7fUm
RVNftCif76yoEqCE+DB5CkFh/eMXfObNXf9cwakf7G31Sc56eUSHoCq/j77DJx0TRuZT0dIOj/WE
+NNXqyCKPKbMLiiQduphNgEDEi2U6Se1pi3fiB8olCieL8Av9o689kQo4aSAN7Wq9IVHpmDpD7Ok
3YqSeN/tbgvvKyde0FI5Vh60/9cZicT3jS7OaBohCntDox8R/AZsAvfxdjlWigz0lejwWyKOTdzl
ItOV17qymqMpclfwcXpv7oDGhjIpC9c2UNuHHL7XUGH1YVO4kET/ep3vgDUt9xSUKjNGAk1PHcA3
L1zfOSRT8209W1Wv6h5v+YULUrWVXdvWOtSCSAAdcKZkQ5kznDUzTKDXqZRZqRDqXMtGmkyFpe5K
G40InQDWGnQuRMk5ox1n+drVxtkf9Q85hMYRpudUbiJS00W0o1tgwTsFQXfbYPoCEuLlSrEi3VQj
bnmP//9DaAoE++iDe1SnTRJINuc2Y21SOdW8JTj/I042fsMWfdkMpieHxloSl9lIfs3t6C+jADj5
QUU+TEscmqAPBnXsUAkUKSDeacl6QMHtSjrPs/2hTq33ZIaEW4qvy0jGfIOZZfFq2SxHL3CqGIam
n5tTjQT/IB7yXbj9iTCKlUEsvWUfD2d5Tgo3L4UpSNpeyK6nDbuYsXhCW6vI2B9ZT9uHZcTzZxbL
E3DM0NZLlpycTzWgbcgqBZIdvfhwTjVWgJdz0Srit0f/W0vVjh4F9o5MyNQi0sey/C9mgh131HI+
McN1tkP1Ek8YVxGh8r67plpHBuz2O2BoyQruu3Fu7pAe/Zbr0kdE3dRlmQmNQ0UdLZChMCumg7PU
7eZfHy9rmurSfjlKGHP7Ul8t9V65tEQ39KPavTQlHiKk+ZlkVe8hfgGRZPoBitOY61Yni0bu/5sk
r7pBvFC4mO6tE/QGR0C0c/pJJaA5f3iu/NzhpUmrWzzy3kOw36nGOK+RzD1ulKqLYhQ5PxT6qrP7
pT24wAZVFzAXZG45E0fhO2oDfMjc6Yc/rS9sIpnI9xPrvPwuuDDeh3unKJtbudQRCC6td9Of2ikH
uoNBzFO/lOvBm1Zlx75iCoX+aYbpQCdBi2rQswZIv4+H3b2Fk9TW5e6EUDhpxFYy9RSHU2Z+tvRq
Ygk489Op1LTTHpP9OJiEPkgxVZQlMTs5GFX/mLsafx9szFplymlCvUwpaGoh4NLg5THkw3dvxnsL
39q0WaFp16syeQCmFOCQr6Ujqd/Ge5kEmmQfxUN6TZC3KO7rG7+2MtSqmTVxTnZC/IlZr3G8tb5s
Vtso0kRPgt/h8F9HbwpGd/V7ZkMg/KiBH0SHkA/t+gohXF95W0IVl6F2mAmSpzRiNPCkqcIlIf2P
iz/5SQQRDU8ZmmfaJRGMb5aWfx7I5Cv3jMzPRRsRN9W8oQ+sHtffqlV+8aAL+HbamIOwvXzxa3oh
Ne1DnELvmxT4uXJ43dli7Ka0BRxiCAk8vRwL92VaIcRC8ipD768f6L6Avpkjv7a6aIsovOpF/eBO
zhJul4PlymtBVY1QL5w2vlMPsXZdM2o7kXqHH/vuKoTBlvU7aMn/0Qk2ggMFXyIehCBbBkaBHlU1
M/WDHX/elBZr1MPlBkMJca6C9+f1KMx0MOZPCiwY9QSBaluNnkb0BHvIVUBvWS9+Wp5GFNOlUDYj
9zR49OdlWX8ETWN5mqmgX51t/UGzeY+QbKZ9GoYYn3hPO8OXQn5rM5ppYLd53p/4cdxv3G2twQK5
CUaJg4yGLcFf9rQyIitcq3bpiBtFHjlkWYrsju7zE+RAWP1yLTgNcuCqD+PROp+/3tc8uXKE3/zX
q2m++VZIMzFS5vGykt2RKjlH2xLvBoTYpVws1aq1zKoEqFVPGAxjUrOaC68J6MyOrWc4fgifUQdG
fLVSb2T+JI8RXvhzH7lWCPLirqKo6i06C191+RQLFYmIOfHLprW8Lc2zu3gSjHElEzBTqR0bDGo5
EAQSdD+2ox2PbGKlzEgfxRSet1BFMHvf2XHMkKAF2ubf/GIS7QCStYqZzdNmvrwmM3baurgDtDws
8rCDvFaqK58L7qVt00uNMV//c8FXe5/lQvHbb3OuArx+C01jfH9H86PAMh2EqEoGLat+gwMExFrg
+j1X32gErpp15fdy1rjZ4n1DCUcF7G3ydcxbKBkWBLOcbROrLE1j32pMEpzoH4d8CVEun15IDQyV
91YhOcJJIXERYNWnc7csMEF1fKOCBKrotHj3C8dSF7AfJ+zFhVl8NXBl9w1q92+Rp0YzF4/BC91R
MVsdYwGdI6T5qirpqR4mD4RsfVPytvGsGoyBqRvG+qy7+j/AETuAtrgJ69cZr0576jteOyp2D8s2
PGZw3/xYKSQFyQc2XO/4Vuuvr9omu1rtYy2teGcjUKIOZxP88dLz4hkssfbz0kLgH5V8qQLNCeDS
XHfPWHdHQNP2ugmb530j5kiyzOn4IS4zGj5kbrWKqGTnJMvalksK9cYk4aFzZwMF/YkuPGMmSKZk
J1nvOyRuW/B76+CmSsZDXhhgLvzlDSYDLIV6BcxW8XT1OQJNvHFlvHHiBHYhF5MFnyfEpeVUkKJ8
wA7hRZdddm6KBITLOdG67vDZ+OOFHfCvYt5AP7Sl+HS9uSAkbsu2gB9sA0R6wyEW3GDPKn3JFOMd
/IQPPe+cKQ2Yi+yvC+KIMBBcBY5iZ0P8o2qn2s7Gdy/FVtqKGAFD2mRb0dNMzm5Pgma3GJzWKW1m
XFEELawyUJZh0cwR0W7MH5IsYiu3ukmTtr3KTs1WaKxV10fMj9TK3vJX/130SSlo/uts6wLyk4vh
J3nNHtuxzLoKwgV4FUAbqcAneC5O4WUL7T7J1/WMt6X0lIDA13Xi5ihW1ox6nIIM1lujJjCh+QCR
YwmgovEP76qBkugb5dgEhV02pbJk7zV87Rga35ifD13EkE6464VLcp4BlZNS3g9SA2tZIpcu2mMV
TVc57rWBzZ17OFb9PUKbpQSNiJbPeBviwPQRnVPjsRnKI6lzJUoWqJcwLGF8XWxiCUSBjT64o5iq
/KgVMRHeJlgsMbfXI5mS6FmK4V+lUlLwgS+eLNDIt0Z3RY/B2VXYPdxwG20RJhHQMGTkLDIx2aNt
8NaY1SyanVlcHkh6CIKUl4sQXMfCRVht4gI6yhN3GcZA/t/QauqHHhiRhmeww6gZ9QhNMr67BxYi
kKN4vmFu3g6EfNvBO/vNTvEfgFtzLgwLrGONlo0WsPiziL7l4ndvhKUU6+2iw9+2wZe3UI9h9YAn
BrrqZIbvSq5NQo/hNPnGBS1uso/CiXCrQUE0j0KkxqpU8XLzenZqWVSBiKnRyRVR3p2XDXe0OYv2
EeJ8TcLbne1A1zoQaO6+idr+UtUPsUwBnpyPlF1VNcwawM0GJkvnbUMJfDxMEXuukmdh6yLkHeY1
YZBktEPpNCuLzKehp+Vo4reKnrVvZkL5eThl+SkScIrufLMpFkbE81n8+3regt4COV1lKirEReUw
LDPS9tVyhLLjfhdrG37rHLHg7rjMEl7ryi4nXJPe9Lav+CHiOhu92lyrcJNPgQQvAcMCnb8bvY2s
+e4QuQXiLL4nRdAjeaveXVR0aAUBCYslIpnzcLm7UlMzTgaP9Hjp41gqqd8au/hXm+vE7I7PCaS3
McWBW8TC5W2BJhj6KkuDEtjRfk11StauZcKBnB5fYIgQ7/WZZtJ56Wt2vPrIrfVB3rMQG7vhb8nc
ayIpHxqhapZ+TEcrcD/SUy3HepGCk5tFWmAPrnbxJK7gTO/aGn0+seI4sertUMSC2d7wjMKlghRj
VMSxy9A9yUbsRl/C6vptS9r8nyIG/YtkloE/9Cgm5f1+eQ5WZId0sr8CcRHQVnmf97UaA2Mp0Fp4
pYD2szLE+R229bVfE1pRfGmSjg4r18ZkzAiZT71YJlyO4fwjcdAiP/wTzTlxsKWGnVw0VwwdD2qk
dvufVwOJA3loJA/16t79hSI6G+Clr7+CQ5Q9a5vqf/kz4nwcRhj9ywt9P1n3btqbs6hAyavM8aek
nqGiY4LCyTc8O/tG/87aLCHvzrfryBE49T6pZmfV2QGX00UyXcttrh/F2uNvPriJ5/vwdXFwWl1u
+Xx84KqFAvm9KdMcaplE8u3P19FHnBpMxby3xpyKAmIAU9+fgHHnkkbEpUgBkoEND0SwLHC66Yr4
8cQFsxxeqQYsgktAuabVB+oL0vEpWYL5Zo/mCTUY+23N2q4b6Gze139UAXIcU3JWhmAvuaTQCdh6
f55+xnbrG+TiCDFy2gqXupRoXU1uRjVlADFTMo6wXvHSrNjZfKL9Kwgx/DJelSKrKoElB/XUqaQO
UuQgWBZjYWOSWs7f/lQTGKVp6mCdbAkNa0TGPO5yXSpikCe8ItPBGhiiZUwgcQS+BcAGYQcGdaHY
90XfQ1HXbBZPcAlMwHGFBDrJNC3Y5aiVaRiwqjxsoO9ILCob2ft1PKR8aXURzm2RuZ8ShCtPgZ1b
6Dn1OxbY+y3JMRGAuZI9A5Em9B0iFvxndumQhPtP8Ul9rXa+RNc3BpNY67cadYm9JewOgvtmI42/
rUAUepf+T5W690G8Y6OrQilMAD84QwVjZhajWy/xagoor4gqnQUgg3X8slDtDCAk4G7dLXIqseA4
et+nMoKfC6bCVL+HV7sP+kSUym/1g6jB0cNA7orPo7KnmxsD6JzkEHeg8BFNwdppoJOVneeWJ7qX
u30OFGafjeVFDNj/pMJBAq1Cl/iJ+1R71q7xz53HkXWzpqyc+Mc9YM01LTlroUd1dKXX4OHcNgTk
0BwSpbu/wpZ1S/BtbfuRtjDtVx+lvcu4KUPA52R8qejh0mDeP06XjZDRmr6LQL7lu7koMXpotICn
PeLeqKApCDJplBk6OpThUtXZyNbDNQmg6/TbzUH20faM/u8HypEkH7P7dONgGYflP6h10mSW8Hs9
G3Gl4mRuWGz8H36LHJ5hf+iBk24tWh7InPNwi7oduDP3W+1U7Tgifg4k4tl4RB8dWzqFw/I1eIgj
7urGGoeQmi2jPqEqz+L8H2gK1aPLkX7y66xZYvpWeygF+Q91uDnueDDblV4frEc1emnaDbMZmetT
niaAPCQB70DVLis1MrKZNihWhqtlTqo7cvlOK5BIRaXT3uMI0Ap8fK4bOgxzcXTH8m2BE7vCg3lB
cbq/ESP0PpqrIxZ2G0Ovc4R7oBn40kJmXplpBjKTc7yF8iBdhYVYmHqGzuokBczNu3Cn3fWGKbHB
+79+3n5cCeB8YYd5S+tQ59thYJNNw42+wxTQjwZkXneGYWnnC5My3YcbhutDDcjRxK4kb8yUAPnA
7SQZ8vCgfW7yzl1LcWPs3dvijpiAQ++bHkFkf5IbQ568icHNj+HUenoEbrBFLX8ORpsXRsZryf60
wkhsCNhI6rj9S/MST7TAp74j++sOUQddJXK4WrRPeZcjNiPB7xA9b5LaoYdZPoZlJwoBSg/Y9rUD
3fXtoxBHUNxE/DqIyDMwlg9BLvJZLxDdcAOCAoZCakfYaKGwU4AGHoOj/o89PWm/0DJneOgNwc+E
G0+mZDORyWXK/oI33CT40fAlBtSpbjrTg+wN6S5QVZiI+j2GgCfDg8GpsVDgTRHCQhV8O/J2jdWY
9K/LSDMztjXA/djuDrvD+Qz4PjO0ZIgQwCtg0HhZyX5CDzd2V21b/SCtKp1KwU4goiEOaHpDSecd
fmPuezLjAdL2m2U4E6+DXNZhhkkK2PVu7+mMZWbwGxAv9dOM0w57+inWb2CAW5T3lvua9bFWlGsm
f4uIivG4AFjjM0ZDZDZaurjhMoIHdV12sCQNDqSeS57QN/Xh883XrpFVNASXZ32ECTx7SqndsMls
iUvyZxqRzw54GwYc+0XSSji/S91Oo1/OcjgTwxejaXQsB0orOH3zujnE+toifU0TzPW1tG+JWp1k
bVMiPf44PS/ydt2xcpLBG3672LWCLOAupQBpXq73efIn8oXz+GvX6PHIjAWBFwfn8yH47esbtccC
j09ZuomH8XfdvIw1TMUq6quw6cSUKX5X2hFbEbiYJ+Mr4LoZ9mebIZaIpOGVJ/8PLgtUuKXMOV+0
DKiJoVgXu794aaejh2XKU2hWHYKy8+aF8AzcWOY4WYD5UVP4gFKy+3QHfN7zYiSFvKH1ax6OUpq4
HaOhOZWtBo4rtkfWwOOH5Lh9JcJo06a5aVxmBywORJ+93Dj8cqsj0RFqvlL1pVFyhOwIfHUwlZhI
Z/FetZnjZMBunWE0N3eIA2vPAlQR8kIDEuvPDYCUsi8QxpuaGOkLMLXEEM1SbwRLD+YOq5Ei9fGm
2uHgfSrbZYGGOUbL8tbydSbIaceGOIbjx8HRzG0Y+ErnPeqhaGhPCzYm/UWQEcN/u5+83gkXyAv7
YDCbKvHF9YKf446v40C2V8P5AXrdb8qLnCkyn2RJwLbahq1h5FZq8HSWtO1/8ZltZmeeSAPC4ot2
47gS39WURvMjHPAXDRWMW/+MDBWltErBzb+lSMWdOOXIzqgWhPxsBd1TQhmc7kcKnA7eVDgTaTZ9
VkxXZGYsV/OsMCIoTTkp7Yc/LijQBwsQne17oOJlnYemOlkYW+dJIrk+bD4gNV7kD9FNT3zsjOhw
BCGcc4yG2tUvK9V1H8ajnrGY/1S3Ddbp5BumPrS3zVQTICcLp+0oyDI2fT2Xmsxx15iRfQ53YzIT
DezW7RNbRonL5aP2eHk8GHqz3BS60Z2gaDcpyKIb4nqIUbQ5deYqIzl1aQu3INUvZvWYa0VjyJ0u
lJJdNmLBMyIWBBe3RO9bDRapLaN7SDRg8jVOt47OSKPZBzsTYDEL7ua6Lh40cprI8jD1xL2xa46h
LyHmG3ukzK9aXZ37WrtoRbac8DWizgNsE3a87FyYc56b6aZM6bH9ue4o/DeC8vwIkhEPCiZ4LlsF
q91O56lIvM9M+06wJSo3RuIzzeWxLPRz6if6/byAWZXH/tY9MQUP9/hpC7tniM5cGMAirjCGn0zq
YiYAWHcxBil8eD5upU+pmUDW0yWSfCxG0eElvbOnjribU6iztUb1McWAY4gdJhXevqmoOXs7fM3v
XKXhMZWzB2SjbzhQBJ0ofG4wvFGcMI7l/8Tpa0EFo6UnUXHRC2/ErODGpmbez4d5XIKAx7RYGrZG
1h4nD+6oMiThcLpW05v3uQi4VpQrDU9UA26YzWuUVGGFkSDnVLbvDQ0dUZ+TLjaokP2QvV5ljnyH
w6ZJ9jQsK56eJUVEfTjTOlfFfFZoUwruCXEazW3K/Fo0XDNsp5pXQO6BTLhspmdMgO4WM6LWy6tQ
OxnOQqsUNrePBY+zQzPckf681vSLUXrfifxNCk8r7uLaaSpm7Yc288yf6Kqwhn5ovR5GY8rxxA6X
CDAZOKqwvNaUUfxIv1lAbPfBljWAtPUUSRnP8vsEtuzQWw66hwaNbzq7sYyXuVi1xhr7lF4+zb4q
x93OZFxOHPWdECNWLdJWiq0HmItaQttgYvFYdjyvg1agXKR95zBZJ/fumpy9ugUwLGkjN1CXF+Rj
nDXqO2rEKn7+vSYCP7QNW3Wk286NuDq8wEzjmVpZ1PilAci6Q+RDL5lNes+txJG7sn8GPu1FpUch
Z5nr3mfaf7Sm7xSg7Nbsc8RU1YuFzmIca6VF+90c4vjHc6LUTAA55URpG49j9NOQxIJN+u5zDZNs
17Ol/1nNBMLAmFIrz5K2JP3RmxBwQIW7sdCf23b5SGrsXcf48M1ZvijqCrzTWUkwqbMgmV+k/en3
rfoPuunM41NcXCEUfloKAuy6pBE0umyPYZOV8jKwHBC0Xp9J1XGlA2dpPPgWml0Xe7VP5q/JzGED
q422qCnwubmfvUsPDOmQouUz7LK6TrwKH8S9qB1K3N87Vzur8pHGAxqRlAX/1nYV5Whc5PZTnBPZ
Gxc8TLbaude197WoPwQnSMPxoHfkyHXkhUUwRizxJ/G73gbyV8+YpDXjrW1mn+Ae8yXlIanU7zOZ
UEbYTyqbop1UxbGZuKlgLDkWCXP8jmEfh4vmIl9Jo4+CtfY2bjUbSnEqCRGB+ZJ8B0VTANojZp66
CjxN1qHKpNMbYmaD717Da232pUbPwh6AEwqIMPlxwZjSdXNhdzh+HdzG9fxNoWBgVB99882SkBRe
VDL+Ecujm2dt1qpHob/JtGxNb7a9m8P6KJrRXTMcUGPL6CAVzLBGgZYH+O6ciK6foVc6UrcShvhq
AeukL8oHpBsqc0ffaCJfdHMoxcitS68/WZLKM8NtbZaEZHgVpEstnSuSt1XJPdxCivg2CpNjx6Ya
MfmdD/8PCXdR3jkLa6qEH0moUzqd/EC4Xepa2Hmrgp1yDS9s2HvsD/E34M8BD9lriLIVT0VJB/+z
yUt3qMuLN+T01wmvcqbvLY1j8kxWQSo0AoVftFbw5QBcrxTPuqEEsYKaowiKjv/romBwrhLeQ3P8
43lFsrL7lh+cjdzVzePPT00jAJe8/CRP2suFbSUOhnXEiYVzDnNYXetzKZDWmMJUwetIECnDnDW9
j7PSvgN50oZzrrBMlhTeFbrpEZ1XM6CqNcQMI80fazfvhHSKovWDR+BEvYe5LFNQFTXKXGgMIZg0
10CcOSfUtHwaKQ4Zd4tckmuSGw5+Cm5lnPM0C+9wKG/c+DjT4hy98+Y+7nPQXCycJiAPMX6lBt+C
Rxup6TDMGmR8Tpli3AgGmP++wTdOSqN4MHkICkqwMFjTcXB/K7U6qHmnSgkXtw3ma7yE0UHCxTg2
u82WSfcJiVxoXEO+32NaNYO2X98eSACgo78JJjsT7hPpSgL3Fvqtip8Pkp5pXoAo0fhDttqSzZGx
UjVrhgzFi8F2XWyPWPVJG/E5FLRm+GVMydeahx4nMd2Hu1P8lXIIE3Af5osu+wD2K1UgRznUFaOm
B4AdtfsmfR5lmXVkJkQdgC1s0zZ6u2cxl5diMSxf67ZUCatNVm5DImqLJqXIZaGIETDjJB7HZc3y
vdGgivOvjmXP4RqL97FWF/u/oqdEqcq+ZDvtepIkd1nQLxI2Duhdny1xTWmMaOJ/GJEB5KkR8IPa
xyriKbDuCmGJKSmGqlY6vUPO441rkMTuRarkehb89jE4F2DMHTEXcC8MHab+IpMVGo3lzOyJzDP4
lX9ecoQ6NlqFNlKC0RxVOe37+t6ExLhiUbGEt9wAMy/FdtUtx49siPhn2bNWISJZKTuQfWGLJfVI
enGDUJ+j/P64fn+YGoZr9d3E3GipQdHEw8R1Cv94MeodLVcwMn+E4b/fvxXbEBunod6PFa7cLbgc
oc4beZzzETsdIl/bGy+eK46AktdBIEf6ckiBH783iEuk19uIR0cysZG2XCJZN3FqVb7Dwfpk553q
pTXW3uK84tUVAlIc1lFMjKZNHDUTqSJ+RQH3YTDnpexkXSxyk97iy6+RtqVfQ0d6yLpJ9pWfoywM
+2XdBubG5TjjLs0h9cDeeDOt5rYSbCS+ggPxY8xUYrWBEa224Q5X/zS51GeTFjgkGluvY61o4LJi
CWw0f7XbDguWxXsgUvWPF6uqmKW5YW2/0YjZv2hKWo3jB/nLMcchbLYZ5qxppZKyHliR8kXohPsZ
9QWQyKR9eKRLLMFLkpVIlQCdXdjWWwe3OtfHDVee1aFSf/XY0fGOtxwuZI1ryrX1DKpwtMJz0juL
VGRry4k4lgbZCXh1npXaA47IX2/Ou8J1Vg40hanb6BCX4m7fqF2dFVmpkKBzTI7xjfxi7CkewURk
Ch7w/l99D9A/4lYnKGWEyTjSsViQie1PUqsN6ZDmyuVSqPC4tCqLJmYgalvPp3ijnCoHALrb0AD/
g19ypFUmpLg1zas4sEBGzDXOFb0244hZ6nCoPs1arXcr4rmRxoFcCgCRZAfklPBNGqbPKMEaDEYl
AwFxUypYzEI2lH01yUK3GmCr/PkVcTs+lwfofUH5digNN7P6nbPrjdXTwNWLdKUAXJYnzLRmHT0+
19xRojIJaUsmUryuQ2XetiNYYnoMFjRH8ChvRTE1t+sWjM7YueUm7pUg/i1GmnUGb2G/SCfzLIuZ
YrnmHLXZC1fzOJ/fL40XqxEN/1VH5WwJ1+HeshSM4/3JbfubJGUc/i3CtfKXRK3bdfEPMz8BrMa6
XVz8hSm+/EvZgSOOUekTYzlxACozhzCxwKr+EWPGYIjmB0Tf+Qvf65YZ+U6zD3P3Q/wy3Qtmi3Iy
bYVZun+rGjd5OzWRm7fwUsoHq0Oxwc1PCgdSqwBHhHEFdv5/mbApr0WU4Ivbd1i2h4XLc5j13uQh
7R6jkFLZLmKW63XYtoGMPI9+VSmb1KYkmDNcVjNFaoct+EaQu9PDunm4YQccJlcedR9dbwPU847H
FCyKguGCXSdArX7lLGOg67reKFs44c3N38eNoA2ky1qlOoymHyClYh9v1LjsgcEzOD4nQ8qCXkTr
n+H6z9vu3NF0qH/WnSYFdHsYA/Y7dhtUQTZ6B2g5/teHPgH/waHyFGt6kjJRjwCpl1b4hsboebc4
QWxvPr2il6MOfXebDB0UP9n2tLDUMrulDy5SmkM5wYIDnPcvkr/yx/LvZx01hEjbr3krtQ1fs9Rl
gat9LA3ju0TBkpEY6g/dx5JZ1G0SBVMWUzaHyNaDsFFnaTiGEtB82WMU6+lRW2IIFMEmpRXqSN3P
uRpmbHV+1eN/APnzwXf4GXlRA/oFVYFWw45CW+JJiJH9FC7qjsZQm4sA6yEXg8JVlQbsP41K6Ga7
8f49otzrN9Qg1OPQZDztJ9Hts8QtRBPTwvkiyZafwA+m0l7Azyapi9AcjiLQoPDohAuMJN7YHKtZ
0tXTC2F7Vm3XadK9ZFsL4VKPgFJ6Lv0JehBHIC9WCocebkB44gmfGdm4pnBsyQsXRail4MRXH3tt
PGEG64WUQ4HwWz2Xt3QpXfGDqasuCvM337jA9c49gdhQJnc6lF+yflh00K+VKy/UK4iTK89EuEes
lJmZN4DVFkHIjc2I7besikKNkWF78d8OudGiBs9u9RYIhTFOvgtq2kaJsDrnsbi+En4oDeALsozh
Rpok8oFO1uEp1fABW8jdskmoI3AUyNga+KCAW8viIoYVwA2fp568S4z9PaTPOK3jwXkC2XnGxPoT
WrrZ+cOH3I3+V8jR/b6Pm5jpqcJPKuSKcSBrNPUonK7ekVtYQFe+cdBlZ1zS7dt3tFvh6KyqOl5U
6/ey/pF8VjNGfYACRaztPma50m2+Hp9BRY2IaByH24zrnuuXjJqCJQBNlkwigNtRxvbnWOBzwcdo
0NVE4rCEmBGFR6Ub+S+IP6uPQBsUT1DjbRN88LYr81YiL+Avx9HL7U0IaoDJ5Y9ct9cuZML0riAM
b1+2PHULDvP8MVsvHyOKEBpF+L5kn/nUfyYhvGkFNbxfp2KWTZLAV1MiaHiiBVV39vMTk9jCJK6K
6qjiyivHHYfmto0fFUHczGHeFOsKFropyTzhd3oqGkG71/sHxGow8GsBMwjDpwEdK5rkV4OyRbBu
a2H6vRhEeVYDEqN3jfeO/ANJS/QPizBrcwnDb99IcMk4eu0++u2BSiuWWkEw+sQgyyq2Hxutrwna
phJw69C7eUig5xLaM5sQdWFdapwKLWLR8UjQAL9pssXzq9q/C8Amsz0aoPF6Bmx4b67iSNipVnzJ
J2QyKkSmCS1pVpaBl0Fltj1U9Rpn4/hElEUgRVsar1/zR17WardFHsTFbcLgV2iIYZ0HXfj9EcEL
1V8IPwpU6ZGsobp/uNT4qSxqa1eufvlcD79l3PgEwiliw7goxeavRpjt4fRsnS1WJTRzDoWBirTj
qNx0RqrHn5ELo6K8Uq9Yyg6f/EVQhrlw2GqvgBqXtKywiNM7tn3n6znrn6xdlJmm/iFXQVQ3O/wH
H3jMz9Cu7amlDUthgin8MTVwthoxbnSbFbdlzSDdVBfs/kazjkLYkFYZ4gQCFBZCW2vfee2kgOj1
97geatjxapkr+VX1Uo5BYb6DRvAwZY7UtGAWP6tbBPCCNPdhUZR0+YUwdM6bOg3yEz0j4tRn8k1L
N7y3Jm83wBT0bALLfRp7mEugMa/wyeiQHEGIqQKeUCezVtYC726fVnYJZwjH7bSgWEmqFrV+msMx
RPeRrKO5T8V8q17wqowpsN/BC9gvsIChAeuwxGPlYnl5aV//hC8DJTxH0a5ZMRhsC0f6kFXzZlRj
6M2k8kymaN0L03FCBuPE7tOtH0nqpB8oqk+GVZ5us/cfp9tUUq5xoXcETZLpxVqLvXwSZB5ZNXIX
JIVinxA1jqL7o7y/ZFQTOzg1wdFSP+geh6iJTnTNkbFjroOmAobIA+my2znPv3Eam9/LtiBsT4hS
BlcB48V7A/+4xDaMaDTjkUDeQHJMf1pAspc/PBn9cvddkoAAtKNoX+v/ZC5J8m09dP70zEDw1DOw
1L0GjlKBsx690Ndape6AP2eNmSPpGUluF6R9V8rutovt6OKnD/Wmjv060nbz9YjELCtDq+ds7Iw3
YFU+LMGuU5uzAgOK5qbK9Ql5FsUW5ocAsmYoW/UQBp8bzlrT92TVikmQidBtwO6zPPRfPsymzKmk
tzL3S94m+RA/XGb96cWsdZ8HbuNAf9EWHaHj8El1H0JvrysXUx0as1ldcwl3y8uL0ThKjh7DLInA
iI/Um/fnNtgdxIhEeeQQhZmsi4W+cgiBHFbaoRolR33FLcHHix4Vq40+uv8MXpRHHxcyTJaZAfNW
H0fg/xxb0xdeSVm32DzHT/hvCW5dYVecitT0UfU4MidPsSvEqFjpUbKx7MSHjfBOHnLJInA6PW9k
Xx8WS+vBrLKmRa6i8LYhHxyU7+spXh/ysK8l+qkjKoeYYdRC+VwmVC7uzbstVBMHc+GxJOLpzLGx
jnHH8VA8lTVI0yya2S4PNjsV4JgGBQK83hE2kNGSltJ3eMEEMdxk6AGWVswgGlwGrxhcom+WDiPY
orlzDPsyktVGCZYN++4NS3Y6EjrpVR+VDzvu9KrzZdIVNjcctPvifmyt4zbxRUXxBPfNlIM2gzb3
GjrgBdxi05iA5zMujK1lpCn7gzus6BwXbtVtQI2piqOZ2Cikc2lcvAjRgkQh75DpExd32jeDxpbq
ji06u4gcAjz8WKy7AUJ0VtfZcFUh7BpQ/g0EKulUBPOhRbQoQOF3+7jJN/s3OcbhuA9xm8tRdZnY
+iXogpFclZJMvaRtSaiCsei4B/BUBfDrQy8usYWOueitUl7QeasC57zAyV6O9zBl22pHj5QPufe3
VpBR09AC1kiyomHcrHmon7cRPztb7g411/Ah/sge0AIEh++Yeiokl7pnyioBiX2gJYN2mv0HB1x7
qHXyXkeem2m4KQexmZN6f3i6O8FA9OSFHQ1pGetzW8X66iAWdYHoPPGcWLc5uVyUej1SnZ7kEnLR
vjrRFiXKTX/MvdDVD++pSsD9AB25kE8Zq9+gVkclYwh1+iC6+xF/YEScjfHj7sVPVarv53WSqitL
G8byiva6p14+4vdtoQrFBgSCz7UIvcSiZK76cIIp+2elPO7IHEi7bvVrJKM9QlcT1LTWVzT8n5Kc
cYWC8dd5oSMvelv3I+sQ/omU+vTP5iTXRVBkn3Y5B43kkK0hbqUS4F+S2WTDLqREM+Rz68Nnjz/g
ODhKGaY8XI7LFnBgisyqTM3mmYQU+X2Z6qbptwaowhSuaBE26yad1RITJML8jo8WxM3NKaJ3JhAz
Q9XYs/kK/08Ke2aQnPojNsc5JajUCpzwHVCRGOZyOm1x5ifu56E1BfF3b/mlv1CvB0RHZGVA7/nd
aSmIvmMoE7fGzi0aSx3XBTt6irUbeEXt86fvibFquyrXph+COHy9bkw32Oez5DWIohcrtb1Qhi5W
IlJWJY4s8h470jAKftSajtqpa81ajSl+bX31hmpkcmxMd5AJ6U2UgJpNtRVMI2y90VU3v5z7mZTD
mWUjwMXr7H/MNlzKSTKVd+1Qec+KTaXRTnevOujg2mb3DvBMnUgwBPMBEdI7Rwb+2KONZldEHfeU
Ifm60VD2YS+rDKqj3SlcLOK64lZVxkexyebbKz6Sa0EQPf7Rcd/hE9mMKAHUtzPCwNhfCq13kjKx
tHGJCc9FiYQmWgEDFUoSL8O0DQD5v9tdT2QCEXS/GEyiRw8iyziiR5AAGN1xfr3GA7vh8dJfcwBy
2xYTcfpJcQFDyZ4l7fjFxuAICPmtVK+w8RaLwLDUfpeC8V1vF8wxrpVXPbURQ3vEwuWFk+HjMFt9
aLPKDQd9ahTlZAEYYPLThhBbhjRv3ewMmSHkGqjG+1Bjrfa7ZzzpX5sTSEi03i8u6608qRFtAyea
XxfYvsDneGlrqJ4Dcp3CQpl9KAkMQ+r5+HmUbetw6MRKJlnF60dMRHtNzh+KsXjK6HcvGoW6hmGV
GxRgJT+xeEIdBIxjupiX4YRsKOpZ/Gd8RV/uWL6q5EFeuVMz54Lmc1Xadak8PKCroRnmL6i1gfQF
J/Rad0FQN9j/UNtEQhCLdtECU1TLH08Fa9vgALToe0dFAF/a3FhtgjZkPmS2Qh5o0ROlXdvMuy57
HcRQVgkLozv/LRr9/i5LGu3gyXi5/l5/0ivS8imhF/HLqofg5751UNFu8JHIHV3nHMCW70rH3MqJ
0kkFB49WM6+N18ce94mMS+gD/bf2oCJMMSSgv5eJda0dbddt2XMwC6iALCPmMeWzGufnzOghNKyV
7qYAarXwt+ZoT7pmJQowbvZPw9GKcA60J3y52thFq1mwbd3136H8BcN6vcetJvPuc9p4zNcXuhy5
+PjfLyzUZ6vMyQqAXeC5OK/GpsqAxVLLZTMS3eq0kSNgnwkLyyAaajWsxKxjeA1beCqvIpAzUKow
eePkEVRIr1tb/F3vTD1rO4MDRXyztFq1zMFNyzTdjRhiJUPwn0E51Sp9AtU4zWMVKVp0gt3MZFRU
nhTmaPx07MFwtLlWEcTsPx/KRrjTV9zYP9ZTy0jv9q1DEte13e/itEpbk53PShORgGzRME5Pq9wg
BhicId+MZuSLeTM8Nch6hn1u0zmtY4xE+a5LB6kg4ksQBdgmk+l7VUfJb40rbW6omQ1N84W5gM1X
YPKZlPuSDG5uoARZ9WCcaOUJ5tLdNyLI7V0cTgJXS5KZp6JaX1bIVfxb2lZhrA89JxkeFU/VyJ7B
dZpliIdu/EWa38jqxvZxv4xT1gNOQvaHYvsecOR+7WWgZ3/ZoOh+RmoTe43DYZaIxA+CS29LN32W
S6if0wKeP70Zhcgx+AMm095Qm7ukHuNoRIGQp42eQdNkLuU2WR2BdSvsODzv/81UEI9mMh3G6dh3
DUa/RcZEJ7c4HKiAkyy9lcclkmVLbAhcq9ML+o4XNqceJpciBZO27httzx99cBLNHvredOhi00NY
Xw4CERY3ehhi47JzVG640C1SVxtOGayimvH2OxLHuoq6My7h/XenE/q57Rp6BTlAE17tmKzfdasE
xBXlpk7S7rDjWrE0X0z84sLjjFD16B63+rA4zMInOf+fRNaPZxGaiXOsfDV+Iu+rys84/TI98UfH
Ktr5kRwpGeWH6MPXZfp+5PzRT1eDYDA2KO+ZITWJMhWQCTbEJJqGMbJVheXIrdg59bWLR6Sz51/N
4iXI0RR39PtVTdsTL6mMzjVDKWMJkovFo0MHMhx6xSqdhytPTh8DTKUa5YNgJJuCqAv0R9iUeLF/
AonrB6i6DB1Olz2ikSo+zGKUzlMg8FiexCj+FnZHDEjKbRwkM3rVfgZF6UFFZJHTgzAfFkjkcXE4
n+82tvIPyChQ3NovTS3Wj2D8t8ecH6ohiFQtvNt06DcaFNUSnfbiMXFc1NEMoFZKEVptQpYW5YIO
nGvgIHosKkXsbesx/ntBiRB4kfTyIYQbvINF+LRaFbKidMpnVw==
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
