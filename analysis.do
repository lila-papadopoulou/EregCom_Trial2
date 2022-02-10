version 16.1
clear all
log close _all
log using log.smcl, name("eRegCom") replace

// Set the random seed.
set seed 1234


// Set global macros.
do globals/globals

// Prepare the data for analysis.
do data/outcomes

// Perform estimation.
do estimation/estimate
