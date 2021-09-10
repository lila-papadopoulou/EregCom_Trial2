************SCREENING & MANAGEMENT************************************************
***********************************************************************************
*anemia-screening & managememt at 3 time points: before 24 weeks, 24-28 weeks, 36 weeks*
*success is defined as (management==Successful|severe anemia==1 OR mild anemia==1) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *

*time point: <24 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23*
codebook T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23

*screening only*
gen screen_anemia1=0 if T2_Oppt_anemia_00_23=="Successful" 
replace screen_anemia1=1 if T2_Oppt_anemia_00_23=="Successful" & T2_screeniningontime_anem_00_23=="Successful" 
tab screen_anemia1 b_TrialArm,  col chi
tab screen_anemia1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*management only*
gen man_anemia1=0 if T2_Oppt_anemia_00_23=="Successful" & T2_screeniningontime_anem_00_23=="Successful" & T2_screeniningontime_n_nm_00_23=="Not Successful"
replace man_anemia1=1 if T2_Oppt_anemia_00_23=="Successful" & T2_screeniningontime_anem_00_23=="Successful" & T2_screeniningontime_n_nm_00_23=="Not Successful" & (T2_mansevanemia_00_23=="Successful" | T2_manmilmodane_00_23=="Successful")
tab man_anemia1 b_TrialArm,  col chi
tab man_anemia1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

generate success_anemia_1=0 if T2_Oppt_anemia_00_23=="Successful"
replace success_anemia_1=1 if (T2_mansevanemia_00_23=="Successful" | T2_manmilmodane_00_23=="Successful" |T2_screeniningontime_n_nm_00_23=="Successful") & T2_Oppt_anemia_00_23=="Successful"
tab success_anemia_1 b_TrialArm,  col chi
tab success_anemia_1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*time point: 24-28 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_24_28 T2_screeniningontime_anem_24_28 T2_screeniningontime_n_nm_24_28 T2_manmildmodanemia_24_28 T2_mansevanemia_24_28*
codebook T2_Oppt_anemia_24_28 T2_screeniningontime_anem_24_28 T2_screeniningontime_n_nm_24_28 T2_manmildmodanemia_24_28 T2_mansevanemia_24_28

*screening only*
gen screen_anemia2=0 if T2_Oppt_anemia_24_28=="Successful" 
replace screen_anemia2=1 if T2_Oppt_anemia_24_28=="Successful" & T2_screeniningontime_anem_24_28=="Successful" 
tab screen_anemia2 b_TrialArm,  col chi
tab screen_anemia2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_anemia2=0 if T2_Oppt_anemia_24_28=="Successful" & T2_screeniningontime_anem_24_28=="Successful" & T2_screeniningontime_n_nm_24_28=="Not Successful"
replace man_anemia2=1 if T2_Oppt_anemia_24_28=="Successful" & T2_screeniningontime_anem_24_28=="Successful" & T2_screeniningontime_n_nm_24_28=="Not Successful" & (T2_manmildmodanemia_24_28=="Successful" | T2_mansevanemia_24_28=="Successful")
tab man_anemia2 b_TrialArm,  col chi
tab man_anemia2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_anemia_2=0 if T2_Oppt_anemia_24_28=="Successful"
replace success_anemia_2=1 if (T2_mansevanemia_24_28=="Successful" | T2_manmildmodanemia_24_28=="Successful" |T2_screeniningontime_n_nm_24_28=="Successful") & T2_Oppt_anemia_24_28=="Successful"
tab success_anemia_2 b_TrialArm,  col chi
tab success_anemia_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*time point 29-34 weeks*
codebook T2_Oppt_anemia_29_34 T2_screeniningontime_anem_29_34 T2_screeniningontime_n_nm_29_34 T2_mansevanemia_29_34

*screening only*
gen screen_anemia3=0 if T2_Oppt_anemia_29_34=="Successful" 
replace screen_anemia3=1 if T2_Oppt_anemia_29_34=="Successful" & T2_screeniningontime_anem_29_34=="Successful" 
tab screen_anemia3 b_TrialArm,  col chi
tab screen_anemia3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_anemia3=0 if T2_Oppt_anemia_29_34=="Successful" & T2_screeniningontime_anem_29_34=="Successful" & T2_screeniningontime_n_nm_29_34=="Not Successful"
replace man_anemia3=1 if T2_Oppt_anemia_29_34=="Successful" & T2_screeniningontime_anem_29_34=="Successful" & T2_screeniningontime_n_nm_29_34=="Not Successful" & T2_mansevanemia_29_34=="Successful"
tab man_anemia3 b_TrialArm,  col chi
tab man_anemia3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_anemia_3=0 if T2_Oppt_anemia_29_34=="Successful"
replace success_anemia_3=1 if (T2_mansevanemia_29_34=="Successful"|T2_screeniningontime_n_nm_29_34=="Successful") & T2_Oppt_anemia_29_34=="Successful"
tab success_anemia_3 b_TrialArm,  col chi
tab success_anemia_3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*time point: 36 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37  T2_mansevanemia_35_37*
codebook T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37 T2_screeniningontime_anem_35_37 T2_mansevanemia_35_37

*screening only*
gen screen_anemia4=0 if T2_Oppt_anemia_35_37=="Successful" 
replace screen_anemia4=1 if T2_Oppt_anemia_35_37=="Successful" & T2_screeniningontime_anem_35_37=="Successful" 
tab screen_anemia4 b_TrialArm,  col chi
tab screen_anemia4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

gen man_anemia4=0 if T2_Oppt_anemia_35_37=="Successful" & T2_screeniningontime_anem_35_37=="Successful"
replace man_anemia4=1 if T2_Oppt_anemia_35_37=="Successful" & T2_screeniningontime_anem_35_37=="Successful" & T2_mansevanemia_35_37=="Successful"
tab man_anemia4 b_TrialArm,  col chi
tab man_anemia4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_anemia_4=0 if T2_Oppt_anemia_35_37=="Successful"
replace success_anemia_4=1 if (T2_mansevanemia_35_37=="Successful" | T2_screeniningontime_anem_35_37=="Successful") & T2_Oppt_anemia_35_37=="Successful"
tab success_anemia_4 b_TrialArm,  col chi
tab success_anemia_4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi
******************************************************************************************************
*QID/SMS specific variables*
*24-28 weeks*
codebook T2_qidsms_Oppt_anemia_24_28 T2_qidsms_screennngntm_nm_24_28 T2_qidsms_scrnnngntm_n_nm_24_28 T2_qidsms_manmildmodanemi_24_28 T2_qidsms_mansevanemia_24_28 

*screening only*
gen screen_anemia2xtra=0 if T2_qidsms_Oppt_anemia_24_28=="Successful" 
replace screen_anemia2xtra=1 if T2_qidsms_Oppt_anemia_24_28=="Successful" & T2_qidsms_screennngntm_nm_24_28=="Successful" 
tab screen_anemia2xtra b_TrialArm,  col chi
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_anemia2xtra=0 if T2_qidsms_Oppt_anemia_24_28=="Successful" & T2_qidsms_screennngntm_nm_24_28=="Successful" & T2_qidsms_scrnnngntm_n_nm_24_28=="Not Successful"
replace man_anemia2xtra=1 if T2_qidsms_Oppt_anemia_24_28=="Successful" & T2_qidsms_screennngntm_nm_24_28=="Successful" & T2_qidsms_scrnnngntm_n_nm_24_28=="Not Successful" & (T2_qidsms_manmildmodanemi_24_28=="Successful" | T2_qidsms_mansevanemia_24_28=="Successful")
tab man_anemia2xtra b_TrialArm,  col chi
tab man_anemia2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_anemia_2xtra=0 if T2_qidsms_Oppt_anemia_24_28=="Successful"
replace success_anemia_2xtra=1 if (T2_qidsms_mansevanemia_24_28=="Successful" | T2_qidsms_manmildmodanemi_24_28=="Successful" | T2_qidsms_scrnnngntm_n_nm_24_28=="Successful") & T2_qidsms_Oppt_anemia_24_28=="Successful"
tab success_anemia_2xtra b_TrialArm,  col chi
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*35-37 weeks*
codebook T2_qidsms_Oppt_anemia_35_37 T2_qidsms_screennngntm_nm_35_37 T2_qidsms_mansevanemia_35_37

*screening only*
gen screen_anemia4xtra=0 if T2_qidsms_Oppt_anemia_35_37=="Successful" 
replace screen_anemia4xtra=1 if T2_qidsms_Oppt_anemia_35_37=="Successful" & T2_qidsms_screennngntm_nm_35_37=="Successful" 
tab screen_anemia4xtra b_TrialArm,  col chi
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_anemia4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi



generate success_anemia_4xtra=0 if T2_qidsms_Oppt_anemia_35_37=="Successful"
replace success_anemia_4xtra=1 if ( T2_qidsms_mansevanemia_35_37=="Successful" | T2_qidsms_screennngntm_nm_35_37=="Successful") & T2_qidsms_Oppt_anemia_35_37=="Successful"
tab success_anemia_4xtra b_TrialArm,  col chi
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*calculate the overall success for anemia-on the basis of the whole population*
gen totalsucc_anemia=0 
replace totalsucc_anemia=1 if success_anemia_1==1 & success_anemia_2==1 & success_anemia_3==1 

*calculate the sum of success for anemia*
egen sumsuc_anemia=rowotal (success_anemia_1 success_anemia_2 success_anemia_3) 
tab sumsuc_anemia
*see issue #3*
*******************************************************************************************************************************
*HYPERTENSION*
*BP -screening & hypertensions managememt before 20 weeks:Blood pressure prior to 20 weeks’ gestation, test at the first visit
and at 16, 18–22 weeks’ gestation*
*after 20 weeks: Blood pressure at or after 20 weeks’ gestation, test at 18–22, 24–28, and 36 weeks’ gestation*

*success is defined as (management==Successful|severe htn==1 OR mild htn==1 OR chronic htn) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *
codebook T2_Oppt_bp_00_14 T2_bpontime_00_14 T2_Oppt_bp_15_17 T2_bpontime_15_17 T2_Oppt_bp_18_22 T2_bpontime_18_22 /// 
T2_Oppt_bp_24_28 T2_bpontime_24_28 T2_Oppt_bp_35_37 T2_bpontime_35_37
codebook T2_manchronichtn_00_14 T2_manchronichtn_15_17 T2_manchronichtn_18_22 T2_manmildhtn_24_28 T2_manmodsevhtn_24_28 ///
T2_manmildhtn_35_37 T2_manmodsevhtn_35_37

*0-14 weeks*
codebook T2_Oppt_bp_00_14 T2_bpontime_00_14 T2_manchronichtn_00_14
*screening only*
gen screen_hyp1=0 if T2_Oppt_bp_00_14=="Successful"
replace screen_hyp1=1 if T2_Oppt_bp_00_14=="Successful" & T2_bpontime_00_14=="Successful"
tab screen_hyp1 b_TrialArm,  col chi
tab screen_hyp1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp1=0 if T2_Oppt_bp_00_14=="Successful" & T2_bpontime_00_14=="Successful" & T2_manchronichtn_00_14!="Not Applicable"
replace man_hyp1=1 if T2_Oppt_bp_00_14=="Successful" & T2_bpontime_00_14=="Successful" & T2_manchronichtn_00_14=="Successful"
tab man_hyp1 b_TrialArm,  col chi
tab man_hyp1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
gen success_htn_1=0  if T2_Oppt_bp_00_14=="Successful"
replace success_htn_1=1 if (T2_manchronichtn_00_14=="Successful" & T2_Oppt_bp_00_14=="Successful" & T2_bpontime_00_14=="Successful") | (T2_bpontime_00_14=="Successful" & T2_manchronichtn_00_14=="Not Applicable" & T2_Oppt_bp_00_14=="Successful")
tab success_htn_1 b_TrialArm,  col chi
tab success_htn_1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*15-17 weeks*
codebook T2_Oppt_bp_15_17 T2_bpontime_15_17 T2_manchronichtn_15_17
*screening only*
gen screen_hyp2=0 if T2_Oppt_bp_15_17=="Successful"
replace screen_hyp2=1 if T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful"
tab screen_hyp2 b_TrialArm,  col chi
tab screen_hyp2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp2=0 if T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful" & T2_manchronichtn_15_17!="Not Applicable"
replace man_hyp2=1 if T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful" & T2_manchronichtn_15_17=="Successful"
tab man_hyp2 b_TrialArm,  col chi
tab man_hyp2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_htn_2=0 if T2_Oppt_bp_15_17=="Successful"
replace success_htn_2=1 if (T2_manchronichtn_15_17=="Successful" & T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful") | (T2_bpontime_15_17=="Successful" & T2_manchronichtn_15_17=="Not Applicable" & T2_Oppt_bp_15_17=="Successful")
tab success_htn_2 b_TrialArm,  col chi
tab success_htn_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*18-22 weeks*
codebook T2_Oppt_bp_18_22 T2_bpontime_18_22 T2_manchronichtn_18_22
gen screen_hyp3=0 if T2_Oppt_bp_18_22=="Successful"
replace screen_hyp3=1 if T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful"
tab screen_hyp3 b_TrialArm,  col chi
tab screen_hyp3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp3=0 if T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful" & T2_manchronichtn_18_22!="Not Applicable"
replace man_hyp3=1 if T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful" & T2_manchronichtn_18_22=="Successful"
tab man_hyp3 b_TrialArm,  col chi
tab man_hyp3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_3=0 if T2_Oppt_bp_18_22=="Successful"
replace success_htn_3=1 if (T2_manchronichtn_18_22=="Successful" & T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful") | (T2_bpontime_18_22=="Successful" & T2_manchronichtn_18_22=="Not Applicable" & T2_Oppt_bp_18_22=="Successful")
tab success_htn_3 b_TrialArm,  col chi
tab success_htn_3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*24-28 weeks*
codebook T2_Oppt_bp_24_28 T2_bpontime_24_28 T2_manmildhtn_24_28 T2_manmodsevhtn_24_28
gen screen_hyp4=0 if T2_Oppt_bp_24_28=="Successful"
replace screen_hyp4=1 if T2_Oppt_bp_24_28=="Successful" & T2_bpontime_24_28=="Successful"
tab screen_hyp4 b_TrialArm,  col chi
tab screen_hyp4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp4=0 if T2_Oppt_bp_24_28=="Successful" & T2_bpontime_24_28=="Successful" & (T2_manmildhtn_24_28!="Not Applicable"|T2_manmodsevhtn_24_28!="Not Applicable")
replace man_hyp4=1 if T2_Oppt_bp_24_28=="Successful" & T2_bpontime_24_28=="Successful" & (T2_manmildhtn_24_28=="Successful"|T2_manmodsevhtn_24_28=="Successful")
tab man_hyp4 b_TrialArm,  col chi
tab man_hyp4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_4=0 if T2_Oppt_bp_24_28=="Successful"
replace success_htn_4=1 if (T2_manmildhtn_24_28=="Successful" & T2_Oppt_bp_24_28=="Successful" & T2_bpontime_24_28=="Successful") |(T2_manmodsevhtn_24_28=="Successful" & T2_Oppt_bp_24_28=="Successful" & T2_bpontime_24_28=="Successful") | (T2_bpontime_24_28=="Successful" &  T2_Oppt_bp_24_28=="Successful" & (T2_manmildhtn_24_28=="Not Applicable" | T2_manmodsevhtn_24_28=="Not Applicable"))
tab success_htn_4 b_TrialArm,  col chi
tab success_htn_4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*31-33 weeks*
codebook T2_Oppt_bp_31_33 T2_bpontime_31_33 T2_manmildhtn_31_33 T2_manmodsevhtn_31_33
*screening only*
gen screen_hyp5=0 if T2_Oppt_bp_31_33=="Successful"
replace screen_hyp5=1 if T2_Oppt_bp_31_33=="Successful" & T2_bpontime_31_33=="Successful"
tab screen_hyp5 b_TrialArm,  col chi
tab screen_hyp5 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp5=0 if T2_Oppt_bp_31_33=="Successful" & T2_bpontime_31_33=="Successful" & (T2_manmildhtn_31_33!="Not Applicable"|T2_manmodsevhtn_31_33!="Not Applicable")
replace man_hyp5=1 if T2_Oppt_bp_31_33=="Successful" & T2_bpontime_31_33=="Successful" & (T2_manmildhtn_31_33=="Successful"|T2_manmodsevhtn_31_33=="Successful")
tab man_hyp5 b_TrialArm,  col chi
tab man_hyp5 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_5=0 if T2_Oppt_bp_31_33=="Successful" 
replace success_htn_5=1 if (T2_manmildhtn_31_33=="Successful" & T2_Oppt_bp_31_33=="Successful" & T2_bpontime_31_33=="Successful") |   /* 
  */ (T2_manmodsevhtn_31_33=="Successful" & T2_Oppt_bp_31_33=="Successful" & T2_bpontime_31_33=="Successful") |   /*
 */  (T2_bpontime_31_33=="Successful" &  T2_Oppt_bp_31_33=="Successful" & (T2_manmildhtn_31_33=="Not Applicable" | T2_manmodsevhtn_31_33=="Not Applicable"))
tab success_htn_5 b_TrialArm,  col chi
tab success_htn_5 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*35-37 weeks*
codebook T2_Oppt_bp_35_37 T2_bpontime_35_37 T2_manmildhtn_35_37 T2_manmodsevhtn_35_37
*screening only*
gen screen_hyp6=0 if T2_Oppt_bp_35_37=="Successful"
replace screen_hyp6=1 if T2_Oppt_bp_35_37=="Successful" & T2_bpontime_35_37=="Successful"
tab screen_hyp6 b_TrialArm,  col chi
tab screen_hyp6 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp6=0 if T2_Oppt_bp_35_37=="Successful" & T2_bpontime_35_37=="Successful" & (T2_manmildhtn_35_37!="Not Applicable"|T2_manmodsevhtn_35_37!="Not Applicable")
replace man_hyp6=1 if T2_Oppt_bp_35_37=="Successful" & T2_bpontime_35_37=="Successful" & (T2_manmildhtn_35_37=="Successful"|T2_manmodsevhtn_35_37=="Successful")
tab man_hyp6 b_TrialArm,  col chi
tab man_hyp6 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_6=0 if T2_Oppt_bp_35_37=="Successful" 
replace success_htn_6=1 if (T2_manmildhtn_35_37=="Successful" & T2_Oppt_bp_35_37=="Successful" & T2_bpontime_35_37=="Successful") |   /* 
  */ (T2_manmodsevhtn_35_37=="Successful" & T2_Oppt_bp_35_37=="Successful" & T2_bpontime_35_37=="Successful") |   /*
 */  (T2_bpontime_35_37=="Successful" &  T2_Oppt_bp_35_37=="Successful" & (T2_manmildhtn_35_37=="Not Applicable" | T2_manmodsevhtn_35_37=="Not Applicable"))
tab success_htn_6 b_TrialArm,  col chi
tab success_htn_6 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi
****************************HERE****************


*extar variables for specific trial arm-15-17 weeks*
codebook T2_qidsms_Oppt_bp_15_17 T2_qidsms_bpontime_15_17 T2_qidsms_manchronichtn_15_17

generate success_htn_2xtra=0 if T2_qidsms_Oppt_bp_15_17=="Successful"
replace success_htn_2xtra=1 if (T2_qidsms_manchronichtn_15_17=="Successful" & T2_qidsms_Oppt_bp_15_17=="Successful") | (T2_qidsms_bpontime_15_17=="Successful" & T2_qidsms_manchronichtn_15_17=="Not Applicable" & T2_qidsms_Oppt_bp_15_17=="Successful")
tab success_htn_2xtra b_TrialArm,  col chi
tab success_htn_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*extar variables for specific trial arm-18-22 weeks*
codebook T2_qidsms_Oppt_bp_18_22 T2_qidsms_bpontime_18_22 T2_qidsms_manchronichtn_18_22

generate success_htn_3xtra=0 if T2_qidsms_Oppt_bp_18_22=="Successful"
replace success_htn_3xtra=1 if (T2_qidsms_manchronichtn_18_22=="Successful" & T2_qidsms_Oppt_bp_18_22=="Successful") | (T2_qidsms_bpontime_18_22=="Successful" & T2_qidsms_manchronichtn_18_22=="Not Applicable" & T2_qidsms_Oppt_bp_18_22=="Successful")
tab success_htn_3xtra b_TrialArm,  col chi
tab success_htn_3xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi



*extar variables for specific trial arm-24-28 weeks*
codebook T2_qidsms_Oppt_bp_24_28 T2_qidsms_bpontime_24_28 T2_qidsms_manmildhtn_24_28 T2_qidsms_manmodsevhtn_24_28

generate success_htn_4xtra=0 if T2_qidsms_Oppt_bp_24_28=="Successful"
replace success_htn_4xtra=1 if (T2_qidsms_manmildhtn_24_28=="Successful" & T2_qidsms_Oppt_bp_24_28=="Successful") |(T2_qidsms_manmodsevhtn_24_28=="Successful" & T2_qidsms_Oppt_bp_24_28=="Successful") | (T2_qidsms_bpontime_24_28=="Successful" & T2_qidsms_manmildhtn_24_28=="Not Applicable" & T2_qidsms_manmodsevhtn_24_28=="Not Applicable" & T2_qidsms_Oppt_bp_24_28=="Successful")
tab success_htn_4xtra b_TrialArm,  col chi
tab success_htn_4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*31-33 weks*
codebook T2_Oppt_bp_31_33 T2_bpontime_31_33 T2_manmildhtn_31_33 T2_manmodsevhtn_31_33
generate success_htn_5=0 if T2_Oppt_bp_31_33=="Successful"
replace success_htn_5=1 if (T2_manmildhtn_31_33=="Successful" & T2_Oppt_bp_31_33=="Successful") |(T2_manmodsevhtn_31_33=="Successful" & T2_Oppt_bp_31_33=="Successful") | (T2_bpontime_31_33=="Successful" & T2_manmildhtn_31_33=="Not Applicable" & T2_manmodsevhtn_31_33=="Not Applicable" & T2_Oppt_bp_31_33=="Successful")
tab success_htn_5 b_TrialArm,  col chi
tab success_htn_5 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*xtra vars*
codebook T2_qidsms_Oppt_bp_31_33 T2_qidsms_bpontime_31_33 T2_qidsms_manmildhtn_31_33 T2_qidsms_manmodsevhtn_31_33
generate success_htn_5xtra=0 if T2_qidsms_Oppt_bp_31_33=="Successful"
replace success_htn_5xtra=1 if (T2_qidsms_manmildhtn_31_33=="Successful" & T2_qidsms_Oppt_bp_31_33=="Successful") |(T2_qidsms_manmodsevhtn_31_33=="Successful" & T2_qidsms_Oppt_bp_31_33=="Successful") | (T2_qidsms_bpontime_31_33=="Successful" & T2_qidsms_manmildhtn_31_33=="Not Applicable" & T2_qidsms_manmodsevhtn_31_33=="Not Applicable" & T2_qidsms_Oppt_bp_31_33=="Successful")
tab success_htn_5xtra b_TrialArm,  col chi
tab success_htn_5xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi


*36 weeks*
codebook T2_Oppt_bp_35_37 T2_bpontime_35_37 T2_manmildhtn_35_37 T2_manmodsevhtn_35_37

generate success_htn_6=0 if T2_Oppt_bp_35_37=="Successful"
replace success_htn_6=1 if (T2_manmildhtn_35_37=="Successful" & T2_Oppt_bp_35_37=="Successful") |(T2_manmodsevhtn_35_37=="Successful" & T2_Oppt_bp_35_37=="Successful") | (T2_bpontime_35_37=="Successful" & T2_manmildhtn_35_37=="Not Applicable" & T2_manmodsevhtn_35_37=="Not Applicable" & T2_Oppt_bp_35_37=="Successful")
tab success_htn_6 b_TrialArm,  col chi
tab success_htn_6 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*extar variables for specific trial arm-36 weeks*
codebook T2_qidsms_Oppt_bp_35_37 T2_qidsms_bpontime_35_37 T2_qidsms_manmildhtn_35_37 T2_qidsms_manmodsevhtn_35_37

generate success_htn_6xtra=0 if T2_qidsms_Oppt_bp_35_37=="Successful"
replace success_htn_6xtra=1 if (T2_qidsms_manmildhtn_35_37=="Successful" & T2_qidsms_Oppt_bp_35_37=="Successful") |(T2_qidsms_manmodsevhtn_35_37=="Successful" & T2_qidsms_Oppt_bp_35_37=="Successful") | (T2_qidsms_bpontime_35_37=="Successful" & T2_qidsms_manmildhtn_35_37=="Not Applicable" & T2_qidsms_manmodsevhtn_35_37=="Not Applicable" & T2_qidsms_Oppt_bp_35_37=="Successful")
tab success_htn_6xtra b_TrialArm,  col chi
tab success_htn_6xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

**********GEST DIABETES****
*screening &  managememt before 24 weeks & 24-28 WEEKS*

*before 24 weeks*
codebook T2_Opportunity_GDM_scrnng_b4_24 T2_GDMscreeningontime_b4_24 T2_GDMscreeningontim_b4_24_nrml T2_GDMscreeningontm_b4_24_psrgl  

generate success_gdm_1=0 if T2_Opportunity_GDM_scrnng_b4_24=="Successful"
replace success_gdm_1=1 if (T2_GDMscreeningontim_b4_24_nrml=="Successful"| T2_GDMscreeningontm_b4_24_psrgl=="Successful") & T2_Opportunity_GDM_scrnng_b4_24=="Successful"
tab success_gdm_1 b_TrialArm,  col chi
tab success_gdm_1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_gdm_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_gdm_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_gdm_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_gdm_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_gdm_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*24-28 weeks*
codebook T2_Opportunity_GDM_scrnng_24_28 T2_GDMscreeningontime_24_28 T2_GDMscreeningontim_24_28_nrml T2_GDMscreeningntm_24_28_hghrbg T2_GDMscreeningontm_24_28_ntmbg
generate success_gdm_2=0 if T2_Opportunity_GDM_scrnng_24_28=="Successful"
replace success_gdm_2=1 if (T2_GDMscreeningontim_24_28_nrml=="Successful"| T2_GDMscreeningntm_24_28_hghrbg=="Successful"|T2_GDMscreeningontm_24_28_ntmbg=="Successful" ) & T2_Opportunity_GDM_scrnng_24_28=="Successful"
tab success_gdm_2 b_TrialArm,  col chi
tab success_gdm_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_gdm_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_gdm_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*xtra vars*
codebook T2_qdsms_Opprtnty_GDM_scr_24_28 T2_qidsms_GDMscreeningntm_24_28 T2_qdsms_GDMscrnngntm_24_28_nrm T2_qdsms_GDMscrnngntm_24_28_hgh T2_qdsms_GDMscrnngntm_24_28_ntm
generate success_gdm_2xtra=0 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful"
replace success_gdm_2xtra=1 if (T2_qdsms_GDMscrnngntm_24_28_nrm=="Successful"| T2_qdsms_GDMscrnngntm_24_28_hgh=="Successful"|T2_qdsms_GDMscrnngntm_24_28_ntm=="Successful" ) & T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful"
tab success_gdm_2xtra b_TrialArm,  col chi
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_gdm_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*after 28 weeks*
codebook T2_Opportunty_GDM_scrnng_ftr_28 T2_GDMscreeningontime_after_28 T2_GDMscreeningontm_ftr_28_nrml T2_GDMscreeningontim_ftr_28_hgh
generate success_gdm_3=0 if T2_Opportunty_GDM_scrnng_ftr_28=="Successful"
replace success_gdm_3=1 if (T2_GDMscreeningontm_ftr_28_nrml=="Successful"| T2_GDMscreeningontim_ftr_28_hgh=="Successful") & T2_Opportunty_GDM_scrnng_ftr_28=="Successful"
tab success_gdm_3 b_TrialArm,  col chi
tab success_gdm_3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_gdm_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_gdm_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_gdm_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_gdm_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_gdm_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi
