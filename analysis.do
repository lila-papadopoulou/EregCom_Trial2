version 16.1
clear all

// Set the random seed.
set seed 1234

// Prepare the data for analysis.
do data/outcomes

// Perform estimation.
do estimation/estimate
