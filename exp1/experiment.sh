#!/usr/bin/bash
for i in {0..5}
do
    for j in 10 50
        do
            echo "Trial $i Threads: $j"
            ./counter-nolock --iterations=100000 --threads=$j
            ./counter --iterations=100000 --threads=$j --sync=m
            ./counter --iterations=100000 --threads=$j --sync=s
            ./counter --iterations=100000 --threads=$j --sync=c
            echo ""
        done
    
    for k in 10000 30000
        do
            echo "Trial $i Iterations $k"
            ./counter-nolock --iterations=$k --threads=10
            ./counter --iterations=$k --threads=10 --sync=m
            ./counter --iterations=$k --threads=10 --sync=s
            ./counter --iterations=$k --threads=10 --sync=c
            echo ""
        done

done