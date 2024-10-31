

* Change Varname to Label*
foreach var of varlist v2 v8 v9 v10 v13 v14 v20 v21 v23 v24 v27 v28 v30 v31 v32 v33 v87 {
    local label : variable label `var'
    if ("`label'" != "") {
        local oldnames `oldnames' `var'
        local newnames `newnames' _`label'
    }
}

rename (`oldnames')(`newnames')


*Delete Labels*
foreach var of varlist Loan_ID Original_Int_Rate Current_Int_Rate Original_UPB Orig_Term Origination_Date Original_LTV Original_CLTV DTI Credit_at_Origination Loan_Purpose Property_type Occupancy_Status State MSA Zip_Short High_Balance_indicator {
	label variable `var' ""
}


///Gen Treatment dummy///

encode v27, generate(Purpose)  /// Keep only Refis///
generate Refi = 0
replace Refi=1 if Loan_Purpose == "R"   
/* replace Refi = 1 if v27=="R"  if you want to include Cash-Outs*/
keep if Refi==1

generate Over125 = 0
replace Over125 = 1 if Original_UPB>=125000

generate After = 0
replace After = 1 if Origination_Date==122020 | Origination_Date==12021 | Origination_Date==22021 | Origination_Date==32021 | Origination_Date==42021 | Origination_Date==52021 | Origination_Date==62021 | Origination_Date==72021 


gen byte AfterOver125 = After * Over125

//Data-Cleaning//

use "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean.dta"
drop if Original_Int_Rate==.
drop if Current_Int_Rate==.
drop if Original_Int_Rate>=10
drop if Original_Int_Rate<=0
drop if Current_Int_Rate>=10
drop if Current_Int_Rate<=0

//Limit Loans based on size//
drop if Original_UPB <= 50000
drop if Original_UPB >= 300000

//Format//
format %14.0g Loan_ID

//Limit Loans based on Year//

drop if Origination_Date ==12013
drop if Origination_Date ==22013
drop if Origination_Date ==32013
drop if Origination_Date ==42013
drop if Origination_Date ==52013
drop if Origination_Date ==62013
drop if Origination_Date ==72013
drop if Origination_Date ==82013
drop if Origination_Date ==92013
drop if Origination_Date ==102013
drop if Origination_Date ==112013
drop if Origination_Date ==122013


drop if Origination_Date ==12014
drop if Origination_Date ==22014
drop if Origination_Date ==32014
drop if Origination_Date ==42014
drop if Origination_Date ==52014
drop if Origination_Date ==62014
drop if Origination_Date ==72014
drop if Origination_Date ==82014
drop if Origination_Date ==92014
drop if Origination_Date ==102014
drop if Origination_Date ==112014
drop if Origination_Date ==122014

drop if Origination_Date ==12015
drop if Origination_Date ==22015
drop if Origination_Date ==32015
drop if Origination_Date ==42015
drop if Origination_Date ==52015
drop if Origination_Date ==62015
drop if Origination_Date ==72015
drop if Origination_Date ==82015
drop if Origination_Date ==92015
drop if Origination_Date ==102015
drop if Origination_Date ==112015
drop if Origination_Date ==122015

drop if Origination_Date ==12016
drop if Origination_Date ==22016
drop if Origination_Date ==32016
drop if Origination_Date ==42016
drop if Origination_Date ==52016
drop if Origination_Date ==62016
drop if Origination_Date ==72016
drop if Origination_Date ==82016
drop if Origination_Date ==92016
drop if Origination_Date ==102016
drop if Origination_Date ==112016
drop if Origination_Date ==122016

drop if Origination_Date ==12017
drop if Origination_Date ==22017
drop if Origination_Date ==32017
drop if Origination_Date ==42017
drop if Origination_Date ==52017
drop if Origination_Date ==62017
drop if Origination_Date ==72017
drop if Origination_Date ==82017
drop if Origination_Date ==92017
drop if Origination_Date ==102017
drop if Origination_Date ==112017
drop if Origination_Date ==122017

drop if Origination_Date ==12018
drop if Origination_Date ==22018
drop if Origination_Date ==32018
drop if Origination_Date ==42018
drop if Origination_Date ==52018
drop if Origination_Date ==62018
drop if Origination_Date ==72018
drop if Origination_Date ==82018
drop if Origination_Date ==92018
drop if Origination_Date ==102018
drop if Origination_Date ==112018
drop if Origination_Date ==122018

*Keep only loans around 125K * 

drop if Original_UPB <= 115000
drop if Original_UPB >= 135000

*Both Control groups together*

drop if After == 1      /*drop all loans originated after Dec 2020 */



*First Control Group--Loans Over 125k, originated before Dec 2020* 

drop if Original_UPB <= 125000      /*drop loans below 125k */
  


*Second Control Group--Loans below 125k, originated before Dec 2020*

drop if Original_UPB >= 125000   /*drop loans over 125k */





 
*No Covariates*
global project_folder "/Users/besianroshi/Desktop/Balance Tables"
iebaltab Original_Int_Rate Original_UPB Orig_Term Original_LTV DTI Credit_at_Origination , grpvar(Over125) vce(cluster Zip_Short) browse/// 
vce(cluster Zip_Short) ///
savexlsx("$project_folder\balancetable.xlsx") ///
/*replace ftest rowvarlabel */


*With Covariates*
global project_folder "/Users/besianroshi/Desktop/Balance Tables"
iebaltab Original_Int_Rate Original_UPB, grpvar(Over125) ///
vce(cluster Zip_Short) ///
covariates (Orig_Term Original_LTV DTI Credit_at_Origination MSA)    browse      ///
savexlsx("$project_folder\balancetable.xlsx") 
/*replace ftest rowvarlabel */





*Version 1*
iebaltab Original_UPB Original_Int_Rate Original_LTV , grpvar(Over125) browse 

*Version 2* 
global project_folder "/Users/besianroshi/Desktop/Balance Tables"
iebaltab v10, grpvar(AfterOver125) ///
savecsv("$project_folder\balancetable.csv") 

* Version 3*
global project_folder "/Users/besianroshi/Desktop/Balance Tables"
iebaltab v10 v8 v20, grpvar(AfterOver125) ///
savecsv("$project_folder\balancetable.csv") ///
rowlabels("v10 Outcome variable 1 @ v8 Second outcome variable")
