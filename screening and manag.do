************SCREENING & MANAGEMENT************************************************
***********************************************************************************
*anemia-screening & managememt at 3 time points: before 24 weeks, 24-28 weeks, 36 weeks*
*success is defined as (management==Successful|severe anemia==1 OR mild anemia==1) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *

*time point: <24 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23*
codebook T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23

generate success_anemia_1=0 if T2_Oppt_anemia_00_23==2
replace success_anemia_1=1 if (T2_mansevanemia_00_23==2 | T2_manmilmodane_00_23==3 |T2_screeniningontime_n_nm_00_23==3) & T2_Oppt_anemia_00_23==2
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

generate success_anemia_2=0 if T2_Oppt_anemia_24_28==3
replace success_anemia_2=1 if (T2_mansevanemia_24_28==3 | T2_manmildmodanemia_24_28==3 |T2_screeniningontime_n_nm_24_28==3) & T2_Oppt_anemia_24_28==3
tab success_anemia_2 b_TrialArm,  col chi
tab success_anemia_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*time point: 36 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37 T2_screeniningontime_nm_35_37_1 T2_mansevanemia_35_37*
codebook T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37 T2_screeniningontime_nm_35_37_1 T2_mansevanemia_35_37

generate success_anemia_3=0 if T2_Oppt_anemia_35_37==3
replace success_anemia_3=1 if (T2_mansevanemia_35_37==3 | T2_screeniningontime_nm_35_37_1==3) & T2_Oppt_anemia_35_37==3
tab success_anemia_3 b_TrialArm,  col chi
tab success_anemia_3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*variables related to specific trial arms*
codebook T2_qidsms_Oppt_anemia_24_28 T2_qidsms_manmildmodanemi_24_28 T2_qidsms_mansevanemia_24_28 

generate success_anemia_2xtra=0 if T2_qidsms_Oppt_anemia_24_28==3
replace success_anemia_2xtra=1 if (T2_qidsms_manmildmodanemi_24_28==3 | T2_qidsms_mansevanemia_24_28==3 | T2_qidsms_scrnnngntm_n_nm_24_28==3) & T2_qidsms_Oppt_anemia_24_28==3
tab success_anemia_2xtra b_TrialArm,  col chi
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi


codebook T2_qidsms_Oppt_anemia_35_37 T2_qidsms_screennngntm_nm_35_37 T2_qidsms_mansevanemia_35_37
generate success_anemia_3xtra=0 if T2_qidsms_Oppt_anemia_35_37==3
replace success_anemia_3xtra=1 if ( T2_qidsms_mansevanemia_35_37==3 | T2_qidsms_screennngntm_nm_35_37==3) & T2_qidsms_Oppt_anemia_35_37==3
tab success_anemia_3xtra b_TrialArm,  col chi
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*calculate the overall success for anemia-on the basis of the whole population*
gen totalsucc_anemia=0 
replace totalsucc_anemia=1 if success_anemia_1==1 & success_anemia_2==1 & success_anemia_3==1 

*calculate the sum of success for anemia*
egen sumsuc_anemia=rowotal (success_anemia_1 success_anemia_2 success_anemia_3) 
tab sumsuc_anemia
*see issue #3*

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
generate success_htn_1=0 if T2_Oppt_bp_00_14==2
replace success_htn_1=1 if (T2_manchronichtn_00_14==3 & T2_Oppt_bp_00_14==2) | (T2_bpontime_00_14==3 & T2_manchronichtn_00_14==1 & T2_Oppt_bp_00_14==2)
tab success_htn_1 b_TrialArm,  col chi
tab success_htn_1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*15-17 weeks*
codebook T2_Oppt_bp_15_17 T2_bpontime_15_17 T2_manchronichtn_15_17
generate success_htn_2=0 if T2_Oppt_bp_15_17==2
replace success_htn_2=1 if (T2_manchronichtn_15_17==3 & T2_Oppt_bp_15_17==2) | (T2_bpontime_15_17==3 & T2_manchronichtn_15_17==1 & T2_Oppt_bp_15_17==2)
tab success_htn_2 b_TrialArm,  col chi
tab success_htn_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*extar variables for specific trial arm-15-17 weeks*
codebook T2_qidsms_Oppt_bp_15_17 T2_qidsms_bpontime_15_17 T2_qidsms_manchronichtn_15_17

generate success_htn_2xtra=0 if T2_qidsms_Oppt_bp_15_17==3
replace success_htn_2xtra=1 if (T2_qidsms_manchronichtn_15_17==3 & T2_qidsms_Oppt_bp_15_17==3) | (T2_qidsms_bpontime_15_17==3 & T2_qidsms_manchronichtn_15_17==1 & T2_qidsms_Oppt_bp_15_17==3)
tab success_htn_2xtra b_TrialArm,  col chi
tab success_htn_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*18-22 weeks*
codebook T2_Oppt_bp_18_22 T2_bpontime_18_22 T2_manchronichtn_18_22
generate success_htn_3=0 if T2_Oppt_bp_18_22==2
replace success_htn_3=1 if (T2_manchronichtn_18_22==3 & T2_Oppt_bp_18_22==2) | (T2_bpontime_18_22==3 & T2_manchronichtn_18_22==1 & T2_Oppt_bp_18_22==2)
tab success_htn_3 b_TrialArm,  col chi
tab success_htn_3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*T2_qidsms_Oppt_bp_18_22 T2_qidsms_bpontime_18_22 T2_qidsms_manchronichtn_18_22 T2_qidsms_Oppt_bp_24_28 T2_qidsms_bpontime_24_28 T2_qidsms_manmildhtn_24_28 T2_qidsms_manmodsevhtn_24_28 T2_qidsms_Oppt_bp_35_37 T2_qidsms_bpontime_35_37 T2_qidsms_manmildhtn_35_37 T2_qidsms_manmodsevhtn_35_37

*24-28 weeks*
codebook T2_Oppt_bp_24_28 T2_bpontime_24_28 T2_manmildhtn_24_28 T2_manmodsevhtn_24_28
generate success_htn_4=0 if T2_Oppt_bp_24_28==2
replace success_htn_4=1 if (T2_manmildhtn_24_28==3 & T2_Oppt_bp_24_28==2) |(T2_manmodsevhtn_24_28==3 & T2_Oppt_bp_24_28==2) | (T2_bpontime_24_28==3 & T2_manmildhtn_24_28==1 & T2_manmodsevhtn_24_28==1 & T2_Oppt_bp_24_28==2)
tab success_htn_4 b_TrialArm,  col chi
tab success_htn_4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*36 weeks*
codebook T2_Oppt_bp_35_37 T2_bpontime_35_37 T2_manmildhtn_35_37 T2_manmodsevhtn_35_37

generate success_htn_5=0 if T2_Oppt_bp_35_37==2
replace success_htn_5=1 if (T2_manmildhtn_35_37==3 & T2_Oppt_bp_35_37==2) |(T2_manmodsevhtn_35_37==3 & T2_Oppt_bp_35_37==2) | (T2_bpontime_35_37==3 & T2_manmildhtn_35_37==1 & T2_manmodsevhtn_35_37==1 & T2_Oppt_bp_35_37==2)
tab success_htn_5 b_TrialArm,  col chi
tab success_htn_5 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_5 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi


**********GEST DIABETES****
*screening &  managememt before 24 weeks & 24-28 WEEKS*

*before 24 weeks*
codebook 
