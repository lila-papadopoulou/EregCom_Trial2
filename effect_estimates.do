version 16.1

// Check the data signature is as expected.
datasignature
assert r(datasignature) == "15237:408(57578):3640196584:4282140441"

// Define a macro with the names of the outcomes.
local outcomes attendance anemia hypertension gdm

// Define data labels for the outcomes.
local attendance_data_lbl   "Attendance"
local anemia_data_lbl       "Anemia"
local hypertension_data_lbl "Hypertension"
local gdm_data_lbl          "Gestational Diabetes Mellitus"

// Create a frame for each outcome. Each frame is a copy of the original data.
// Apply the data labels to the frames.
foreach outcome of local outcomes {
  frame copy default `outcome'
  frame `outcome': label data "``outcome'_data_lbl'"
}

*1.ATTENDANCE EFFECT ESTIMATES*
*vars to keep for this analysis*
*cluster size*
frame attendance {
  gen clussize= str_TRIAL_2_ClusSize/100 if str_TRIAL_2_ClusSize!=.
  label var clussize "cluster size by 100s"
  codebook clussize

  *phase-relabel categories*
  gen phase_n=1 if phase_x=="1"
  replace phase_n=2 if phase_x=="2"
  replace phase_n=3 if phase_x=="2 Gaza"
  label var phase_n "phase"
  codebook phase_n

  *gen attendace vars to reshape to long"
  gen att1=num_15_17 if num_15_17!=.
  gen att2=num_18_22 if num_18_22!=.
  gen att3=num_24_28 if num_24_28!=.
  gen att4=num_31_33 if num_31_33!=.
  gen att5=num_35_37 if num_35_37!=.
  label var att1 "attendance 15-17 weeks (numerator)"
  label var att2 "attendance 18-22 weeks (numerator)"
  label var att3 "attendance 24-28 weeks (numerator)"
  label var att4 "attendance 31-33 weeks (numerator)"
  label var att5 "attendance 35-37 weeks (numerator)"
  codebook att1-att5

  gen lab=labavailability_y
  label var lab "lab availability"
  gen us=usavailability_y
  label var us "ultrasound availability"

  codebook uniqueid b_TrialArm  att1-att5  phase_n  str_TRIAL_2_Cluster clussize lab us

  keep uniqueid b_TrialArm  att1-att5  phase_n  str_TRIAL_2_Cluster clussize lab us

  reshape long att, i(uniqueid) j(timepoint)

  *A (0) vs. B (1)*
  gen AB=0 if b_TrialArm=="A"
  replace AB=1 if b_TrialArm=="B"


  *A (0) vs. C (1)*
  gen AC=0 if b_TrialArm=="A"
  replace AC=1 if b_TrialArm=="C"

  *A (0) vs. D (1)*
  gen AD=0 if b_TrialArm=="A"
  replace AD=1 if b_TrialArm=="D"

  *B (0) vs. C (1)*
  gen BC=0 if b_TrialArm=="B"
  replace BC=1 if b_TrialArm=="C"

  *B (0) vs. D (1)*
  gen BD=0 if b_TrialArm=="B"
  replace BD=1 if b_TrialArm=="D"

  *C (0) vs. D (1)*
  gen CD=0 if b_TrialArm=="C"
  replace CD=1 if b_TrialArm=="D"

  *EFFECT ESTIMATES FOR OUTCOME: TIMELY ANC ATTENDANCE*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.att i.`x' i.phase_n i.us i.lab clussize || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
  }
}


**************************************************************************************************************
*2. ANEMIA EFFECT ESTIMATES*
* vars to keep for this analysis*
*cluster size*
frame anemia {
  gen clussize= str_TRIAL_2_ClusSize/100 if str_TRIAL_2_ClusSize!=.
  label var clussize "cluster size by 100s"
  codebook clussize

  *phase-relabel categories*
  gen phase_n=1 if phase_x=="1"
  replace phase_n=2 if phase_x=="2"
  replace phase_n=3 if phase_x=="2 Gaza"
  label var phase_n "phase"
  codebook phase_n

  gen lab=labavailability_y
  label var lab "lab availability"
  gen us=usavailability_y
  label var us "ultrasound availability"
  label var agecat "participant's age at baseline-years"
  label var parity "participant's parity- nulli(0)/multi(1)"

  *rename anemmia vars for reshaping*
  rename screen_anemia2xtra scanem_qidsms2
  rename screen_anemia4xtra scanem_qidsms4
  rename man_anemia2xtra mananem_qidsms2
  rename man_anemia4xtra mananem_qidsms4
  rename success_anemia_2xtra scmananem_qidsms2
  rename success_anemia_4xtra scmananem_qidsms4

  codebook screen_anemia1 screen_anemia2 screen_anemia3 screen_anemia4 man_anemia1 man_anemia2 man_anemia3 man_anemia4 ///
  success_anemia_1 success_anemia_2 success_anemia_3 success_anemia_4 scanem_qidsms2  scanem_qidsms4 mananem_qidsms2 mananem_qidsms4 ///
  scmananem_qidsms2 scmananem_qidsms4

  keep uniqueid b_TrialArm screen_anemia1 screen_anemia2 screen_anemia3 screen_anemia4 man_anemia1 man_anemia2 man_anemia3 man_anemia4 ///
  success_anemia_1 success_anemia_2 success_anemia_3 success_anemia_4 scanem_qidsms2  scanem_qidsms4 mananem_qidsms2 mananem_qidsms4 ///
  scmananem_qidsms2 scmananem_qidsms4  phase_n  str_TRIAL_2_Cluster clussize lab us

  reshape long screen_anemia man_anemia success_anemia_ scanem_qidsms mananem_qidsms scmananem_qidsms, i(uniqueid) j(timepoint)

  *A (0) vs. B (1)*
  gen AB=0 if b_TrialArm=="A"
  replace AB=1 if b_TrialArm=="B"

  *A (0) vs. C (1)*
  gen AC=0 if b_TrialArm=="A"
  replace AC=1 if b_TrialArm=="C"

  *A (0) vs. D (1)*
  gen AD=0 if b_TrialArm=="A"
  replace AD=1 if b_TrialArm=="D"

  *B (0) vs. C (1)*
  gen BC=0 if b_TrialArm=="B"
  replace BC=1 if b_TrialArm=="C"

  *B (0) vs. D (1)*
  gen BD=0 if b_TrialArm=="B"
  replace BD=1 if b_TrialArm=="D"

  *C (0) vs. D (1)*
  gen CD=0 if b_TrialArm=="C"
  replace CD=1 if b_TrialArm=="D"

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING & MANAGEMENT OF ANEMIA*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.success_anemia_ i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
  }

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF ANEMIA*
  foreach x of local comparisons {
     xi:melogit i.screen_anemia i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
  }

  /*EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF ANEMIA*
  foreach x of local comparisons {
     xi:melogit i.man_anemia i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }


  *EFFECT ESTIMATES FOR OUTCOME: SCREENING & MANAGEMENT OF ANEMIA FOR QID/SMS OUTCOMES*
  foreach x of local comparisons {
     xi:melogit i.scmananem_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }
  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF ANEMIA FOR QID/SMS OUTCOMES*
  foreach x of local comparisons {
     xi:melogit i.scanem_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }

  *EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF ANEMIA FOR QID/SMS OUTCOMES*
  foreach x of local comparisons {
     xi:melogit i.mananem_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }*/
}

 **********************************************************************************************************
*3. HYPERTENSION EFFECT ESTIMATES*
*vars to keep for this analysis*
*cluster size*
frame hypertension {

  gen clussize= str_TRIAL_2_ClusSize/100 if str_TRIAL_2_ClusSize!=.
  label var clussize "cluster size by 100s"
  codebook clussize

  *phase-relabel categories*
  gen phase_n=1 if phase_x=="1"
  replace phase_n=2 if phase_x=="2"
  replace phase_n=3 if phase_x=="2 Gaza"
  label var phase_n "phase"
  codebook phase_n

  gen lab=labavailability_y
  label var lab "lab availability"
  gen us=usavailability_y
  label var us "ultrasound availability"

  *rename vars for reshaping*
  rename screen_hyp2xtra schyp_qidsms2
  rename screen_hyp3xtra schyp_qidsms3
  rename screen_hyp4xtra schyp_qidsms4
  rename screen_hyp5xtra schyp_qidsms5
  rename screen_hyp6xtra schyp_qidsms6

  rename man_hyp2xtra manhyp_qidsms2
  rename man_hyp3xtra manhyp_qidsms3
  rename man_hyp4xtra manhyp_qidsms4
  rename man_hyp5xtra manhyp_qidsms5
  rename man_hyp6xtra manhyp_qidsms6

  rename success_htn_2xtra sucesshyp_qidsms2
  rename success_htn_3xtra sucesshyp_qidsms3
  rename success_htn_4xtra sucesshyp_qidsms4
  rename success_htn_5xtra sucesshyp_qidsms5
  rename success_htn_6xtra sucesshyp_qidsms6

  keep uniqueid b_TrialArm phase_n  str_TRIAL_2_Cluster clussize lab us ///
  screen_hyp1 screen_hyp2 screen_hyp3 screen_hyp4 screen_hyp5 screen_hyp6 ///
  man_hyp1 man_hyp2 man_hyp3 man_hyp4 man_hyp5 man_hyp6 ///
  success_htn_1 success_htn_2 success_htn_3 success_htn_4 success_htn_5 success_htn_6 ///
  schyp_qidsms2 schyp_qidsms3 schyp_qidsms4 schyp_qidsms5 schyp_qidsms6 ///
  manhyp_qidsms2 manhyp_qidsms3 manhyp_qidsms4 manhyp_qidsms5 manhyp_qidsms6 ///
  sucesshyp_qidsms2 sucesshyp_qidsms3 sucesshyp_qidsms4 sucesshyp_qidsms5 sucesshyp_qidsms6

  reshape long screen_hyp man_hyp success_htn_ schyp_qidsms manhyp_qidsms sucesshyp_qidsms, i(uniqueid) j(timepoint)

  *A (0) vs. B (1)*
  gen AB=0 if b_TrialArm=="A"
  replace AB=1 if b_TrialArm=="B"

  *A (0) vs. C (1)*
  gen AC=0 if b_TrialArm=="A"
  replace AC=1 if b_TrialArm=="C"

  *A (0) vs. D (1)*
  gen AD=0 if b_TrialArm=="A"
  replace AD=1 if b_TrialArm=="D"

  *B (0) vs. C (1)*
  gen BC=0 if b_TrialArm=="B"
  replace BC=1 if b_TrialArm=="C"

  *B (0) vs. D (1)*
  gen BD=0 if b_TrialArm=="B"
  replace BD=1 if b_TrialArm=="D"

  *C (0) vs. D (1)*
  gen CD=0 if b_TrialArm=="C"
  replace CD=1 if b_TrialArm=="D"

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING AND MANAGEMENT OF HYPERTENSION*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.success_htn_ i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
  }

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF HYPERTENSION*
  foreach x of local comparisons {
     xi:melogit i.screen_hyp i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
  }

  /*EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF HYPERTENSION*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.man_hyp i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }

  ******************************
   *EFFECT ESTIMATES FOR OUTCOME: SCREENING AND MANAGEMENT OF HYPERTENSION FOR QID/SMS OUTCOMES*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.sucesshyp_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF HYPERTENSION FOR QID/SMS OUTCOMES*
  foreach x of local comparisons {
     xi:melogit i.schyp_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }
  *EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF HYPERTENSION FOR QID/SMS OUTCOMES*
  foreach x of local comparisons {
     xi:melogit i.manhyp_qidsms i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }*/
}

***********************************************************************************************************
*4. GDM EFFECT ESTIMATES*
*vars to keep for this analysis*
*cluster size*
frame gdm {
  gen clussize= str_TRIAL_2_ClusSize/100 if str_TRIAL_2_ClusSize!=.
  label var clussize "cluster size by 100s"
  codebook clussize

  *phase-relabel categories*
  gen phase_n=1 if phase_x=="1"
  replace phase_n=2 if phase_x=="2"
  replace phase_n=3 if phase_x=="2 Gaza"
  label var phase_n "phase"
  codebook phase_n

  gen lab=labavailability_y
  label var lab "lab availability"
  gen us=usavailability_y
  label var us "ultrasound availability"

  *rename vars for reshaping*
  rename screen_gdm2xtra scgdm_qidsms2
  rename man_gdm2xtra mangdm_qidsms2
  rename success_gdm2xtra sucgdm_qidsms2

  keep uniqueid b_TrialArm phase_n  str_TRIAL_2_Cluster clussize lab us ///
  screen_gdm1 screen_gdm2 screen_gdm3 man_gdm1 man_gdm2 man_gdm3 ///
  success_gdm1 success_gdm2 success_gdm3  scgdm_qidsms2 mangdm_qidsms2 sucgdm_qidsms2

  reshape long screen_gdm man_gdm success_gdm scgdm_qidsms mangdm_qidsms sucgdm_qidsms, i(uniqueid) j(timepoint)

  *A (0) vs. B (1)*
  gen AB=0 if b_TrialArm=="A"
  replace AB=1 if b_TrialArm=="B"

  *A (0) vs. C (1)*
  gen AC=0 if b_TrialArm=="A"
  replace AC=1 if b_TrialArm=="C"

  *A (0) vs. D (1)*
  gen AD=0 if b_TrialArm=="A"
  replace AD=1 if b_TrialArm=="D"

  *B (0) vs. C (1)*
  gen BC=0 if b_TrialArm=="B"
  replace BC=1 if b_TrialArm=="C"

  *B (0) vs. D (1)*
  gen BD=0 if b_TrialArm=="B"
  replace BD=1 if b_TrialArm=="D"

  *C (0) vs. D (1)*
  gen CD=0 if b_TrialArm=="C"
  replace CD=1 if b_TrialArm=="D"

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING AND MANAGEMENT OF GDM*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.success_gdm i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }
  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF GDM*
  foreach x of local comparisons {
     xi:melogit i.screen_gdm i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }
  /*EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF GDM*
  foreach x of local comparisons {
     xi:melogit i.man_gdm i.`x' i.phase_n i.us i.lab clussize  || uniqueid:, or vce(cluster str_TRIAL_2_Cluster)
                 }
  ******************************
  *EFFECT ESTIMATES FOR OUTCOME: SCREENING AND MANAGEMENT OF GDM FOR QID/SMS OUTCOMES*
  *this outcome was assesed only once*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.sucgdm_qidsms i.`x' i.phase_n i.us i.lab clussize,or vce(cluster str_TRIAL_2_Cluster)
                 }

  *EFFECT ESTIMATES FOR OUTCOME: SCREENING OF GDM FOR QID/SMS OUTCOMES*
  *this outcome was assesed only once*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.scgdm_qidsms i.`x' i.phase_n i.us i.lab clussize, or vce(cluster str_TRIAL_2_Cluster)
                 }

  *EFFECT ESTIMATES FOR OUTCOME: MANAGEMENT OF GDM FOR QID/SMS OUTCOMES*
  *this outcome was assesed only once*
  local comparisons "AB AC AD BC BD CD"
  foreach x of local comparisons {
     xi:melogit i.mangdm_qidsms i.`x' i.phase_n i.us i.lab clussize, or vce(cluster str_TRIAL_2_Cluster)
                 }*/
}
