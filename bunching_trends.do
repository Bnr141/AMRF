***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** 
*****     Data Cleaning
***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

drop v4
drop v5
drop v6
drop v15
drop v16
drop v17
drop v18
drop v19
drop v26
drop v28
drop v30
drop v34
drop v35
drop v36
drop v37
drop v42
drop v73
drop v81
drop v86
drop v102

do do_Mod
do MOD_Trends


encode v27, generate(Purpose)
drop if Purpose==2

gen loan_1_relative=v10-125000
keep if (loan_1_relative >= -50000 & loan_1_relative <= 50000)

replace v14=1 if v14 == 122020
replace v14=2 if v14 == 12021
replace v14=3 if v14 == 22021
replace v14=4 if v14 == 32021
replace v14=5 if v14 == 42021
replace v14=6 if v14 == 52021
replace v14=7 if v14 == 62021
replace v14=8 if v14 == 72021



***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** 
*****    Figures style
***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** *****

global scatter_options =  "connect(line) msize(tiny) lcolor(black) mcolor(black) lwidth(medthick)"
global line_options =  "lcolor(gs7)"
global  twoway_options = "graphregion(color(white)) xtitle(Taxable Income Relative to the First Income Tax Kink (%)) ytitle(Frequency) yscale(titlegap(*10)) xscale(range(-32 32) titlegap(*7)) legend( label(1 Actual Distribution) label(2 Counterfactual Distribution)) xlabel(-30(10)30, labs(small)) ylabel(, format(%12.0fc) labs(small))"

***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** *****  ***** 
*****  Figure : Evolution of Bunching 
***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** 

** Panel a: Bunching Trends
** -----------------------------------------------**

*We define bunchers following the definition of the bunching window for pure wage earners: LB=-5, UB=0

gen loan_size_bin = round(loan_1_relative , 5000)


cap drop buncher
gen 	buncher=1 if loan_size_bin>=-5000 & loan_size_bin<=0 
replace buncher=0 if buncher==.

*Create auxiliary tables which will be used as inputs for the plot
cap drop aux aux2 aux3 aux4
gen aux=.
gen aux2=.
gen aux3=.
gen aux4=.
local c=1
forvalues v14=1(1)8{
	
	replace aux3= `v14' if _n==`c'
	
	*Count absolute number
	count if buncher==1 & v14==`v14' 
	local n_buncher = `r(N)'
	replace aux=`n_buncher' if _n==`c'
	
	*Count number expressed as the total taxpayers of the year
	count if v14==`v14'
	local n_month = `r(N)'
	local ratio = `n_buncher'/`n_month'
	replace aux2=`ratio' if _n==`c'
	
	*Count number expressed as the total number of bunchers
	count if buncher==1
	local total_bunchers = `r(N)'
	local ratio = `n_buncher'/`total_bunchers' 
	replace aux4=`ratio' if _n==`c'
	
	local c=`c'+1
}

twoway (scatter aux4 aux3, ///
			c(l) graphregion(color(white)) ///
			yscale(r(0 0.1) titlegap(*10)) ylabel(0(0.01)0.1,format(%10.0fc) labs(small))  lcolor(black) mcolor(black) ///
			xtitle(Month) ytitle("% of Bunchers over total borrowers in each month", axis(1)) legend(label(1 "Share of Bunchers"))) ///
		(scatter aux aux3, ///
			c(l) graphregion(color(white)) msymbol(T) lcolor(gs10)  mcolor(gs10) yaxis(2) ylabel(,format(%9.0fc) labs(small) axis(2) ) /// 
			legend(label(2 "Number of Bunchers")) ytitle(N of Bunchers (Thousands), ///
		axis(2))  yscale(titlegap(*10) axis(2)) xscale(titlegap(*7)) xlabel(1(1)8, labs(small)))



*************************************************************************************
***************			3. Persistence around the notch		*********************
*************************************************************************************

**  Panel b: Bunching Persistence in Consecutive Years
** ------------------------------------------------------------**

*Calculate bins in the full range (not only -30 to 30) because some individuals move a lot

gen dist_aux = taxable_lab_income_bpc - gup_2
gen dist_aux_perc=dist_aux/gup_2*100
gen dist_aux_perc_adj = factor*dist_aux_perc

*Calculate from -100 to 100
gen bin_bracket_total=.
local aux_low = -200
forvalues i=-100(1)100{
local   aux_high = `aux_low'+2
replace bin_bracket_total = `i' if dist_aux_perc_adj>`aux_low' & dist_aux_perc_adj<=`aux_high'
local aux_low = `aux_low'+2
local aux_high = `aux_high'+2
}

*Create lags and forwards
bysort nii_ret: gen bin_bracket_l = bin_bracket_total[_n-1]
bysort nii_ret: gen bin_bracket_f = bin_bracket_total[_n+1] if lab_income!=.

*Create absolute value for bin movement
gen 	brackets_move = bin_bracket_total - bin_bracket_l
replace brackets_move = abs(brackets_move)

cap drop persiste4
gen 	persiste4 = 100 if brackets_move<=4
replace persiste4 = 0 if persiste4 == .
replace persiste4 = . if year==2010
replace persiste4 = . if lab_income==.

clear mata
rdplot persiste4 bin_bracket_total if abs(bin_bracket_total)<31, ///
	nbins(15 15) ci(95) ///
	graph_options(graphregion(color(white)) legend(off) xlabel(-30(10)30) ytitle("Probability of persistence within 4 bins") xtitle("Taxable Income Relative to the First Income Tax Kink (%)"))
graph export "$results/Fig_4_panel_b.eps", replace 
graph export "$results/Fig_4_panel_b.png", width(2400) replace	


*Local Estimate of Discontinuity at 0
gen treat=1 if bin_bracket_total<0
replace treat=0 if bin_bracket_total>0 & bin_bracket_total<.
ttest persiste4 if inrange(bin_bracket_total,-1,1), by(treat)

timer off 1
timer list 1

