*baseline characteristics*

*woman's age at study entry*
tab agecat TrialArm,  mis col chi

*parity*
gen parity=0 if para==0 & para!=.
replace parity=1 if para!=0 & para!=.
tab parity para
tab parity TrialArm,  col chi mis

*income*
tab avgincomecat TrialArm,  col chi mis

education*
tab educationcat TrialArm,  col chi mis

*age at 1st pregnancy*
tab agepregnancycat TrialArm,  mis col chi

*BMI at booking visit*
tab bookbmicat TrialArm,  col chi mis

*gestational age at booking visit*
bookgestagedays_cats

*diabetes 2*
tab bookhistdm TrialArm,  col chi mis

*obstestric history among those who have been pregnant before: gravidity=1*
gen gravidity=0 if gravida==1 & gravida!=.
replace gravidity=1 if gravida!=1 & gravida!=.
tab gravidity gravida

*c-section*
tab bookhistcs TrialArm if gravidity==1,  col chi mis

*gestational diabetes*
tab bookhistgdm TrialArm if gravidity==1,  col chi mis

*perinatal death*
tab bookhistperi TrialArm if gravidity==1,  col chi mis

*postpartum hemor.*
tab bookhistpph TrialArm if gravidity==1,  col chi mis

*antepartum hemoreg.*
tab bookhistaph TrialArm if gravidity==1,  col chi mis

*spontaneous miscarriage*
tab bookhistabort TrialArm if gravidity==1,  col chi mis

*pre-eclampsia*
tab bookhistpreecl TrialArm if gravidity==1,  col chi mis
