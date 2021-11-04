*baseline characteristics*
tab b_TrialArm
*woman's age at study entry*
tab agecat b_TrialArm,   col chi
tab agecat b_TrialArm,  mis col chi

tab agecat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab agecat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab agecat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab agecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab agecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab agecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

tab agecat b_TrialArm,   col chi
*parity*
gen parity=0 if para==0 & para!=.
replace parity=1 if para!=0 & para!=.
tab parity para
tab parity b_TrialArm,  col chi mis
tab parity b_TrialArm,  col chi 
tab parity b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab parity b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab parity b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab parity b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab parity b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab parity b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*income*
tab avgincomecat b_TrialArm,  col chi mis
tab avgincomecat b_TrialArm,  col chi 
tab avgincomecat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab avgincomecat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab avgincomecat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab avgincomecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab avgincomecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab avgincomecat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*education*
tab educationcat b_TrialArm,  col chi mis
tab educationcat b_TrialArm,  col chi
tab educationcat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*age at 1st pregnancy*

tab agepregnancycat b_TrialArm,  mis col chi
tab agepregnancycat b_TrialArm,  col chi
tab agepregnancycat b_TrialArm if gravidity==1,  mis col chi
tab agepregnancycat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab agepregnancycat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab agepregnancycat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab agepregnancycat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab agepregnancycat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab agepregnancycat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*gestational age at booking visit*
tab bookgestagedays_cats
gen bookgestage_n=1 if bookgestagedays_cats==2
replace bookgestage_n=2 if bookgestagedays_cats!=2 & bookgestagedays_cats!=. & bookgestagedays_cats!=1
label define gestweeks 1 "0-15weeks" 2 ">15 weeks"
label values bookgestage_n gestweeks
tab bookgestage_n b_TrialArm,  col chi mis
tab bookgestage_n b_TrialArm,  col chi 


*BMI at booking visit*

tab bookbmicat b_TrialArm,  col chi mis
tab bookbmicat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookbmicat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookbmicat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookbmicat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookbmicat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookbmicat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi
tab bookbmicat b_TrialArm,  col chi 

*cluster size
*variable is created based on the dataset*
by str_TRIAL_2_Cluster, sort: generate cluster_size = _N / 100
label variable cluster_size  "Cluster size" 
gen clsize_cat=1 if cluster_size!=. 
replace clsize_cat=2 if cluster_size!=. & cluster_size>0.99 
replace clsize_cat=3 if cluster_size!=. & cluster_size>1.99
tabstat cluster_size, by(clsize_cat) stats( n min max)

*variable based on randomization*
gen clussize_random=clussize/100 if clussize!=.
gen clsize_cat_random=1 if cluster_size!=. 
replace clsize_cat_random=2 if clussize_random!=. & clussize_random>0.99 
replace clsize_cat_random=3 if clussize_random!=. & clussize_random>1.99
tabstat clussize_random, by(clsize_cat_random) stats( n min max)

tab clsize_cat clsize_cat_random

tab clsize_cat b_TrialArm,  col chi 
tab  clsize_cat_random b_TrialArm,  col chi 

tab clsize_cat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab clsize_cat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab clsize_cat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab clsize_cat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab clsize_cat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab clsize_cat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

tab clsize_cat_random b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab clsize_cat_random b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab clsize_cat_random b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab clsize_cat_random b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab clsize_cat_random b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab clsize_cat_random b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*lab availability*
tab lab b_TrialArm,  col chi 
tab lab b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab lab b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab lab b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab lab b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab lab b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab lab b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*ultrasound availability*
tab usavailability b_TrialArm,  col chi 
tab usavailability b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab usavailability b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab usavailability b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab usavailability b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab usavailability b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab usavailability b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

*diabetes 2*
tab bookhistdm b_TrialArm,  col chi mis
tab bookhistdm b_TrialArm,  col chi 

*obstestric history among those who have been pregnant before: gravida=1*
gen gravidity=0 if gravida==1 & gravida!=.
replace gravidity=1 if gravida!=1 & gravida!=.
tab gravidity gravida

*c-section*
tab bookhistcs b_TrialArm if gravidity==1,  col chi mis
tab bookhistcs b_TrialArm if gravidity==1,  col chi  

*gestational diabetes*
tab bookhistgdm b_TrialArm if gravidity==1,  col chi mis
tab bookhistgdm b_TrialArm if gravidity==1,  col chi 
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookhistgdm b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="C",  chi

*perinatal death*
tab bookhistperi b_TrialArm if gravidity==1,  col chi mis
tab bookhistperi b_TrialArm if gravidity==1,  col chi 

*postpartum hemor.*
tab bookhistpph b_TrialArm if gravidity==1,  col chi mis
tab bookhistpph b_TrialArm if gravidity==1,  col chi 

*antepartum hemoreg.*
tab bookhistaph b_TrialArm if gravidity==1,  col chi mis
tab bookhistaph b_TrialArm if gravidity==1,  col chi

*spontaneous miscarriage*
tab bookhistabort b_TrialArm if gravidity==1,  col chi mis
tab bookhistabort b_TrialArm if gravidity==1,  col chi

*pre-eclampsia*
tab bookhistpreecl b_TrialArm if gravidity==1,  col chi mis
tab bookhistpreecl b_TrialArm if gravidity==1,  col chi 

tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookhistpreecl b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="C",  chi

