set more off
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_After_Replacing_Missing.dta", clear

** For reference, number of kids turning 10 daily regardless of learning

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen t_ten_daily_`x'_f=(age10_female`x')/365
*format %30.15f t_ten_daily_`x'_f
gen t_ten_daily_`x'_m=(age10_male`x')/365
*format %30.15f t_ten_daily_`x'_m
gen t_ten_daily_`x'_both=t_ten_daily_`x'_f+t_ten_daily_`x'_m 
*format %30.15f t_ten_daily_`x'_both

egen sum_t_ten_daily_`x'_f=sum(t_ten_daily_`x'_f)
*format %30.15f sum_t_ten_daily_`x'_f
egen sum_t_ten_daily_`x'_m=sum(t_ten_daily_`x'_m)
*format %30.15f sum_t_ten_daily_`x'_m
egen sum_t_ten_daily_`x'_both=sum(t_ten_daily_`x'_both)
*format %30.15f sum_t_ten_daily_`x'_both
}
*

** Focusing on lost potential

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen learningpoverty_female_`x' = .
gen learningpoverty_male_`x' = .
gen learningrich_female_`x' = .
gen learningrich_male_`x' = .
}
*

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

replace learningpoverty_female_`x' = learningpoverty_female+((2015-`x')*0.0068)
replace learningpoverty_male_`x' = learningpoverty_male+((2015-`x')*0.0068)
replace learningpoverty_female_`x' = 0 if learningpoverty_female_`x'<0&learningpoverty_female_`x'!=.
replace learningpoverty_male_`x' = 0 if learningpoverty_male_`x'<0&learningpoverty_male_`x'!=.
}
*

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen lostpotential_`x'_f=(age10_female`x'*learningpoverty_female_`x')/365
*format %30.15f lostpotential_`x'_f
gen lostpotential_`x'_m=(age10_male`x'*learningpoverty_male_`x')/365
*format %30.15f lostpotential_`x'_m
gen lostpotential_`x'_both=lostpotential_`x'_f+lostpotential_`x'_m
*format %30.15f lostpotential_`x'_both
egen lost_sum_`x'_f=sum(lostpotential_`x'_f)
*format %30.15f lost_sum_`x'_f
egen lost_sum_`x'_m=sum(lostpotential_`x'_m)
*format %30.15f lost_sum_`x'_m
egen lost_sum_`x'_both=sum(lostpotential_`x'_both)
*format %30.15f lost_sum_`x'_both
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

replace learningrich_female_`x'=1-learningpoverty_female_`x'
replace learningrich_male_`x'=1-learningpoverty_male_`x'
}
*

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen oppsecured_`x'_f=(age10_female`x'*learningrich_female_`x')/365
*format %30.15f oppsecured_`x'_f
gen oppsecured_`x'_m=(age10_male`x'*learningrich_male_`x')/365
*format %30.15f oppsecured_`x'_m
gen oppsecured_`x'_both=oppsecured_`x'_f+oppsecured_`x'_m
*format %30.15f oppsecured_`x'_both
egen sum_os_`x'_f=sum(oppsecured_`x'_f)
*format %30.15f sum_os_`x'_f
egen sum_os_`x'_m=sum(oppsecured_`x'_m)
*format %30.15f sum_os_`x'_m
egen sum_os_`x'_both=sum(oppsecured_`x'_both)
*format %30.15f sum_os_`x'_both
}
sort countrycode


save "$interim/Lost_Potential_Database_With_Indicators.dta", replace
