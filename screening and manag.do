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
*VARIABLES OF INTEREST:T2_Oppt_anemia_35_37 T2_screeniningontime_anem_35_37  T2_manmildmodanemia_35_37 T2_mansevanemia_35_37*
codebook T2_Oppt_anemia_35_37  T2_screeniningontime_anem_35_37 T2_manmildmodanemia_35_37 T2_mansevanemia_35_37

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
replace man_anemia4=1 if T2_Oppt_anemia_35_37=="Successful" & T2_screeniningontime_anem_35_37=="Successful" & (T2_mansevanemia_35_37=="Successful"|T2_manmildmodanemia_35_37=="Successful")
tab man_anemia4 b_TrialArm,  col chi
tab man_anemia4 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_anemia4 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_anemia_4=0 if T2_Oppt_anemia_35_37=="Successful"
replace success_anemia_4=1 if (T2_mansevanemia_35_37=="Successful" | T2_screeniningontime_anem_35_37=="Successful"|T2_manmildmodanemia_35_37=="Successful") & T2_Oppt_anemia_35_37=="Successful"
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
codebook T2_qidsms_Oppt_anemia_35_37 T2_qidsms_screennngntm_nm_35_37 T2_qidsms_scrnnngntm_n_nm_35_37 T2_qidsms_manmildmodanemi_35_37 T2_qidsms_mansevanemia_35_37

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

*management only*
gen man_anemia4xtra=0 if T2_qidsms_Oppt_anemia_35_37=="Successful" & T2_qidsms_screennngntm_nm_35_37=="Successful" & T2_qidsms_scrnnngntm_n_nm_35_37=="Not Successful"
replace man_anemia4xtra=1 if T2_qidsms_Oppt_anemia_35_37=="Successful" & T2_qidsms_screennngntm_nm_35_37=="Successful" & T2_qidsms_scrnnngntm_n_nm_35_37=="Not Successful" & (T2_qidsms_manmildmodanemi_35_37=="Successful" | T2_qidsms_mansevanemia_35_37=="Successful")
tab man_anemia4xtra b_TrialArm,  col chi

*screening & management*
generate success_anemia_4xtra=0 if T2_qidsms_Oppt_anemia_35_37=="Successful"
replace success_anemia_4xtra=1 if (T2_qidsms_mansevanemia_35_37=="Successful" | T2_qidsms_manmildmodanemi_35_37=="Successful" | T2_qidsms_scrnnngntm_n_nm_35_37=="Successful") & T2_qidsms_Oppt_anemia_35_37=="Successful"
tab success_anemia_4xtra b_TrialArm,  col chi
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_anemia_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*generate the summary variables for anemia*
*opportunities*
local opp_anemia "T2_Oppt_anemia_00_23 T2_Oppt_anemia_24_28 T2_Oppt_anemia_29_34 T2_Oppt_anemia_35_37"
foreach x of local opp_anemia {
                gen new_`x'=1 if `x'=="Successful"
                replace new_`x'=0 if `x'=="Not Applicable" 
        }

egen opp_anemia=rowtotal(new_T2_Oppt_anemia_00_23 new_T2_Oppt_anemia_24_28 new_T2_Oppt_anemia_29_34 new_T2_Oppt_anemia_35_37)
tab opp_anemia
gen opp_anemia01=0 if opp_anemia==0
replace opp_anemia01=1 if opp_anemia!=0 & opp_anemia!=.
tab opp_anemia01 b_TrialArm,  col chi

*screened succesfully among women with the opportunity to be screened*
egen tscreen_anemia=rowtotal(screen_anemia1 screen_anemia2 screen_anemia3 screen_anemia4) if opp_anemia01==1
gen tscreen_anemia01=0 if tscreen_anemia==0 & opp_anemia01==1
replace tscreen_anemia01=1 if tscreen_anemia!=0 & tscreen_anemia!=. & opp_anemia01==1
tab tscreen_anemia01 b_TrialArm,  col chi

*managed succesfully among women who were supposed to be managed- abnormal Hb values*
gen oppman_anemia=1 if (man_anemia1!=. | man_anemia2!=. | man_anemia3!=. | man_anemia4!=.)
tab oppman_anemia
egen tman_anemia=rowtotal(man_anemia1 man_anemia2 man_anemia3 man_anemia4) if opp_anemia01==1 & oppman_anemia==1
gen tman_anemia01=0 if tman_anemia==0 & opp_anemia01==1 & oppman_anemia==1
replace tman_anemia01=1 if tman_anemia!=0 & opp_anemia01==1 & tman_anemia!=. & oppman_anemia==1
tab tman_anemia01 b_TrialArm,  col chi

egen tmanscreen_anemia=rowtotal(success_anemia_1 success_anemia_2 success_anemia_3 success_anemia_4) if opp_anemia01==1 
gen tmanscreen_anemia01=0 if tmanscreen_anemia==0 & opp_anemia01==1
replace tmanscreen_anemia01=1 if tmanscreen_anemia!=0 & opp_anemia01==1 & tmanscreen_anemia!=.
tab tmanscreen_anemia01 b_TrialArm,  col chi

*total outcomes for QIDSMS arm*
*opportunities*
local opp_anemiaxtra "T2_qidsms_Oppt_anemia_24_28 T2_qidsms_Oppt_anemia_35_37"
foreach x of local opp_anemiaxtra {
                gen new_`x'=1 if `x'=="Successful"
                replace new_`x'=0 if `x'=="Not Applicable" 
        }

egen opp_anemiaxtra=rowtotal(new_T2_qidsms_Oppt_anemia_24_28 new_T2_qidsms_Oppt_anemia_35_37)
tab opp_anemiaxtra
gen opp_anemiaxtra01=0 if opp_anemiaxtra==0
replace opp_anemiaxtra01=1 if opp_anemiaxtra!=0 & opp_anemiaxtra!=.
tab opp_anemiaxtra01 b_TrialArm,  col chi

*screened succesfully among women with the opportunity to be screened*
egen tscreen_anemiaxtra=rowtotal(screen_anemia2xtra screen_anemia4xtra) if opp_anemiaxtra01==1
gen tscreen_anemiaxtra01=0 if tscreen_anemiaxtra==0 & opp_anemiaxtra01==1
replace tscreen_anemiaxtra01=1 if tscreen_anemiaxtra!=0 & tscreen_anemiaxtra!=. & opp_anemiaxtra01==1
tab tscreen_anemiaxtra01 b_TrialArm,  col chi

*managed succesfully among women who were supposed to be managed- abnormal Hb values*
gen oppman_anemiaxtra=1 if (man_anemia2xtra!=. | man_anemia4xtra!=.)
tab oppman_anemiaxtra

egen tman_anemiaextra=rowtotal(man_anemia2xtra man_anemia4xtra) if opp_anemiaxtra01==1 & oppman_anemiaxtra==1
gen tman_anemiaextra01=0 if tman_anemiaextra==0 & opp_anemiaxtra01==1 & oppman_anemiaxtra==1
replace tman_anemiaextra01=1 if tman_anemiaextra!=0 & opp_anemiaxtra01==1 & tman_anemiaextra!=. & oppman_anemiaxtra==1
tab tman_anemiaextra01 b_TrialArm,  col chi

egen tmanscreen_anemiaxtra=rowtotal(success_anemia_2xtra success_anemia_4xtra) if opp_anemiaxtra01==1 
gen tmanscreen_anemiaxtra01=0 if tmanscreen_anemiaxtra==0 
replace tmanscreen_anemiaxtra01=1 if tmanscreen_anemiaxtra!=0 & tmanscreen_anemiaxtra!=.
tab tmanscreen_anemiaxtra01 b_TrialArm,  col chi

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
codebook T2_Oppt_bp_15_17 T2_bpontime_15_17 T2_manmildchronichtn_15_17 T2_manmodsevchronichtn_15_17
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
gen man_hyp2=0 if T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful" & (T2_manmildchronichtn_15_17!="Not Applicable"|T2_manmodsevchronichtn_15_17!="Not Applicable")
replace man_hyp2=1 if T2_Oppt_bp_15_17=="Successful" & T2_bpontime_15_17=="Successful" & (T2_manmildchronichtn_15_17=="Successful"|T2_manmodsevchronichtn_15_17=="Successful")
tab man_hyp2 b_TrialArm,  col chi
tab man_hyp2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_htn_2=0 if T2_Oppt_bp_15_17=="Successful"
replace success_htn_2=1 if T2_Oppt_bp_15_17=="Successful" & (screen_hyp2==1 |man_hyp2==1)
replace success_htn_2=0 if man_hyp2==0
tab success_htn_2 b_TrialArm,  col chi
tab success_htn_2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*18-22 weeks*
codebook T2_Oppt_bp_18_22 T2_bpontime_18_22 T2_manmildchronichtn_18_22 T2_manmodsevchronichtn_18_22

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
gen man_hyp3=0 if T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful" & (T2_manmodsevchronichtn_18_22!="Not Applicable"|T2_manmildchronichtn_18_22!="Not Applicable")
replace man_hyp3=1 if T2_Oppt_bp_18_22=="Successful" & T2_bpontime_18_22=="Successful" & (T2_manmodsevchronichtn_18_22=="Successful"|T2_manmildchronichtn_18_22=="Successful")
tab man_hyp3 b_TrialArm,  col chi
tab man_hyp3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_3=0 if T2_Oppt_bp_18_22=="Successful"
replace success_htn_3=1 if T2_Oppt_bp_18_22=="Successful" & (screen_hyp3==1 |man_hyp3==1)
replace success_htn_3=0 if man_hyp3==0
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
replace success_htn_4=1 if screen_hyp4==1 | man_hyp4==1
replace success_htn_4=0 if man_hyp4==0
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
replace success_htn_5=1 if screen_hyp5==1 | man_hyp5==1
replace success_htn_5=0 if man_hyp5==0
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
replace success_htn_6=1 if screen_hyp6==1 |man_hyp6==1
replace success_htn_6=0 if man_hyp6==0
tab success_htn_6 b_TrialArm,  col chi
tab success_htn_6 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_6 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*generate the summary variables for hypertension*
*opportunities*
local opp_hyp "T2_Oppt_bp_00_14 T2_Oppt_bp_15_17 T2_Oppt_bp_18_22 T2_Oppt_bp_24_28 T2_Oppt_bp_31_33 T2_Oppt_bp_35_37"
foreach x of local opp_hyp {
                gen new_`x'=1 if `x'=="Successful"
                replace new_`x'=0 if `x'=="Not Applicable" 
        }

egen opp_hyp=rowtotal(new_T2_Oppt_bp_00_14 new_T2_Oppt_bp_15_17 new_T2_Oppt_bp_18_22 new_T2_Oppt_bp_24_28 new_T2_Oppt_bp_31_33 new_T2_Oppt_bp_35_37)
tab opp_hyp
gen opp_hyp01=0 if opp_hyp==0
replace opp_hyp01=1 if opp_hyp!=0 & opp_hyp!=.
tab opp_hyp01 b_TrialArm,  col chi

egen tscreen_hyp=rowtotal(screen_hyp1 screen_hyp2 screen_hyp3 screen_hyp4 screen_hyp5 screen_hyp6) if opp_hyp01==1
gen tscreen_hyp01=0 if tscreen_hyp==0 & opp_hyp01==1
replace tscreen_hyp01=1 if tscreen_hyp!=0 & tscreen_hyp!=. & opp_hyp01==1
tab tscreen_hyp01 b_TrialArm,  col chi
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab tscreen_hyp01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*managed succesfully among women who were supposed to be managed- abnormal BP values*
gen oppman_hyp=1 if (man_hyp1!=.| man_hyp2!=.| man_hyp3!=.| man_hyp4!=.| man_hyp5!=.| man_hyp6!=.)
tab oppman_hyp
egen tman_hyp=rowtotal(man_hyp1 man_hyp2 man_hyp3 man_hyp4 man_hyp5 man_hyp6) if opp_hyp01==1 & oppman_hyp==1
tab tman_hyp
gen tman_hyp01=0 if tman_hyp==0 & opp_hyp01==1 & oppman_hyp==1
replace tman_hyp01=1 if tman_hyp!=0 & opp_hyp01==1 & tman_hyp!=. & oppman_hyp==1
tab tman_hyp01 b_TrialArm,  col chi

egen tmanscreen_hyp=rowtotal(success_htn_1 success_htn_2 success_htn_3 success_htn_4 success_htn_5 success_htn_6) if opp_hyp01==1 
tab tmanscreen_hyp
gen tmanscreen_hyp01=0 if tmanscreen_hyp==0 & opp_hyp01==1
replace tmanscreen_hyp01=1 if tmanscreen_hyp!=0 & opp_hyp01==1 & tmanscreen_hyp!=.
tab tmanscreen_hyp01 b_TrialArm,  col chi
*******************************************************************************************************************************
*****QID&SMS variables*********
*15-17 weeks*
codebook T2_qidsms_Oppt_bp_15_17 T2_qidsms_bpontime_15_17 T2_qidsms_manmildchrnchtn_15_17

*screening only*
gen screen_hyp2xtra=0 if T2_qidsms_Oppt_bp_15_17=="Successful"
replace screen_hyp2xtra=1 if T2_qidsms_Oppt_bp_15_17=="Successful" & T2_qidsms_bpontime_15_17=="Successful"
tab screen_hyp2xtra b_TrialArm,  col chi
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp2xtra=0 if T2_qidsms_Oppt_bp_15_17=="Successful" & T2_qidsms_bpontime_15_17=="Successful" & T2_qidsms_manmildchrnchtn_15_17!="Not Applicable"
replace man_hyp2xtra=1 if T2_qidsms_Oppt_bp_15_17=="Successful" & T2_qidsms_bpontime_15_17=="Successful" & T2_qidsms_manmildchrnchtn_15_17=="Successful"
tab man_hyp2xtra b_TrialArm,  col chi
tab man_hyp2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_htn_2xtra=0 if T2_qidsms_Oppt_bp_15_17=="Successful"
replace success_htn_2xtra=1 if T2_qidsms_Oppt_bp_15_17=="Successful" & (screen_hyp2xtra==1 | man_hyp2xtra==1)
replace success_htn_2xtra=0 if man_hyp2xtra==0
tab success_htn_2xtra b_TrialArm,  col chi
tab success_htn_2xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_2xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi


*18-22 weeks*
codebook T2_qidsms_Oppt_bp_18_22 T2_qidsms_bpontime_18_22 T2_qidsms_manmildchrnchtn_18_22 T2_qidsms_manmdsvchrnchtn_18_22

*screening only*
gen screen_hyp3xtra=0 if T2_qidsms_Oppt_bp_18_22=="Successful"
replace screen_hyp3xtra=1 if T2_qidsms_Oppt_bp_18_22=="Successful" & T2_qidsms_bpontime_18_22=="Successful"
tab screen_hyp3xtra b_TrialArm,  col chi
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp3xtra=0 if T2_qidsms_Oppt_bp_18_22=="Successful" & T2_qidsms_bpontime_18_22=="Successful" & (T2_qidsms_manmildchrnchtn_18_22!="Not Applicable"|T2_qidsms_manmdsvchrnchtn_18_22!="Not Applicable")
replace man_hyp3xtra=1 if T2_qidsms_Oppt_bp_18_22=="Successful" & T2_qidsms_bpontime_18_22=="Successful" & (T2_qidsms_manmildchrnchtn_18_22=="Successful"|T2_qidsms_manmdsvchrnchtn_18_22=="Successful")
tab man_hyp3xtra b_TrialArm,  col chi
tab man_hyp3xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

generate success_htn_3xtra=0 if T2_qidsms_Oppt_bp_18_22=="Successful"
replace success_htn_3xtra=1 if T2_qidsms_Oppt_bp_18_22=="Successful" & (screen_hyp3xtra==1|man_hyp3xtra==1)
replace success_htn_3xtra=0 if man_hyp3xtra==0
tab success_htn_3xtra b_TrialArm,  col chi
tab success_htn_3xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_3xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*24-28 weeks*
codebook T2_qidsms_Oppt_bp_24_28 T2_qidsms_bpontime_24_28 T2_qidsms_manmildhtn_24_28 T2_qidsms_manmodsevhtn_24_28

gen screen_hyp4xtra=0 if T2_qidsms_Oppt_bp_24_28=="Successful"
replace screen_hyp4xtra=1 if T2_qidsms_Oppt_bp_24_28=="Successful" & T2_qidsms_bpontime_24_28=="Successful"
tab screen_hyp4xtra b_TrialArm,  col chi
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp4xtra=0 if T2_qidsms_Oppt_bp_24_28=="Successful" & T2_qidsms_bpontime_24_28=="Successful" & (T2_qidsms_manmildhtn_24_28!="Not Applicable"|T2_qidsms_manmodsevhtn_24_28!="Not Applicable")
replace man_hyp4xtra=1 if T2_qidsms_Oppt_bp_24_28=="Successful" & T2_qidsms_bpontime_24_28=="Successful" & (T2_qidsms_manmildhtn_24_28=="Successful"|T2_qidsms_manmodsevhtn_24_28=="Successful")
tab man_hyp4xtra b_TrialArm,  col chi
tab man_hyp4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_4xtra=0 if T2_qidsms_Oppt_bp_24_28=="Successful"
replace success_htn_4xtra=1 if T2_qidsms_Oppt_bp_24_28=="Successful" & (screen_hyp4xtra==1|man_hyp4xtra==1)
replace success_htn_4xtra=0 if man_hyp4xtra==0
tab success_htn_4xtra b_TrialArm,  col chi
tab success_htn_4xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_4xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*31-33*
codebook T2_qidsms_Oppt_bp_31_33 T2_qidsms_bpontime_31_33 T2_qidsms_manmildhtn_31_33 T2_qidsms_manmodsevhtn_31_33

gen screen_hyp5xtra=0 if T2_qidsms_Oppt_bp_31_33=="Successful"
replace screen_hyp5xtra=1 if T2_qidsms_Oppt_bp_31_33=="Successful" & T2_qidsms_bpontime_31_33=="Successful"
tab screen_hyp5xtra b_TrialArm,  col chi
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp5xtra=0 if T2_qidsms_Oppt_bp_31_33=="Successful" & T2_qidsms_bpontime_31_33=="Successful" & (T2_qidsms_manmildhtn_31_33!="Not Applicable"|T2_qidsms_manmodsevhtn_31_33!="Not Applicable")
replace man_hyp5xtra=1 if T2_qidsms_Oppt_bp_31_33=="Successful" & T2_qidsms_bpontime_31_33=="Successful" & (T2_qidsms_manmildhtn_31_33=="Successful"|T2_qidsms_manmodsevhtn_31_33=="Successful")
tab man_hyp5xtra b_TrialArm,  col chi
tab man_hyp5xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_5xtra=0 if T2_qidsms_Oppt_bp_31_33=="Successful"
replace success_htn_5xtra=1 if T2_qidsms_Oppt_bp_31_33=="Successful" & (screen_hyp5xtra==1 |man_hyp5xtra==1)
replace success_htn_5xtra=0 if man_hyp5xtra==0
tab success_htn_5xtra b_TrialArm,  col chi
tab success_htn_5xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_5xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi


*35-37 weeks*
codebook T2_qidsms_Oppt_bp_35_37 T2_qidsms_bpontime_35_37 T2_qidsms_manmildhtn_35_37 T2_qidsms_manmodsevhtn_35_37

gen screen_hyp6xtra=0 if T2_qidsms_Oppt_bp_35_37=="Successful"
replace screen_hyp6xtra=1 if T2_qidsms_Oppt_bp_35_37=="Successful" & T2_qidsms_bpontime_35_37=="Successful"
tab screen_hyp6xtra b_TrialArm,  col chi
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*management only*
gen man_hyp6xtra=0 if screen_hyp6xtra==1 & (T2_qidsms_manmildhtn_35_37!="Not Applicable"|T2_qidsms_manmodsevhtn_35_37!="Not Applicable")
replace man_hyp6xtra=1 if screen_hyp6xtra==1 & (T2_qidsms_manmildhtn_35_37=="Successful"|T2_qidsms_manmodsevhtn_35_37=="Successful")
tab man_hyp6xtra b_TrialArm,  col chi
tab man_hyp6xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab man_hyp6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab man_hyp6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab man_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab man_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab man_hyp6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*screening & management*
generate success_htn_6xtra=0 if T2_qidsms_Oppt_bp_35_37=="Successful"
replace success_htn_6xtra=1 if T2_qidsms_Oppt_bp_35_37=="Successful" & (screen_hyp6xtra==1 | man_hyp6xtra==1)
replace success_htn_6xtra=0 if man_hyp6xtra==0
tab success_htn_6xtra b_TrialArm,  col chi
tab success_htn_6xtra b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab success_htn_6xtra b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*summary variables*
*opportunities*
local opp_hypxtra "T2_qidsms_Oppt_bp_15_17 T2_qidsms_Oppt_bp_18_22 T2_qidsms_Oppt_bp_24_28 T2_qidsms_Oppt_bp_31_33 T2_qidsms_Oppt_bp_35_37"
foreach x of local opp_hypxtra {
                gen new_`x'=1 if `x'=="Successful"
                replace new_`x'=0 if `x'=="Not Successful" 
        }

egen opp_hypxtra=rowtotal(new_T2_qidsms_Oppt_bp_15_17 new_T2_qidsms_Oppt_bp_18_22 new_T2_qidsms_Oppt_bp_24_28 new_T2_qidsms_Oppt_bp_31_33 new_T2_qidsms_Oppt_bp_35_37)
tab opp_hypxtra
gen opp_hypxtra01=0 if opp_hypxtra==0
replace opp_hypxtra01=1 if opp_hypxtra!=0 & opp_hypxtra!=.
tab opp_hypxtra01 b_TrialArm,  col chi

egen tscreen_hypxtra=rowtotal(screen_hyp2xtra screen_hyp3xtra screen_hyp4xtra screen_hyp5xtra screen_hyp6xtra) if opp_hypxtra01==1
gen tscreen_hypxtra01=0 if tscreen_hypxtra==0 & opp_hypxtra01==1
replace tscreen_hypxtra01=1 if tscreen_hypxtra!=0 & tscreen_hypxtra!=. & opp_hypxtra01==1
tab tscreen_hypxtra01 b_TrialArm,  col chi

*managed succesfully among women who were supposed to be managed- abnormal BP values*
gen oppman_hypxtra=1 if (man_hyp2xtra!=. | man_hyp3xtra!=. | man_hyp4xtra!=. | man_hyp5xtra!=. | man_hyp6xtra!=. )
tab oppman_hypxtra
egen tman_hypxtra=rowtotal(man_hyp2xtra man_hyp3xtra man_hyp4xtra man_hyp5xtra man_hyp6xtra) if opp_hypxtra01==1 & oppman_hypxtra==1
tab tman_hypxtra
gen tman_hypxtra01=0 if tman_hypxtra==0 & opp_hypxtra01==1 & oppman_hypxtra==1
replace tman_hypxtra01=1 if tman_hypxtra!=0 & opp_hypxtra01==1 & tman_hypxtra!=. & oppman_hypxtra==1
tab tman_hypxtra01 b_TrialArm,  col chi

egen tmanscreen_hypxtra=rowtotal(success_htn_2xtra success_htn_3xtra success_htn_4xtra success_htn_5xtra success_htn_6xtra) if opp_hypxtra01==1 
tab tmanscreen_hypxtra
gen tmanscreen_hypxtra01=0 if tmanscreen_hypxtra==0 & opp_hypxtra01==1
replace tmanscreen_hypxtra01=1 if tmanscreen_hypxtra!=0 & opp_hypxtra01==1 & tmanscreen_hypxtra!=.
tab tmanscreen_hypxtra01 b_TrialArm,  col chi

*****************************************************************************************************************************************************************************
**********GEST DIABETES****
*screening only*

*before 24 weeks*
codebook T2_Opportunity_GDM_scrnng_b4_24 T2_GDMscrnngntm_b4_24_bkrgl_nrm T2_GDMscrnngntm_b4_24_bkfstbld_ T2_GDMscrnngntm_b4_24_bkbldgl_n T2_GDMscreenngntm_b4_24_mnpsrgl T2_GDMscrenngntm_b4_24_mnhghrbs 

*screening only*
gen screen_gdm1=0 if T2_Opportunity_GDM_scrnng_b4_24=="Successful"
replace screen_gdm1=1 if T2_Opportunity_GDM_scrnng_b4_24=="Successful" & (T2_GDMscrnngntm_b4_24_bkrgl_nrm!="Not Applicable" | T2_GDMscrnngntm_b4_24_bkfstbld_!="Not Applicable"| T2_GDMscrnngntm_b4_24_bkbldgl_n!="Not Applicable")
tab screen_gdm1 b_TrialArm,  col chi
tab screen_gdm1 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_gdm1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_gdm1 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_gdm1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_gdm1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_gdm1 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*management only*
gen man_gdm1=0 if T2_Opportunity_GDM_scrnng_b4_24=="Successful" & (T2_GDMscrnngntm_b4_24_bkrgl_nrm== "Not Successful"| T2_GDMscrnngntm_b4_24_bkfstbld_== "Not Successful"|T2_GDMscrnngntm_b4_24_bkbldgl_n== "Not Successful")   
replace man_gdm1=1 if T2_Opportunity_GDM_scrnng_b4_24=="Successful" & (T2_GDMscreenngntm_b4_24_mnpsrgl=="Successful"| T2_GDMscrenngntm_b4_24_mnhghrbs=="Successful")
tab man_gdm1 b_TrialArm,  col chi

*screening and management-replace with 0 those who were screened and were sick and were not managed*
gen success_gdm1=0 if T2_Opportunity_GDM_scrnng_b4_24=="Successful"
replace success_gdm1=1 if screen_gdm1==1 |man_gdm1==1
replace success_gdm1=0 if man_gdm1==0
tab success_gdm1 b_TrialArm,  col chi

*24-28 weeks*
codebook T2_Opportunity_GDM_scrnng_24_28 T2_GDMscreeningontime_24_28 T2_GDMscreeningontim_24_28_nrml T2_GDMscrenngntm_24_28_mnhghrbg T2_GDMscreeningontm_24_28_ntmbg T2_GDMscreenngntm_24_28_mnntmbg
*screening only*
gen screen_gdm2=0 if T2_Opportunity_GDM_scrnng_24_28=="Successful"
replace screen_gdm2=1 if T2_Opportunity_GDM_scrnng_24_28=="Successful" & T2_GDMscreeningontime_24_28=="Successful"
tab screen_gdm2 b_TrialArm,  col chi
tab screen_gdm2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_gdm2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_gdm2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_gdm2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_gdm2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_gdm2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*management only*
gen man_gdm2=0 if T2_Opportunity_GDM_scrnng_24_28=="Successful" & T2_GDMscreeningontime_24_28=="Successful" & T2_GDMscreeningontim_24_28_nrml=="Not Successful"
replace man_gdm2=1 if T2_Opportunity_GDM_scrnng_24_28=="Successful" & T2_GDMscreeningontime_24_28=="Successful" & T2_GDMscreeningontim_24_28_nrml=="Not Successful" & (T2_GDMscrenngntm_24_28_mnhghrbg=="Successful"|T2_GDMscreenngntm_24_28_mnntmbg=="Successful")
tab man_gdm2 b_TrialArm,  col chi

*screening and management-replace with 0 those who were screened and were sick and were not managed*
gen success_gdm2=0 if T2_Opportunity_GDM_scrnng_24_28=="Successful"
replace success_gdm2=1 if screen_gdm2==1 |man_gdm2==1
replace success_gdm2=0 if man_gdm2==0
tab success_gdm2 b_TrialArm,  col chi

*after 28 weeks*
codebook T2_Opportunty_GDM_scrnng_ftr_28 T2_GDMscreeningontm_ftr_28_nrml T2_GDMscreeningontim_ftr_28_hgh T2_GDMscreeningontime_after_28

*screening only*
gen screen_gdm3=0 if T2_Opportunty_GDM_scrnng_ftr_28=="Successful"
replace screen_gdm3=1 if T2_Opportunty_GDM_scrnng_ftr_28=="Successful" & T2_GDMscreeningontime_after_28=="Successful"
tab screen_gdm3 b_TrialArm,  col chi
tab screen_gdm3 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab screen_gdm3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab screen_gdm3 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab screen_gdm3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab screen_gdm3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab screen_gdm3 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*management only*
gen man_gdm3=0 if screen_gdm3==1 &  T2_GDMscreeningontm_ftr_28_nrml=="Not Successful"
replace man_gdm3=1 if screen_gdm3==1 &  T2_GDMscreeningontm_ftr_28_nrml=="Not Successful" & T2_GDMscreeningontim_ftr_28_hgh=="Successful"
tab man_gdm3 b_TrialArm,  col chi

gen success_gdm3=0 if T2_Opportunty_GDM_scrnng_ftr_28=="Successful"
replace success_gdm3=1 if screen_gdm3==1 |man_gdm3==1
replace success_gdm3=0 if man_gdm3==0
tab success_gdm3 b_TrialArm,  col chi
*******************************************************************************
*total outcomes*
*opportunities*
local opp_gdm "T2_Opportunity_GDM_scrnng_b4_24 T2_Opportunity_GDM_scrnng_24_28 T2_Opportunty_GDM_scrnng_ftr_28"
foreach x of local opp_gdm {
                gen N`x'=1 if `x'=="Successful"
                replace N`x'=0 if `x'=="Not Applicable" 
        }

egen opp_gdm=rowtotal(NT2_Opportunity_GDM_scrnng_b4_24 NT2_Opportunity_GDM_scrnng_24_28 NT2_Opportunty_GDM_scrnng_ftr_28)
tab opp_gdm
gen opp_gdm01=0 if opp_gdm==0
replace opp_gdm01=1 if opp_gdm!=0 & opp_gdm!=.
tab opp_gdm01 b_TrialArm,  col chi

egen tscreen_gdm=rowtotal(screen_gdm1 screen_gdm2 screen_gdm3) if opp_gdm01==1
gen tscreen_gdm01=0 if tscreen_gdm==0 & opp_gdm01==1
replace tscreen_gdm01=1 if tscreen_gdm!=0 & tscreen_gdm!=. & opp_gdm01==1
tab tscreen_gdm01 b_TrialArm,  col chi

gen oppman_gdm=1 if (man_gdm1!=. |man_gdm2!=. | man_gdm3!=.)
tab oppman_gdm
egen tman_gdm=rowtotal(man_gdm1 man_gdm2 man_gdm3) if opp_gdm01==1 & oppman_gdm==1
tab tman_gdm
gen tman_gdm01=0 if tman_gdm==0 & opp_gdm01==1 & oppman_gdm==1
replace tman_gdm01=1 if tman_gdm!=0 & opp_gdm01==1 & tman_gdm!=. & oppman_gdm==1
tab tman_gdm01 b_TrialArm,  col chi

egen tmanscreen_gdm=rowtotal(success_gdm1 success_gdm2 success_gdm3) if opp_gdm01==1 
tab tmanscreen_gdm
gen tmanscreen_gdm01=0 if tmanscreen_gdm==0 & opp_gdm01==1
replace tmanscreen_gdm01=1 if tmanscreen_gdm!=0 & opp_gdm01==1 & tmanscreen_gdm!=.
tab tmanscreen_gdm01 b_TrialArm,  col chi

*************QIDSMS arm****************
*24-28 weeks*
codebook T2_qdsms_Opprtnty_GDM_scr_24_28 T2_qidsms_GDMscreeningntm_24_28 T2_qdsms_GDMscrnngntm_24_28_nrm T2_qdsms_GDMscrnngntm_24_28_mnh T2_qdsms_GDMscrnngntm_24_28_ntm T2_qdsms_GDMscrnngntm_24_28_mnn

*screening only*
gen screen_gdm2xtra=0 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful"
replace screen_gdm2xtra=1 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful" & T2_qidsms_GDMscreeningntm_24_28=="Successful"
tab screen_gdm2xtra b_TrialArm,  col chi


*management only*
gen man_gdm2xtra=0 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful" & T2_qidsms_GDMscreeningntm_24_28=="Successful" & T2_qdsms_GDMscrnngntm_24_28_nrm=="Not Successful"
replace man_gdm2xtra=1 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful" & T2_qidsms_GDMscreeningntm_24_28=="Successful" & T2_qdsms_GDMscrnngntm_24_28_nrm=="Not Successful" & (T2_qdsms_GDMscrnngntm_24_28_mnh=="Successful"|T2_qdsms_GDMscrnngntm_24_28_mnn=="Successful")
tab man_gdm2xtra b_TrialArm,  col chi

*screening and management-replace with 0 those who were screened and were sick and were not managed*
gen success_gdm2xtra=0 if T2_qdsms_Opprtnty_GDM_scr_24_28=="Successful"
replace success_gdm2xtra=1 if screen_gdm2xtra==1 |man_gdm2xtra==1
replace success_gdm2xtra=0 if man_gdm2xtra==0
tab success_gdm2xtra b_TrialArm,  col chi

