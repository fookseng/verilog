source .synopsys_dc.setup
read_file triangle.v
source triangle.sdc
compile
write -format verilog -hierarchy -output triangle_syn.v
write -format ddc -hierarchy -output triangle_syn.ddc
write_sdf -version 2.1 triangle_syn.sdf


