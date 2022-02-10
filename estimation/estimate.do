version 16.1

// Specify the model, which is parameterized in terms of the outcome (y),
// comparison, any additional fixed effects (fixed), and random effects (random).
local fe    i.phase_n i.us i.lab clussize
local vce   vce(cluster str_TRIAL_2_Cluster)
local model melogit \`y' i.\`comparison' `fe' \`fixed' \`random', or `vce'

// Specify the comparisons.
local comparisons   AB AC AD BC BD CD

// Specify the data frames and their outcomes.
local attendance_outcomes                            att
local anemia_outcomes                                success_anemia_  screen_anemia
local anemia_outcomes       `anemia_outcomes'        man_anemia       scmananem_qidsms
local anemia_outcomes       `anemia_outcomes'        scmananem_qidsms scanem_qidsms
local anemia_outcomes       `anemia_outcomes'        mananem_qidsms
local hypertension_outcomes                          success_htn_     screen_hyp man_hyp
local hypertension_outcomes `hypertension_outcomes'  sucesshyp_qidsms schyp_qidsms
local hypertension_outcomes `hypertension_outcomes'  manhyp_qidsms
local gdm_outcomes                                   success_gdm      screen_gdm
local gdm_outcomes          `gdm_outcomes'           man_gdm

// Specify outcomes that do not require a random effect for uniqueid.
local no_random man_anemia mananem_qidsms manhyp_qidsms

// Specify the outcomes that should be modelled using an *additional* fixed
// effect for timepoint.
foreach x in man_anemia mananem_qidsms manhyp_qidsms {
  local `x'_fixed i.timepoint
}

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
