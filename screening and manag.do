************SCREENING & MANAGEMENT************************************************
***********************************************************************************
*anemia-screening & managememt at 3 time points: before 24 weeks, 24-28 weeks, 36 weeks*
*success is defined as (management==Successful|severe anemia==1 OR mild anemia==1) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *

*time point: <24 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23*
codebook T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23

generate success_anemia_1=0 if T2_Oppt_anemia_00_23==succesf
replace success_anemia_1=1 if T2_mansevanemia_00_23==2 | T2_manmilmodane_00_23==3 |T2_screeniningontime_n_nm_00_23==3
*check issue #2*

*time point: 24-28 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_24_28 T2_screeniningontime_anem_24_28 T2_screeniningontime_n_nm_24_28 T2_manmildmodanemia_24_28 T2_mansevanemia_24_28*
codebook T2_Oppt_anemia_24_28 T2_screeniningontime_anem_24_28 T2_screeniningontime_n_nm_24_28 T2_manmildmodanemia_24_28 T2_mansevanemia_24_28

generate success_anemia_2=0 if T2_Oppt_anemia_24_28==3
replace success_anemia_2=1 if T2_mansevanemia_24_28==3 | T2_manmildmodanemia_24_28==3 |T2_screeniningontime_n_nm_24_28==3
tab success_anemia_2

*time point: 36 weeks*
*VARIABLES OF INTEREST:T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37 T2_screeniningontime_nm_35_37_1 T2_mansevanemia_35_37*
codebook T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37 T2_screeniningontime_nm_35_37_1 T2_mansevanemia_35_37

generate success_anemia_3=0 if T2_Oppt_anemia_35_37==3
replace success_anemia_3=1 if T2_mansevanemia_35_37==3 | T2_screeniningontime_nm_35_37_1==3
tab success_anemia_3


*calculate the overall success for anemia-on the basis of the whole population*
gen totalsucc_anemia=0 
replace totalsucc_anemia=1 if success_anemia_1==1 & success_anemia_2==1 & success_anemia_3==1 

*calculate the sum of success for anemia*
egen sumsuc_anemia=rowotal (success_anemia_1 success_anemia_2 success_anemia_3) 
tab sumsuc_anemia


*HYPERTENSION*
*BP -screening & hypertensions managememt before 20 weeks:Blood pressure prior to 20 weeks’ gestation, test at the first visit
and at 16, 18–22 weeks’ gestation*
*after 20 weeks: Blood pressure at or after 20 weeks’ gestation, test at 18–22, 24–28, and 36 weeks’ gestation*

*success is defined as (management==Successful|severe htn==1 OR mild htn==1 OR chronic htn) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *

codebook T2_Oppt_bp_00_14 T2_bpontime_00_14 T2_Oppt_bp_15_17 T2_bpontime_15_17 T2_Oppt_bp_18_22 T2_bpontime_18_22 /// 
T2_Oppt_bp_24_28 T2_bpontime_24_28 T2_Oppt_bp_35_37 T2_bpontime_35_37
codebook T2_manchronichtn_00_14 T2_manchronichtn_15_17 T2_manchronichtn_18_22 T2_manmildhtn_24_28 T2_manmodsevhtn_24_28 ///
T2_manmildhtn_35_37 T2_manmodsevhtn_35_37

generate success_anemia_1=0 if T2_Oppt_bp_00_14==2
replace success_anemia_1=1 if T2_manchronichtn_00_14==3 | 
