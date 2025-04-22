#! /bin/bash
#SBATCH -c 4  # Number of Cores per Task
#SBATCH --mem=16G  # Requested Memory
#SBATCH -p cpu  # Partition
#SBATCH -t 00:30:00  # Job time limit

module purge    #make sure don't inherit any prior modules
module load magma/2.28-14

flnm="toMagma_"                                                                        
flnm+=${SLURM_ARRAY_TASK_ID}
flnm+=".m"                                                                              
#echo $flnm
magma n:=${SLURM_ARRAY_TASK_ID} bertram.m
python3 bertram.py ${SLURM_ARRAY_TASK_ID}
magma $flnm





