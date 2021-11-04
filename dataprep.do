  use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\outcomes_04112021.dta"
*n=15249*
 
*idenitfy duplicates by uniqueid*
sort uniqueid
quietly by uniqueid:  gen dup = cond(_N==1,0,_n) 
tab dup

*issue: 6 uniqueids appear twice (n=12)*
*solution:drop these observations*

drop if dup!=0
*(12 observations deleted)*
tab dup
*n=15237*

save "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\outcomes_04112021_nodup.dta"
use "C:\Users\elpa\OneDrive - Folkehelseinstituttet\from personmap\Global Health\palestine rct\outcomes_04112021_nodup.dta", clear

