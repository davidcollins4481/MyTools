#!/bin/bash
if [[ $(uname) == "Darwin" ]]; then
    cpu=`top -i1 -l2 -n0|awk '/CPU/{i+=1; gsub(/%/,"",$0);p=substr(sprintf("%3.2f",$8+$10),0,4);if(i==2){printf "%g", p}}'`
  else
    cpu=`awk 'NR==1 {p=substr(sprintf("%3.2f", ($2+$3)/($2+$3+$4+$5)*100),0,4); printf "%g", p;}'</proc/stat`
fi

echo -e "${cpu}%"
