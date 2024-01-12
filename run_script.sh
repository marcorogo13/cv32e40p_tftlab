#!/bin/bash 

make compile_sbst
make questa/lsim/gate-timing/shell
make zoix/fgen/sdd SDD_CONFIG= K=50.0
make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K50.0.rpt