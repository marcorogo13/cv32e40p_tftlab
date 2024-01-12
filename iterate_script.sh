#!/bin/bash 


#clean file before appending
> results.txt


make compile_sbst
make questa/lsim/gate-timing/shell

# Iterate over vale from 1.0 to 2.0 in steps of 0.05
for i in $(seq 1.0 0.05 2.0)
do
    make zoix/fgen/sdd SDD_CONFIG= K=$i
    make zoix/fsim-timing FAULT_LIST=run/zoix_timing/cv32e40p_top_sdd_K$i.rpt

    # extract the second to last line of the report file and save it to a variable
    temp=$(tail -n 2 /home/s309578/cv32e40p_tftlab/run/zoix_timing/cv32e40p_top_sdd_K$i.rpt.hier | head -n 1 | grep -o '[0-9.0-9]*')
    # extract only the first group from the string temp
    temp=$(cut -d' ' -f1 <<< $temp)
    
    # and append it to the file "results.txt" together with the value of K
    echo "$i $temp" >> results.txt
done