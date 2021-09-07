*outcome definition*
 use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_updated_nodup.dta"
 
 *ATTENDANCE*
 *from study protocol: Comparison II: TCC arm vs control arm: The primary
outcome in comparison 2 is the proportion of all timely
routine ANC visits that a woman was eligible for, where
the woman attended (Table 2). The first ANC booking
visit is excluded, and each timely routine visit will be
counted separately as a singular opportunity to succeed
or fail in attendance.*
 **********************************************************************************************
*VARIABLES OF INTEREST: num_15_17 num_18_22 num_24_28 num_31_33 num_35_37 denom_15_17 denom_18_22 denom_24_28 denom_31_33 denom_35_37
*variables "num_": describe women who attended (value=1) or did not attend (values=0) at the specific time*
*variables "denom_": describe women who were eligible to attend at this time-they had sceduled appointment*

*calculate total number of opportunities*
egen totalop=rowtotal(denom_15_17 denom_18_22 denom_24_28 denom_31_33 denom_35_37)
tab totalop
tab totalop b_TrialArm ,  col chi
tab totalop b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab totalop b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab totalop b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab totalop b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab totalop b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab totalop b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*calculate total number of timely attended ANC*
egen totalatt=rowtotal(num_15_17 num_18_22 num_24_28 num_31_33 num_35_37)
tab totalatt b_TrialArm ,  col chi
tab totalatt b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab totalatt b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab totalatt b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab totalatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab totalatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab totalatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*any opportunity vs. no oportunity (collapsing the subcategories into 1*
gen anyopp=0 if totalop==0
replace anyopp=1 if totalop!=0 & totalop!=.
tab anyopp b_TrialArm ,  col chi
tab anyopp b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab anyopp b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab anyopp b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab anyopp b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab anyopp b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab anyopp b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*any attendance vs. no attendance (collapsing the subcategories into 1)*
gen anyatt=0 if totalatt==0
replace anyatt=1 if totalatt!=0 & totalatt!=.
tab anyatt b_TrialArm ,  col chi
tab anyatt b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab anyatt b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab anyatt b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab anyatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab anyatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab anyatt b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi

*calculate total number of timely visits-this is the primary outcome for comparison 2*
egen totalattend=rowtotal(num_15_17 num_18_22 num_24_28 num_31_33 num_35_37) 
tab totalattend   
tab totalattend b_TrialArm ,  col chi 
*note: this is referring to the totla population independently of eligibility by time-point. eg. among the total number of 14573 participats, 10856 (74.5%) did not attend timely any visit.*

tab totalattend b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab totalattend b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab totalattend b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab totalattend b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab totalattend b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab totalattend b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 

*calculate any timely attendance*
gen anyattend01=0 if anyattend==0
replace anyattend01=1 if anyattend!=0 & anyattend!=.
tab anyattend01 anyattend

tab anyattend01 b_TrialArm ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" ,  col chi 
tab anyattend01 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" ,  col chi 


*describe attendance at the specific time point*
tab num_15_17 if denom_15_17!=., mis 
*describe attendance for the specific time point by trial arm*
tab num_15_17 b_TrialArm if denom_15_17!=.,  col chi mis
tab num_15_17 b_TrialArm if denom_15_17!=.,  col chi

*if p<0.05 check difference two-by-two to identify where is the difference*
tab num_15_17 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  col chi 
tab num_15_17 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  col chi 
tab num_15_17 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  col chi 
tab num_15_17 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  col chi 
tab num_15_17 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  col chi 
tab num_15_17 b_TrialArm if b_TrialArm!="A" & Tb_TrialArm!="C",  col chi 

tab num_18_22 if denom_18_22!=., mis
tab num_18_22 b_TrialArm if denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if denom_18_22!=.,  col chi mis
tab num_18_22 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" & denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" & denom_18_22!=.,  col chi 
tab num_18_22 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" & denom_18_22!=.,  col chi 
  
tab num_24_28 if denom_24_28!=., mis 
tab num_24_28 b_TrialArm if denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" & denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" & denom_24_28!=.,  col chi 
tab num_24_28 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" & denom_24_28!=.,  col chi 
 
tab num_31_33 if denom_31_33!=., mis
tab num_31_33 b_TrialArm if denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" & denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" & denom_31_33!=.,  col chi 
tab num_31_33 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" & denom_31_33!=.,  col chi 
   
tab num_35_37 if denom_35_37!=., mis  
tab num_35_37 b_TrialArm if denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C" & denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B" & denom_35_37!=.,  col chi 
tab num_35_37 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C" & denom_35_37!=.,  col chi 
