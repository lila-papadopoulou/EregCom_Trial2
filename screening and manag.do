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


*calculate the overall success for anemia*
gen totalsucc_anemia=0 
replace totalsucc_anemia=1 if success_anemia_1==1 & success_anemia_2==1 & success_anemia_3==1 


***************************
*GDM-check these variables with Mervett*
*before 24 weeks*
tab screenb424 TrialArm if screenb424!="Not Applicable",  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab screenb424 TrialArm if screenb424!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 

*between 24-28 weeks*
tab T2_GDMscreeningontime_2
tab T2_GDMscreeningontime_2A
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable",  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_GDMscreeningontime_2A TrialArm if T2_GDMscreeningontime_2A!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 


*after 28 weeks*
tab T2_GDMscreeningontime_3A
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable",  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_GDMscreeningontime_3A TrialArm if T2_GDMscreeningontime_3A!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 
********************************
*succesful management of anemia before 24 weeks*
