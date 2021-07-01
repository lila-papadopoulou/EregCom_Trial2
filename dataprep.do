 use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_updated.dta"
*n=14581*
 
*idenitfy duplicates by uniqueid*
sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup

*issue 1: 4 uniqueids appear twice (n=8)*
*solution:drop these observations*

drop if dup!=0
*(8 observations deleted)*
tab dup
*n=14573*

save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_updated_nodup.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\T2_FINAL_dataset_updated_nodup.dta", clear

