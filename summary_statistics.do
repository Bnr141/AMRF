use "/Users/besianroshi/Desktop/Dissertation 2/2021 Latest/dta/2019-2021Bunching.dta"

duplicates report v2
duplicates drop v2, force

sum v8 
sum v10 
sum v13 
sum v20 
sum v22 
sum v23 
sum v24 
sum v29 
sum v34

drop if v27 == "P"

sum v8 
sum v10 
sum v13 
sum v20 
sum v22 
sum v23 
sum v24 
sum v29 
sum v34


clear

use "/Users/besianroshi/Desktop/Dissertation 2/2021 Latest/dta/2020-2022Full(NoDupes-Summary).dta"


duplicates report v2
duplicates drop v2, force

sum v8 
sum v10 
sum v13 
sum v20 
sum v22 
sum v23 
sum v24 
sum v29 
sum v34

drop if v27 == "P"

sum v8 
sum v10 
sum v13 
sum v20 
sum v22 
sum v23 
sum v24 
sum v29 
sum v34



append using "/Users/besianroshi/Desktop/2022/2022Q1.dta""/Users/besianroshi/Desktop/2022/2022Q2.dta""/Users/besianroshi/Desktop/2022/2022Q3.dta""/Users/besianroshi/Desktop/2022/2022Q4.dta" , force
