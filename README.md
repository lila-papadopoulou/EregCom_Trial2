This repository contains analyses for the eRegCom Trial:
Mørkrid K et al. eRegCom-Quality Improvement Dashboard for healthcare providers and Targeted Client Communication to pregnant women using data from an electronic health registry to improve attendance and quality of antenatal care: study protocol for a multi-arm cluster randomized trial.Trials. 2021 Jan 11;22(1):47.

NOTE: this is the description for the effect estimation and does not include the data preparation analysis. 

SETUP
The data are not included in this repository. The required data file is in the sharepoint file ".../eRegCom/Final T2 Data sets/data and report for statistical analysis".
datafile name: "outcomes_04112021_nodup.dta". The analysis is implemented using Stata 16.

RUNNING THE ANALYSIS
run the "effect estimates" do file by section: 
*1. ATTENDANCE EFFECT ESTIMATES*
*2. ANEMIA EFFECT ESTIMATES*
*3. HYPERTENSION EFFECT ESTIMATES*
*4. GDM EFFECT ESTIMATES*

Analysis time is not estimated because some of the models under section 2, 3 & 4 do not converge. 
