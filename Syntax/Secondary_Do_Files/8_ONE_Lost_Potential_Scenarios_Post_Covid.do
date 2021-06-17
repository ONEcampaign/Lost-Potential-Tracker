***************************************************
**Scenarios - Halving and Ending Learning Poverty Including Covid**
***************************************************
set more off
use "$interim/Lost_Potential_Database_Before_Indicators_Covid.dta", clear

** We want previous progress up to 2020, then we want to half of the original + impact of covid for halving, still zero for ending

gen target_h_lp_female = learningpoverty_female/2
gen target_h_lp_male = learningpoverty_male/2
gen target_e_lp_female = 0
gen target_e_lp_male = 0

foreach x in 2015	2016	2017	2018	2019 {

gen h_lp_`x'_femalecovid = .
replace h_lp_`x'_femalecovid = learningpoverty_female+(((target_h_lp_female-learningpoverty_female))/((2030-2015)/(`x'-2015)))
replace h_lp_`x'_femalecovid = learningpoverty_female if `x'==2015

gen h_lp_`x'_malecovid = .
replace h_lp_`x'_malecovid = learningpoverty_male+(((target_h_lp_male-learningpoverty_male))/((2030-2015)/(`x'-2015)))
replace h_lp_`x'_malecovid = learningpoverty_male if `x'==2015

gen e_lp_`x'_femalecovid = .
replace e_lp_`x'_femalecovid = learningpoverty_female+(((target_e_lp_female-learningpoverty_female))/((2030-2015)/(`x'-2015)))
replace e_lp_`x'_femalecovid = learningpoverty_female if `x'==2015

gen e_lp_`x'_malecovid = .
replace e_lp_`x'_malecovid = learningpoverty_male+(((target_e_lp_male-learningpoverty_male))/((2030-2015)/(`x'-2015)))
replace e_lp_`x'_malecovid = learningpoverty_male if `x'==2015

}
*


gen target_h_lp_femalecovid = learningpoverty_femalecovid/2
gen target_h_lp_malecovid = learningpoverty_malecovid/2
gen target_e_lp_femalecovid = 0
gen target_e_lp_malecovid = 0








foreach x in 	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_lp_`x'_femalecovid = .
replace h_lp_`x'_femalecovid = learningpoverty_femalecovid_2020+(((target_h_lp_femalecovid-learningpoverty_femalecovid_2020))/((2030-2020)/(`x'-2020)))
replace h_lp_`x'_femalecovid = learningpoverty_femalecovid_2020 if `x'==2020

gen h_lp_`x'_malecovid = .
replace h_lp_`x'_malecovid = learningpoverty_malecovid_2020+(((target_h_lp_malecovid-learningpoverty_malecovid_2020))/((2030-2020)/(`x'-2020)))
replace h_lp_`x'_malecovid = learningpoverty_malecovid_2020 if `x'==2020

gen e_lp_`x'_femalecovid = .
replace e_lp_`x'_femalecovid = learningpoverty_femalecovid_2020+(((target_e_lp_femalecovid-learningpoverty_femalecovid_2020))/((2030-2020)/(`x'-2020)))
replace e_lp_`x'_femalecovid = learningpoverty_femalecovid_2020 if `x'==2020

gen e_lp_`x'_malecovid = .
replace e_lp_`x'_malecovid = learningpoverty_malecovid_2020+(((target_e_lp_malecovid-learningpoverty_malecovid_2020))/((2030-2020)/(`x'-2020)))
replace e_lp_`x'_malecovid = learningpoverty_malecovid_2020 if `x'==2020

}
*


save "$interim/Lost_Potential_Database_Scenarios_Before_Indicators_Covid.dta", replace
