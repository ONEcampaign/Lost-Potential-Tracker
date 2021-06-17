
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_Scenarios_Before_Indicators.dta", clear

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_lostpotential_`x'_f=(age10_female`x'*h_lp_`x'_female)/365
gen h_lostpotential_`x'_m=(age10_male`x'*h_lp_`x'_male)/365
gen h_lostpotential_`x'_both=h_lostpotential_`x'_f+h_lostpotential_`x'_m
egen h_lost_sum_`x'_f=sum(h_lostpotential_`x'_f)
egen h_lost_sum_`x'_m=sum(h_lostpotential_`x'_m)
egen h_lost_sum_`x'_both=sum(h_lostpotential_`x'_both)
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {
gen h_learningrich_`x'_f=1-h_lp_`x'_female
gen h_learningrich_`x'_m=1-h_lp_`x'_male
}
*


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen h_oppsecured_`x'_f=(age10_female`x'*h_learningrich_`x'_f)/365
gen h_oppsecured_`x'_m=(age10_male`x'*h_learningrich_`x'_m)/365
gen h_oppsecured_`x'_both=h_oppsecured_`x'_f+h_oppsecured_`x'_m
egen h_sum_os_`x'_f=sum(h_oppsecured_`x'_f)
egen h_sum_os_`x'_m=sum(h_oppsecured_`x'_m)
egen h_sum_os_`x'_both=sum(h_oppsecured_`x'_both)
}
sort countrycode


save "$interim/Lost_Potential_Database_With_Indicators_Halving.dta", replace
