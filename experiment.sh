#PBS -l nodes=1:ppn=1,mem=2GB,walltime=05:00:00
#PBS -o output/
#PBS -e output/

if ! type matlab > /dev/null 2>&1; then
    # Running on laptop
    MATLAB="/Applications/MATLAB_R2015a.app/bin/matlab"
fi
if [[ ! -z "$PBS_JOBID" ]]; then 
    # Running on cluster
    module load r/intel/3.2.2
    module load matlab/2015b
    MATLAB="matlab"
fi

# Go to the right directory
cd $SCRATCH/CorrelatedShadowFadingPerformance

# Create 'dat' directory if it does not exist
mkdir -p datV00
mkdir -p output
mkdir -p datV00/MaxSINR
mkdir -p datV00/MaxSIR
mkdir -p datV00/NBSINR
mkdir -p datV00/NBSIR
mkdir -p datV00/ShadowField

# Run code
# R --no-save --no-restore CMD BATCH exampleR.R "output/exampleR-$PBS_ARRAYID.Rout"
$MATLAB -nodisplay -r "RandomOutageProbExp,exit"
