version 16.1

*1.ATTENDANCE EFFECT ESTIMATES*
*vars to keep for this analysis*
*cluster size*
frame attendance {
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
