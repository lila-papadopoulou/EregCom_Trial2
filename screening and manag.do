************SCREENING & MANAGEMENT************************************************
***********************************************************************************
*anemia-screening at: before 24 weeks, 24-28 weeks, 36 weeks*
*definition of succesfull screening and management*
*VARIABLES OF INTEREST:T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23*

*time point: <24 weeks*
codebook T2_Oppt_anemia_00_23 T2_screeniningontime_anem_00_23 T2_screeniningontime_n_nm_00_23 T2_mansevanemia_00_23 T2_manmilmodane_00_23

*sucess is defined as (management==Successful|severe anemia==1 OR mild anemia==1) OR (timely screening==Successful|normal status==1) among women who had the opportunity to be timely screened *

generate success_anemia_1=0
replace success_anemia_1=1 if T2_mansevanemia_00_23==2 | T2_manmilmodane_00_23==3 |T2_screeniningontime_n_nm_00_23==3
replace success_anemia_1=. if T2_Oppt_anemia_00_23==0



*screening-before 24 weeks*
tab T2_Oppt_anemia_00_23 
*not applicable/not succesfull*
tab T2_screeniningontime_anem_00_23
*63% succesfull out of all*
tab T2_screeniningontime_n_nm_00_23
*48% were screened and had normal values*
tab T2_screeniningontime_n_nm_00_23 T2_screeniningontime_anem_00_23
*%of women who had succesfull screening of anemia before 24 weeks-need to exclude the missing category*
*false=not succesfull/ missing=not applicable/true=succesfull*

tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable",  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_screeniningontime_anem_00_23 TrialArm if T2_screeniningontime_anem_00_23!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 


tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable",  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_screeniningontime_anem_24_28 TrialArm if T2_screeniningontime_anem_24_28!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 

tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable",  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_screeniningontime_anem_35_37 TrialArm if T2_screeniningontime_anem_35_37!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 

*gestational hypertension*
T2_bpontime_00_14 T2_bpontime_15_17 T2_bpontime_18_22 T2_bpontime_24_28 T2_bpontime_31_33 T2_bpontime_35_37

tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable",  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_bpontime_00_14 TrialArm if T2_bpontime_00_14!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 


tab T2_bpontime_15_17 TrialArm if T2_bpontime_15_17!="Not Applicable",  col chi 

tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable",  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_bpontime_18_22 TrialArm if T2_bpontime_18_22!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 

tab T2_bpontime_24_28 TrialArm if T2_bpontime_24_28!="Not Applicable",  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable",  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="C" & TrialArm!="D" ,  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="B" & TrialArm!="D" ,  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="B" & TrialArm!="C" ,  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="A" & TrialArm!="D" ,  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="A" & TrialArm!="B" ,  col chi 
tab T2_bpontime_31_33 TrialArm if T2_bpontime_31_33!="Not Applicable" &TrialArm!="A" & TrialArm!="C" ,  col chi 

tab T2_bpontime_35_37 TrialArm if T2_bpontime_35_37!="Not Applicable",  col chi 

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
