source .synopsys_dc.setup
read_file SME.v
source SME.sdc
compile
write -format verilog -hierarchy -output SME_syn.v
write -format ddc -hierarchy -output SME_syn.ddc
write_sdf -version 2.1 SME_syn.sdf


