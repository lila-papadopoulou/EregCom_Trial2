  use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_07092021.dta"
*n=15257*
 
*idenitfy duplicates by uniqueid*
sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup

*issue 1: 5 uniqueids appear twice (n=10)*
*solution:drop these observations*

drop if dup!=0
*(10 observations deleted)*
tab dup
*n=15247*

save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_07092021_nodup.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_07092021_nodup.dta", clear

