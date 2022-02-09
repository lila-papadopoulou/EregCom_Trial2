version 16.1

// Specify the model, which is parameterized in terms of the outcome (y),
// comparison, any additional fixed effects (fixed), and random effects (random).
local fe    i.phase_n i.us i.lab clussize
local vce   vce(cluster str_TRIAL_2_Cluster)
local model xi: melogit i.\`y' i.\`comparison' `fe' \`fixed' \`random', or `vce'

// Specify the comparisons.
local comparisons   AB AC AD BC BD CD

// Specify the data frames and their outcomes.
local attendance_outcomes   att
local anemia_outcomes       success_anemia_ screen_anemia man_anemia
local hypertension_outcomes success_htn_    screen_hyp
local gdm_outcomes          success_gdm     screen_gdm

// Specify outcomes that do not require a random effect for uniqueid.
local no_random man_anemia

// Specify *additional* fixed effects for certain outcomes.
local man_anemia_fixed i.timepoint

// Run the analyses.
foreach frame of global frames {
  frame `frame' {
    foreach y of local `frame'_outcomes {
      disp "{hline}"
      disp "{title:Analyzing `y' (`: data label')}" // Log the outcome.

      // Get the additional fixed effects for this outcome, if there are any.
      local fixed "" // Ensure that the macro is initially empty!
      local fixed ``y'_fixed'

      // Specify the random effect variable for this outcome.
      local random || uniqueid: // Model clustering within woman...
      if strpos("`no_random'", "`y'") local random "" // ... unless we should not.

      foreach comparison of local comparisons {
        `model' // Run the analysis.
        disp "The above estimates were produced using `e(cmdline)'"
        disp "{hline}"
      }
    }
  }
}

exit // TODO: Do not run any code after this point - See the note below

// NOTE: The follwoing analyses are retained so that we do not lose the names
// of the dependent variables for the models that cannot yet be fitted. When we
// are happy with the model specification we can add the "missing" dependent
// variables to the local macros that specify the outcomes and the delete
// the exit command and everything that follows.

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
