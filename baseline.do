*baseline characteristics*

*woman's age at study entry*
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

*income*
recode avgincomecat 5=1 2=2 4=3 1=4 3=5, gen(avgincomecat_n)
tab avgincomecat_n b_TrialArm,  col chi mis
tab avgincomecat_n b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab avgincomecat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab avgincomecat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab avgincomecat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab avgincomecat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab avgincomecat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi
tab avgincomecat_n b_TrialArm,  col chi

*education*
tab educationcat b_TrialArm,  col chi mis
tab educationcat b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab educationcat b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

tab educationcat b_TrialArm,  col chi

*age at 1st pregnancy*
recode agepregnancycat 6=1 1=2 2=3 3=4 4=5 5=6, gen(agepregnancycat_n)
tab agepregnancycat_n b_TrialArm,  mis col chi
tab agepregnancycat_n b_TrialArm if gravidity==1,  mis col chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab agepregnancycat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

tab agepregnancycat_n b_TrialArm,  col chi

*gestational age at booking visit*
tab bookgestagedays_cats
gen bookgestagedays_cats_n=1 if  bookgestagedays_cats==1
replace  bookgestagedays_cats_n=2 if  bookgestagedays_cats==2
replace  bookgestagedays_cats_n=3 if  bookgestagedays_cats==3
replace  bookgestagedays_cats_n=4 if  bookgestagedays_cats==4
replace  bookgestagedays_cats_n=5 if  bookgestagedays_cats==5
replace  bookgestagedays_cats_n=6 if  bookgestagedays_cats>5 & bookgestagedays_cats!=.

label define gestweeks 1 "0-14weeks" 2 "15-17weeks" 3 "18-22weeks" 4 "23 weeks" 5 "24-28weeks" 6">28weeks" 
label values bookgestagedays_cats_n gestweeks
tab bookgestagedays_cats_n  bookgestagedays_cats
tab bookgestagedays_cats_n  b_TrialArm,  col chi mis

gen bookgestagedays_cats_n2=1 if  bookgestagedays_cats_n==1
replace bookgestagedays_cats_n2=2 if  bookgestagedays_cats_n!=1 & bookgestagedays_cats_n!=.
tab bookgestagedays_cats_n2  b_TrialArm,  col chi mis

tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookgestagedays_cats_n2 b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi

tab bookgestagedays_cats_n2  b_TrialArm,  col chi 

*BMI at booking visit*
recode bookbmicat 4=1 1=2 2=3 3=4, gen(bookbmicat_n)
tab bookbmicat_n b_TrialArm,  col chi mis
tab bookbmicat_n b_TrialArm if b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookbmicat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookbmicat_n b_TrialArm if b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookbmicat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookbmicat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookbmicat_n b_TrialArm if b_TrialArm!="A" & b_TrialArm!="C",  chi
tab bookbmicat_n b_TrialArm,  col chi 

*diabetes 2*
tab bookhistdm b_TrialArm,  col chi mis
tab bookhistdm b_TrialArm,  col chi 

*obstestric history among those who have been pregnant before: gravidity=1*
gen gravidity=0 if gravida==1 & gravida!=.
replace gravidity=1 if gravida!=1 & gravida!=.
tab gravidity gravida

*c-section*
tab bookhistcs b_TrialArm if gravidity==1,  col chi mis
tab bookhistcs b_TrialArm if gravidity==1,  col chi  

tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookhistcs b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="C",  chi

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

tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="C" & b_TrialArm!="D",  chi
tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="D",  chi
tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="B" & b_TrialArm!="C",  chi
tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="D",  chi
tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="B",  chi
tab bookhistaph b_TrialArm if gravidity==1 & b_TrialArm!="A" & b_TrialArm!="C",  chi


*spontaneous miscarriage*
tab bookhistabort b_TrialArm if gravidity==1,  col chi mis
tab bookhistabort b_TrialArm if gravidity==1,  col chi

*pre-eclampsia*
tab bookhistpreecl b_TrialArm if gravidity==1,  col chi mis
tab bookhistpreecl b_TrialArm if gravidity==1,  col chi 
