
*include baseline characteristics* 
*age in categories, parity in cat, education in cat, BMI in cat, Medical and obstetric history: Diabetes mellitus type 2, Caesarean section, 
Gestational diabetes mellitus, Perinatal death, Postpartum hemorrhage, Antepartum hemorrhage, Spontaneous miscarriage, Preeclampsia* 

use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data2_1001_2000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data3_2001_3000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data4_3001_4000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data5_4001_5000.dta"
 keep agecat agemarriagecat agepregnancycat uniqueid
 save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\age.dta"
 
use   "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes.dta", clear
merge 1:1 uniqueid using "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\age.dta"

*duplicate ids in the main dataset*
sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup

browse if dup!=0 & dup!=.

*problem 1: 4 pregnancies/women appear twice*
*same trial arm, same cluster, same motheridno, same organizname but are not repetitions because have different bookevent, booknum, booklmp, bookgestage (5-8, 6-5, 5-21, 5-6)
*solution: randomly select one of the two*

drop  if dup==2
duplicates report uniqueid
*n=4 observations deleted, no duplicates*
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_1.dta"
use  "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_1.dta", clear 

*check the other datasets*
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\age.dta", clear

sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup
browse if dup!=0 & dup!=.
drop  if dup==2
duplicates report uniqueid
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\age_nodup.dta"

use  "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_1.dta", clear 
merge 1:1 uniqueid using "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\age_nodup.dta"
*full matched*

save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_2.dta"
***********************************************************************************
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data2_1001_2000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data3_2001_3000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data4_3001_4000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data5_4001_5000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data6_5001_6000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data7_6001_7000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data8_7001_8000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data9_8001_9000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data10_9001_10680.dta"

keep educationcat avgincomecat incomecat bookbmi bookbmicat gravida para uniqueid
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\othervars.dta"
sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup
drop  if dup==2
duplicates report uniqueid
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\othervars_nodup.dta"

use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_2.dta", clear
merge 1:1 uniqueid using "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\othervars_nodup.dta"
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_3.dta"
************************************************************************************************
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_3.dta", clear

tab agecat TrialArm,  col chi
tab agecat TrialArm if TrialArm!="C" & TrialArm!="D",  col chi
tab agecat TrialArm if TrialArm!="B" & TrialArm!="D",  col chi
tab agecat TrialArm if TrialArm!="B" & TrialArm!="C",  col chi
tab agecat TrialArm if TrialArm!="A" & TrialArm!="D",  col chi
tab agecat TrialArm if TrialArm!="A" & TrialArm!="B",  col chi
tab agecat TrialArm if TrialArm!="A" & TrialArm!="C",  col chi

tab agepregnancycat TrialArm,  col chi
tab agepregnancycat TrialArm if TrialArm!="C" & TrialArm!="D",  col chi
tab agepregnancycat TrialArm if TrialArm!="B" & TrialArm!="D",  col chi
tab agepregnancycat TrialArm if TrialArm!="B" & TrialArm!="C",  col chi
tab agepregnancycat TrialArm if TrialArm!="A" & TrialArm!="D",  col chi
tab agepregnancycat TrialArm if TrialArm!="A" & TrialArm!="B",  col chi
tab agepregnancycat TrialArm if TrialArm!="A" & TrialArm!="C",  col chi

*generate parity and gravidity vars*

gen parity=0 if para==0 & para!=.
replace parity=1 if para!=0 & para!=.
tab parity para

tab parity TrialArm,  col chi

gen gravidity=0 if gravida==1 & gravida!=.
replace gravidity=1 if gravida!=1 & gravida!=.
tab gravidity gravida

tab gravidity TrialArm,  col chi

tab educationcat TrialArm,  col chi mis
tab educationcat TrialArm if TrialArm!="C" & TrialArm!="D",  col chi mis
tab educationcat TrialArm if TrialArm!="B" & TrialArm!="D",  col chi mis
tab educationcat TrialArm if TrialArm!="B" & TrialArm!="C",  col chi mis
tab educationcat TrialArm if TrialArm!="A" & TrialArm!="D",  col chi mis
tab educationcat TrialArm if TrialArm!="A" & TrialArm!="B",  col chi mis
tab educationcat TrialArm if TrialArm!="A" & TrialArm!="C",  col chi mis

tab avgincomecat TrialArm,  col chi mis
tab avgincomecat TrialArm if TrialArm!="C" & TrialArm!="D",  col chi mis
tab avgincomecat TrialArm if TrialArm!="B" & TrialArm!="D",  col chi mis
tab avgincomecat TrialArm if TrialArm!="B" & TrialArm!="C",  col chi mis
tab avgincomecat TrialArm if TrialArm!="A" & TrialArm!="D",  col chi mis
tab avgincomecat TrialArm if TrialArm!="A" & TrialArm!="B",  col chi mis
tab avgincomecat TrialArm if TrialArm!="A" & TrialArm!="C",  col chi mis


tab bookbmicat TrialArm,  col chi mis
tab bookbmicat TrialArm if TrialArm!="C" & TrialArm!="D",  col chi mis
tab bookbmicat TrialArm if TrialArm!="B" & TrialArm!="D",  col chi mis
tab bookbmicat TrialArm if TrialArm!="B" & TrialArm!="C",  col chi mis
tab bookbmicat TrialArm if TrialArm!="A" & TrialArm!="D",  col chi mis
tab bookbmicat TrialArm if TrialArm!="A" & TrialArm!="B",  col chi mis
tab bookbmicat TrialArm if TrialArm!="A" & TrialArm!="C",  col chi mis
******************************************************************************************
*Medical and obstetric history: Diabetes mellitus type 2, Caesarean section, Gestational diabetes mellitus, Perinatal death, Postpartum hemorrhage, Antepartum hemorrhage, Spontaneous miscarriage, Preeclampsia *
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data1_1_1000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data2_1001_2000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data3_2001_3000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data4_3001_4000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data5_4001_5000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data6_5001_6000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data7_6001_7000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data8_7001_8000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data9_8001_9000.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data10_9001_10680.dta"

   
*for history of dm2: bookhistdm
*for history of c-section: bookhistcs
*for history of GDM: bookhistgdm
*for history of preeclampsia: bookhistpreecl
*for history of preterm delivery: bookhistpreterm
*for history of spontaneous miscarriage: recurrent abortions
*for history of postpartum hemorrhage: bookhistpph
*for history of antepartum hemorrhage:bookhistaph
*for history of gestation hypertension:bookhistghtn
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\data1_1_1000.dta"

keep uniqueid bookhistdm bookhistcs bookhistgdm bookhistpreecl bookhistpreterm bookhistpph bookhistaph bookfamhtn bookhistabort conabortion 
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist.dta"

keep uniqueid bookhistghtn bookhistperi
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist2.dta"

sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup
drop  if dup==2
duplicates report uniqueid
drop dup
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist_nodup.dta"
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist2_nodup.dta"

use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist_nodup.dta", clear

use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_3.dta", clear
encode uniqueid, generate(uniqueid_n)

merge 1:1 uniqueid using "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist_nodup.dta"
merge 1:1 uniqueid using "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\medhist2_nodup.dta"

drop _merge
save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_4.dta"

 use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_4.dta", clear

tab bookhistdm TrialArm,  col chi mis
tab bookhistcs TrialArm,  col chi mis
tab bookhistgdm TrialArm,  col chi mis
tab bookhistpreecl TrialArm,  col chi mis
tab bookhistghtn TrialArm,  col chi mis
tab bookhistperi TrialArm,  col chi mis
tab bookhistpph TrialArm,  col chi mis
tab bookhistaph TrialArm,  col chi mis
tab bookhistabort TrialArm,  col chi mis
*11% miscarriage?- is this correct?*
tab bookhistpreterm TrialArm,  col chi mis

mdesc bookhistdm bookhistcs bookhistgdm bookhistpreecl bookhistghtn bookhistperi bookhistpph bookhistaph bookhistabort bookhistpreterm
*all but gd have similar number of missings 22-23% GD has much lower*

mvpatterns bookhistdm bookhistcs bookhistgdm bookhistpreecl bookhistghtn bookhistperi bookhistpph bookhistaph bookhistabort bookhistpreterm
*n=3254 , 22% ha ve same missing in these variables, all medical and obsestric history but gm*

***************************************************************
*extra vars from Chris*
 // Rename cluster identifier variables.
  rename clinicnumber clusterid
  label variable clusterid Cluster

  // Rename the district variable, which was used in stratification.
  rename district strat_var
  
   // Compute the cluster size from the trial data. We use the trial data for
  // simplicity and have verified that these agree with the "baseline" data on
  // trial size. We divide by 100 because cluster sizes range from about 10 to
  // about 220, and we want to get regression coefficients that are non-null
  // within two decimal places! Note that cluster size computation must be
  // done before the data set is reshaped to long format, or we will count
  // one enrollment per visit rather than pregnancy.
  by clusterid, sort: generate cluster_size = _N / 100
  label variable cluster_size  "Cluster size" // 100s of new enrollments

 rename str_TRIAL_1_Cluster clusterid
 
     // Age.
    replace age = . if age <= 1 // Correct some mis-coded values of the age variable.
    label variable age "Age (years)"
	
	 // Recode the arm levels, ensure that level 1 is control, and set the
    // value labels.
    ${recode_`outcome'}
    fvset base 1 arm
    label define arm_value_label 1 "Control" 2 "Intervention"
    label values arm arm_value_label

*****************************************************************************
*******ATTENDANCE***********
*****************************************************************************
 use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_outcomes_3.dta", clear
*15-17 weeks*
tab denom_15_17
*this variable describes women eligible for attendance at the specific time period-they had sceduled apoinments for this period
tab num_15_17 
*this variable described those who attended: 1 or did not attended:0 their sceduled appointment*

tab num_15_17 if denom_15_17!=., mis 
tab num_15_17 TrialArm if denom_15_17!=.,  col chi 
tab num_15_17 TrialArm if TrialArm!="C" & TrialArm!="D",  col chi 
tab num_15_17 TrialArm if TrialArm!="B" & TrialArm!="D",  col chi 
tab num_15_17 TrialArm if TrialArm!="B" & TrialArm!="C",  col chi 
tab num_15_17 TrialArm if TrialArm!="A" & TrialArm!="D",  col chi 
tab num_15_17 TrialArm if TrialArm!="A" & TrialArm!="B",  col chi 
tab num_15_17 TrialArm if TrialArm!="A" & TrialArm!="C",  col chi 

tab num_18_22 if denom_18_22!=., mis
tab num_18_22 TrialArm if denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="C" & TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="B" & TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="B" & TrialArm!="C" & denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="A" & TrialArm!="D" & denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="A" & TrialArm!="B" & denom_18_22!=.,  col chi 
tab num_18_22 TrialArm if TrialArm!="A" & TrialArm!="C" & denom_18_22!=.,  col chi 
  
tab num_24_28 if denom_24_28!=., mis 
tab num_24_28 TrialArm if denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="C" & TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="B" & TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="B" & TrialArm!="C" & denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="A" & TrialArm!="D" & denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="A" & TrialArm!="B" & denom_24_28!=.,  col chi 
tab num_24_28 TrialArm if TrialArm!="A" & TrialArm!="C" & denom_24_28!=.,  col chi 
 
tab num_31_33 if denom_31_33!=., mis
tab num_31_33 TrialArm if denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="C" & TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="B" & TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="B" & TrialArm!="C" & denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="A" & TrialArm!="D" & denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="A" & TrialArm!="B" & denom_31_33!=.,  col chi 
tab num_31_33 TrialArm if TrialArm!="A" & TrialArm!="C" & denom_31_33!=.,  col chi 
   
tab num_35_37 if denom_35_37!=., mis  
tab num_35_37 TrialArm if denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="C" & TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="B" & TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="B" & TrialArm!="C" & denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="A" & TrialArm!="D" & denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="A" & TrialArm!="B" & denom_35_37!=.,  col chi 
tab num_35_37 TrialArm if TrialArm!="A" & TrialArm!="C" & denom_35_37!=.,  col chi 
***********************************************************************************
*check if there is any overlap between visits*
egen anyattend=rowtotal(num_15_17 num_18_22 num_24_28 num_31_33 num_35_37) 

tab anyattend   
tab anyattend TrialArm ,  col chi 
tab anyattend TrialArm if TrialArm!="C" & TrialArm!="D" ,  col chi 
tab anyattend TrialArm if TrialArm!="B" & TrialArm!="D" ,  col chi 
tab anyattend TrialArm if TrialArm!="B" & TrialArm!="C" ,  col chi 
tab anyattend TrialArm if TrialArm!="A" & TrialArm!="D" ,  col chi 
tab anyattend TrialArm if TrialArm!="A" & TrialArm!="B" ,  col chi 
tab anyattend TrialArm if TrialArm!="A" & TrialArm!="C" ,  col chi 

gen anyattend01=0 if anyattend==0
replace anyattend01=1 if anyattend!=0 & anyattend!=.

tab anyattend01 anyattend

tab anyattend01 TrialArm ,  col chi 
tab anyattend01 TrialArm if TrialArm!="C" & TrialArm!="D" ,  col chi 
tab anyattend01 TrialArm if TrialArm!="B" & TrialArm!="D" ,  col chi 
tab anyattend01 TrialArm if TrialArm!="B" & TrialArm!="C" ,  col chi 
tab anyattend01 TrialArm if TrialArm!="A" & TrialArm!="D" ,  col chi 
tab anyattend01 TrialArm if TrialArm!="A" & TrialArm!="B" ,  col chi 
tab anyattend01 TrialArm if TrialArm!="A" & TrialArm!="C" ,  col chi 

***********************************************************************************
************SCREENING & MANAGEMENT************
***********************************************************************************
*anemia-times for screening: before 24 weeks, 24-28 weeks, 36 weeks*

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
