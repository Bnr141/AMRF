import delimited /Users/besianroshi/Desktop/2019/2019Q4.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2019/2019Q4.dta" 
import delimited /Users/besianroshi/Desktop/2020/2020Q1.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2020/2020Q1.dta" 
import delimited /Users/besianroshi/Desktop/2020/2020Q2.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2020/2020Q2.dta" 
import delimited /Users/besianroshi/Desktop/2020/2020Q3.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2020/2020Q3.dta" 
import delimited /Users/besianroshi/Desktop/2020/2020Q4.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2020/2020Q4.dta" 
import delimited /Users/besianroshi/Desktop/2021/2021Q1.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2021/2021Q1.dta" 
import delimited /Users/besianroshi/Desktop/2021/2021Q2.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2021/2021Q2.dta" 
import delimited /Users/besianroshi/Desktop/2021/2021Q3.csv, delimiter("|") clear
save "/Users/besianroshi/Desktop/2021/2021Q3.dta" 

//Preliminary Graphs//
use "/Users/besianroshi/Desktop/2021 Latest/Refinance Trends.dta"

twoway (bar Value Date, barwidth(0.5) yscale(r(0 1000) titlegap(*10)) ylabel(0(100)1000,format(%10.0fc) labs(big)) xtitle(Date) xscale(r(238 247) titlegap(*10)) xlabel(238(1)247,labs(small)) ytitle("US Mortgage Originations, Refinancing"))

use "/Users/besianroshi/Desktop/2021 Latest/30YRates.dta"

twoway (line MORTGAGE30US Date, yscale(r(2.6 3.8) titlegap(*10)) ylabel(2.6(0.2)3.8,labs(small)) xtitle("Date") xscale(r(21916 22518) titlegap(*10)) xlabel(21916(84)22518,labs(small)) ytitle("Percent"))

use "/Users/besianroshi/Desktop/2021 Latest/15YRates.dta"

twoway (line MORTGAGE15US Date, yscale(r(2.0 3.2) titlegap(*10)) ylabel(2.0(0.2)3.2,labs(small)) xtitle("Date") xscale(r(21916 22518) titlegap(*10)) xlabel(21916(84)22518,labs(small)) ytitle("Percent"))

use "/Users/besianroshi/Desktop/2021 Latest/OrigFee30Y.dta"

twoway (line MORTPTS30US Date, yscale(r(0.5 1) titlegap(*10)) ylabel(0.5(0.1)1,labs(small)) xtitle("Date") xscale(r(21916 22518) titlegap(*10)) xlabel(21916(84)22518,labs(small)) ytitle("Percent"))

use "/Users/besianroshi/Desktop/2021 Latest/OrigFee15Y.dta"

twoway (line MORTPTS15US Date, yscale(r(0.5 1) titlegap(*10)) ylabel(0.5(0.1)1,labs(small)) xtitle("Date") xscale(r(21916 22518) titlegap(*10)) xlabel(21916(84)22518,labs(small)) ytitle("Percent"))


*Append*
use "/Users/besianroshi/Desktop/2021 Latest/2019/2019Q1.dta"
append using "/Users/besianroshi/Desktop/2021 Latest/2019/2019Q2.dta""/Users/besianroshi/Desktop/2021 Latest/2019/2019Q3.dta" "/Users/besianroshi/Desktop/2021 Latest/2019/2019Q4.dta" , force
save "/Users/besianroshi/Desktop/2021 Latest/2019/2019Full.dta"

clear

use "/Users/besianroshi/Desktop/2021 Latest/2021/2021Q1.dta"
append using "/Users/besianroshi/Desktop/2021 Latest/2021/2021Q2.dta""/Users/besianroshi/Desktop/2021 Latest/2021/2021Q3.dta" , force
save "/Users/besianroshi/Desktop/2021 Latest/2021/2021Full.dta"


*Clean each year*

use "/Users/besianroshi/Desktop/2021 Latest/2019/2019Full.dta"

drop v1 
label variable v2 "Loan_ID"
label variable v3 "Monthly_Reporting"
label variable v4 "Channel"
label variable v5 "Seller"
label variable v6 "Servicer"
drop v7
label variable v8 "Original Int_Rate"
label variable v9 "Current Int_Rate"
label variable v10 "Original_UPB"
drop v11
label variable v12 "Current_UPB"
label variable v13 "Orig_Term"
label variable v14 "Origination_Date"
label variable v15 "First_Payment"
label variable v16 "Loan_Age"
label variable v17 "Months_to_Maturity"
label variable v18 "Months_to_legal_Mat"
label variable v19 "Mat_Date"
label variable v20 "Original_LTV"
label variable v21 "Original_CLTV"
label variable v22 "Nr_of_Borrowers"
label variable v23 "DTI"
label variable v24 "Credit_at_Origination"
label variable v25 "CoBorrower_Credit_at_Origination"
label variable v26 "First_Time_Home "
label variable v27 "Loan_Purpose"
label variable v28 "Property_type"
label variable v29 "Number_of_Units"
label variable v30 "Occupancy_Status"
label variable v31 "State"
label variable v32 "MSA"
label variable v33 "Zip_Short"
label variable v34 "Insurance_percent"
label variable v35 "Amortization"
label variable v36 "Prepayment_penalty"
label variable v37 "Int_Only_indicator"
drop v38
drop v39
label variable v40 "Current_Deliquency"
drop v41
label variable v42 "Modification"
drop v43
drop v44
drop v45
drop v46
drop v47
drop v48
drop v49
drop v50
drop v51
drop v52
drop v53
drop v54
drop v55
drop v56
drop v57
drop v58
drop v59
drop v60
drop v61
drop v62
drop v63
drop v64
drop v65
drop v66
drop v67
drop v68
drop v69
drop v70
drop v71
drop v72
label variable v73 "Mort_Insurance_type"
label variable v74 "Servicing_Activity"
drop v75
drop v76
drop v77
drop v78
label variable v79 "Home_Ready"
drop v80
label variable v81 "Relocation_mortgage"
drop v82
drop v83
drop v84
drop v85
label variable v86 "Property_Valuation_method"
label variable v87 "High_Balance_indicator"
drop v88
drop v89
drop v90
drop v91
drop v92
drop v93
drop v94
drop v95
drop v96
drop v97
drop v98
drop v99
drop v100
drop v101
label variable v102 "Borrower_Assistance"
label variable v103 "HLTV_opt"
drop v104
drop v105
label variable v106 "Alt_Deliquency_Res"
drop v107 
drop v108


save "/Users/besianroshi/Desktop/2021 Latest/2019/2019FullClean.dta"


clear




use "/Users/besianroshi/Desktop/2021 Latest/2020/2020Full.dta"

drop v1 
label variable v2 "Loan_ID"
label variable v3 "Monthly_Reporting"
label variable v4 "Channel"
label variable v5 "Seller"
label variable v6 "Servicer"
drop v7
label variable v8 "Original Int_Rate"
label variable v9 "Current Int_Rate"
label variable v10 "Original_UPB"
drop v11
label variable v12 "Current_UPB"
label variable v13 "Orig_Term"
label variable v14 "Origination_Date"
label variable v15 "First_Payment"
label variable v16 "Loan_Age"
label variable v17 "Months_to_Maturity"
label variable v18 "Months_to_legal_Mat"
label variable v19 "Mat_Date"
label variable v20 "Original_LTV"
label variable v21 "Original_CLTV"
label variable v22 "Nr_of_Borrowers"
label variable v23 "DTI"
label variable v24 "Credit_at_Origination"
label variable v25 "CoBorrower_Credit_at_Origination"
label variable v26 "First_Time_Home "
label variable v27 "Loan_Purpose"
label variable v28 "Property_type"
label variable v29 "Number_of_Units"
label variable v30 "Occupancy_Status"
label variable v31 "State"
label variable v32 "MSA"
label variable v33 "Zip_Short"
label variable v34 "Insurance_percent"
label variable v35 "Amortization"
label variable v36 "Prepayment_penalty"
label variable v37 "Int_Only_indicator"
drop v38
drop v39
label variable v40 "Current_Deliquency"
drop v41
label variable v42 "Modification"
drop v43
drop v44
drop v45
drop v46
drop v47
drop v48
drop v49
drop v50
drop v51
drop v52
drop v53
drop v54
drop v55
drop v56
drop v57
drop v58
drop v59
drop v60
drop v61
drop v62
drop v63
drop v64
drop v65
drop v66
drop v67
drop v68
drop v69
drop v70
drop v71
drop v72
label variable v73 "Mort_Insurance_type"
label variable v74 "Servicing_Activity"
drop v75
drop v76
drop v77
drop v78
label variable v79 "Home_Ready"
drop v80
label variable v81 "Relocation_mortgage"
drop v82
drop v83
drop v84
drop v85
label variable v86 "Property_Valuation_method"
label variable v87 "High_Balance_indicator"
drop v88
drop v89
drop v90
drop v91
drop v92
drop v93
drop v94
drop v95
drop v96
drop v97
drop v98
drop v99
drop v100
drop v101
label variable v102 "Borrower_Assistance"
label variable v103 "HLTV_opt"
drop v104
drop v105
label variable v106 "Alt_Deliquency_Res"
drop v107 
drop v108


save "/Users/besianroshi/Desktop/2021 Latest/2020/2020FullClean.dta"

clear




use "/Users/besianroshi/Desktop/2021 Latest/2021/2021Full.dta"

drop v1 
label variable v2 "Loan_ID"
label variable v3 "Monthly_Reporting"
label variable v4 "Channel"
label variable v5 "Seller"
label variable v6 "Servicer"
drop v7
label variable v8 "Original Int_Rate"
label variable v9 "Current Int_Rate"
label variable v10 "Original_UPB"
drop v11
label variable v12 "Current_UPB"
label variable v13 "Orig_Term"
label variable v14 "Origination_Date"
label variable v15 "First_Payment"
label variable v16 "Loan_Age"
label variable v17 "Months_to_Maturity"
label variable v18 "Months_to_legal_Mat"
label variable v19 "Mat_Date"
label variable v20 "Original_LTV"
label variable v21 "Original_CLTV"
label variable v22 "Nr_of_Borrowers"
label variable v23 "DTI"
label variable v24 "Credit_at_Origination"
label variable v25 "CoBorrower_Credit_at_Origination"
label variable v26 "First_Time_Home "
label variable v27 "Loan_Purpose"
label variable v28 "Property_type"
label variable v29 "Number_of_Units"
label variable v30 "Occupancy_Status"
label variable v31 "State"
label variable v32 "MSA"
label variable v33 "Zip_Short"
label variable v34 "Insurance_percent"
label variable v35 "Amortization"
label variable v36 "Prepayment_penalty"
label variable v37 "Int_Only_indicator"
drop v38
drop v39
label variable v40 "Current_Deliquency"
drop v41
label variable v42 "Modification"
drop v43
drop v44
drop v45
drop v46
drop v47
drop v48
drop v49
drop v50
drop v51
drop v52
drop v53
drop v54
drop v55
drop v56
drop v57
drop v58
drop v59
drop v60
drop v61
drop v62
drop v63
drop v64
drop v65
drop v66
drop v67
drop v68
drop v69
drop v70
drop v71
drop v72
label variable v73 "Mort_Insurance_type"
label variable v74 "Servicing_Activity"
drop v75
drop v76
drop v77
drop v78
label variable v79 "Home_Ready"
drop v80
label variable v81 "Relocation_mortgage"
drop v82
drop v83
drop v84
drop v85
label variable v86 "Property_Valuation_method"
label variable v87 "High_Balance_indicator"
drop v88
drop v89
drop v90
drop v91
drop v92
drop v93
drop v94
drop v95
drop v96
drop v97
drop v98
drop v99
drop v100
drop v101
label variable v102 "Borrower_Assistance"
label variable v103 "HLTV_opt"
drop v104
drop v105
label variable v106 "Alt_Deliquency_Res"
drop v107 
drop v108


save "/Users/besianroshi/Desktop/2021 Latest/2021/2021FullClean.dta"







use "/Users/besianroshi/Desktop/2021 Latest/2019/2019FullClean.dta"
append using "/Users/besianroshi/Desktop/2021 Latest/2020/2020FullClean.dta""/Users/besianroshi/Desktop/2021 Latest/2021/2021FullClean.dta", force
save "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean.dta"







//Data-Cleaning//

use "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean.dta"
drop if v8==.
drop if v9==.
drop if v8>=10
drop if v8<=0
drop if v9>=10
drop if v9<=0

//Limit Loans based on size//
drop if v10 <= 50000
drop if v10 >= 300000

//Format//
format %14.0g v2

//Limit Loans based on Year//

drop if v14 ==12013
drop if v14 ==22013
drop if v14 ==32013
drop if v14 ==42013
drop if v14 ==52013
drop if v14 ==62013
drop if v14 ==72013
drop if v14 ==82013
drop if v14 ==92013
drop if v14 ==102013
drop if v14 ==112013
drop if v14 ==122013


drop if v14 ==12014
drop if v14 ==22014
drop if v14 ==32014
drop if v14 ==42014
drop if v14 ==52014
drop if v14 ==62014
drop if v14 ==72014
drop if v14 ==82014
drop if v14 ==92014
drop if v14 ==102014
drop if v14 ==112014
drop if v14 ==122014

drop if v14 ==12015
drop if v14 ==22015
drop if v14 ==32015
drop if v14 ==42015
drop if v14 ==52015
drop if v14 ==62015
drop if v14 ==72015
drop if v14 ==82015
drop if v14 ==92015
drop if v14 ==102015
drop if v14 ==112015
drop if v14 ==122015

drop if v14 ==12016
drop if v14 ==22016
drop if v14 ==32016
drop if v14 ==42016
drop if v14 ==52016
drop if v14 ==62016
drop if v14 ==72016
drop if v14 ==82016
drop if v14 ==92016
drop if v14 ==102016
drop if v14 ==112016
drop if v14 ==122016

drop if v14 ==12017
drop if v14 ==22017
drop if v14 ==32017
drop if v14 ==42017
drop if v14 ==52017
drop if v14 ==62017
drop if v14 ==72017
drop if v14 ==82017
drop if v14 ==92017
drop if v14 ==102017
drop if v14 ==112017
drop if v14 ==122017

drop if v14 ==12018
drop if v14 ==22018
drop if v14 ==32018
drop if v14 ==42018
drop if v14 ==52018
drop if v14 ==62018
drop if v14 ==72018
drop if v14 ==82018
drop if v14 ==92018
drop if v14 ==102018
drop if v14 ==112018
drop if v14 ==122018


save "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean2.dta"



//Shorter Sample(2020m12-2021m3) // 
*keep if year==2020 | year==2021
*drop if month==4 | month==5 | month==6 | month==7 | month==8 |month==9 |month==10 |month==11 
*drop if v14==12020 
*drop if v14==22020 	
*drop if v14==32020 





use "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean2.dta"

// Generate year Var//
gen year=0
replace year=2019 if v14 ==12019 | v14 ==22019 | v14 ==32019 | v14 ==42019 | v14 ==52019 | v14 ==62019 | v14 ==72019 | v14 ==82019 | v14 ==92019 | v14 ==102019 | v14 ==112019 | v14 ==122019
replace year=2020 if v14 ==12020 | v14 ==22020 | v14 ==32020 | v14 ==42020 | v14 ==52020 | v14 ==62020 | v14 ==72020 | v14 ==82020 | v14 ==92020 | v14 ==102020 | v14 ==112020 | v14 ==122020
replace year=2021 if v14 ==12021 | v14 ==22021 | v14 ==32021 | v14 ==42021 | v14 ==52021 | v14 ==62021 | v14 ==72021 | v14 ==82021 | v14 ==92021 | v14 ==102021 | v14 ==112021 | v14 ==122021
replace year=2022 if v14 ==12022 | v14 ==22022 | v14 ==32022 | v14 ==42022 | v14 ==52022 | v14 ==62022 | v14 ==72022 | v14 ==82022 | v14 ==92022 | v14 ==102022 | v14 ==112022 | v14 ==122022

//Generate month Var//
gen month=0
replace month= 1 if v14 ==12019 | v14 ==12020 | v14 ==12021 | v14 ==12022
replace month= 2 if v14 ==22019 | v14 ==22020 | v14 ==22021 | v14 ==22022
replace month= 3 if v14 ==32019 | v14 ==32020 | v14 ==32021 | v14 ==32022
replace month= 4 if v14 ==42019 | v14 ==42020 | v14 ==42021 | v14 ==42022
replace month= 5 if v14 ==52019 | v14 ==52020 | v14 ==52021 | v14 ==52022
replace month= 6 if v14 ==62019 | v14 ==62020 | v14 ==62021 | v14 ==62022
replace month= 7 if v14 ==72019 | v14 ==72020 | v14 ==72021 | v14 ==72022
replace month= 8 if v14 ==82019 | v14 ==82020 | v14 ==82021 | v14 ==82022
replace month= 9 if v14 ==92019 | v14 ==92020 | v14 ==92021 | v14 ==92022
replace month= 10 if v14 ==102019 | v14 ==102020 | v14 ==102021 | v14 ==102022
replace month= 11 if v14 ==112019 | v14 ==112020 | v14 ==112021 | v14 ==112022
replace month= 12 if v14 ==122019 | v14 ==122020 | v14 ==122021 | v14 ==122022

save "/Users/besianroshi/Desktop/2021 Latest/2019-2021FullClean2.dta" , replace 


*BUNCHING*

*keep only loans in the appropriate year*
keep if year==2020 | year==2021

drop if v14==12020 
drop if v14==22020 	
drop if v14==32020
drop if v14==42020
drop if v14==52020
drop if v14==62020
drop if v14==72020
drop if v14==82020
drop if v14==92020
drop if v14==102020
drop if v14==112020
drop if v14==82021
drop if v14==92021


save "/Users/besianroshi/Desktop/2021 Latest/2019-2021Bunching.dta"


encode v27, generate(Purpose)

drop if Purpose==2
//Gen//
gen loan_1_relative=v10-125000	
gen log_loan_1_relative=log(v10)-log(125000)
* gen log_loan_1_relative==log(loan_1_relative)

gen log_v8=log(v8) 
gen log_v20=log(v20) 
gen log_v23=log(v23) 
gen log_v24=log(v24)

*Generate freq. variable*
egen frequency = count(1), by(loan_1_relative)


/*keep only loans within the specified minimum and maximum distance from the 125k threshold*/
     keep if (loan_1_relative >= -25000 & loan_1_relative <= 25000)
	*keep if (loan_1_relative >= -50000 & loan_1_relative <= 50000) & (log_loan_1_relative >= -0.51 & log_loan_1_relative <= 0.34)*
	
	/*create loan size bins*/
	
		gen loan_size_bin = round(loan_1_relative , 5000)
		local min_size = -5000
		local max_size =  5000
		local xaxis "Loan Amount {&minus} 125k(1000's)"
		local plotrange 400

	
		
		gen log_loan_size_bin = round(log_loan_1_relative, 0.001)
		local min_size = -0.51
		local max_size = 0.34
		local xaxis "Log(Loan Amount) {&minus} Log(125k)"
		local plotrange 0.5
		
		
	/*mean loan size in each bin*/
	egen mean_cf_loan_size = mean(v10), by(loan_size_bin)
	egen mean_log_cf_loan_size = mean(log(v10)), by(log_loan_size_bin)
	

	
	 
bunching log_loan_size_bin log_v8 log_v20 log_v23 log_v24, kink(0) s0(0.1) s1(0.05) m(141)
*bunch_count  log_loan_1_relative log_v8 if  Purpose==3*
*bunch_count  loan_size_bin log_v8 if  Purpose==3*
* bunch_count  log_loan_size_bin log_v8 if  Purpose==3

*replace loan_1_relative = round(loan_1_relative,4000)
replace loan_1_relative = round(loan_1_relative,5000)


gen freq = 1

keep             freq      loan_1_relative 
collapse (count) freq , by(loan_1_relative)

*** Step 2. Calculate bunching fractions and standard errors ***;

local region 100000
local igh =  `region'/1000
local igl = -`region'/1000


*bunch_count loan_1_relative freq , bpoint(0) binwidth(4000) degree(7) ig_low(-12) ig_high(12) low_bunch(-1) high_bunch(1) plot(1)
bunch_count loan_1_relative freq , bpoint(0) binwidth(5000) degree(7) ig_low(-10) ig_high(10) low_bunch(-1) high_bunch(1) plot(1)


local beta_hat: display %4.3f r(b)
local beta_se: display %4.3f r(b_se)
local mg_change: display %4.3f ln(1/0.9)
local elasticity: display %4.3f `beta_hat'/(50*`mg_change')



twoway (scatter plotabc2 plotabc1, $scatter_options ) ///
		(line plotabc3 plotabc1, $line_options), ///
		$twoway_options xline(`low_bunch', lcolor(gs11) lpattern(dash)) ///
		xline(0, lcolor(gs6)) ///
		xline(`high_bunch', lcolor(gs11) lpattern(dash)) ///
		text(95000 17 "Excess Mass (b) = `beta_hat'") ///
		text(90000 16 "Standard Error = `beta_se'") ///
		text(85000 18 "Implied elasticiy (e) = `elasticity'") ///
		text(80000 16 "Optimal Pol. degree: `q'")






capture noisily bunch_count log_loan_1_relative frequency , bpoint(0) binwidth(0.001) degree(7) ig_low(-51) ig_high(34) low_bunch(-7) high_bunch(7) nboot(250) plot(1)  

*capture noisily bunch_count loan_1_relative freq , bpoint(0) binwidth(1000) degree(7) ig_low(-3000) ig_high(3000) low_bunch(-15000) high_bunch(15000) nboot(250) plot(1)  

