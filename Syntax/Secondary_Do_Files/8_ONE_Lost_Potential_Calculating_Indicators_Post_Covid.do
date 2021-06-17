
**************************************************
**************Calculating indicators**************
**************************************************


***************************PER YEAR********************************************
**Number of children everyday who reach age 10 and have lost potential**

use "$interim/Lost_Potential_Database_Before_Indicators_Covid.dta", clear


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {


gen learningrich_femalecovid_`x' = .
gen learningrich_malecovid_`x' = .
}
*

foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen lostpotential_`x'_f_covid=(age10_female`x'*learningpoverty_femalecovid_`x')/365
gen lostpotential_`x'_m_covid=(age10_male`x'*learningpoverty_malecovid_`x')/365
gen lostpotential_`x'_both_covid=lostpotential_`x'_f_covid+lostpotential_`x'_m_covid
egen lost_sum_`x'_f_covid=sum(lostpotential_`x'_f_covid)
egen lost_sum_`x'_m_covid=sum(lostpotential_`x'_m_covid)
egen lost_sum_`x'_both_covid=sum(lostpotential_`x'_both_covid)
}
*

**Number of children everyday who reach age 10 and have their opportunity secured**
foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

replace learningrich_femalecovid_`x'=1-learningpoverty_femalecovid_`x'
replace learningrich_malecovid_`x'=1-learningpoverty_malecovid_`x'
}
*


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen oppsecured_`x'_f_covid=(age10_female`x'*learningrich_femalecovid_`x')/365
gen oppsecured_`x'_m_covid=(age10_male`x'*learningrich_malecovid_`x')/365
gen oppsecured_`x'_both_covid=oppsecured_`x'_f_covid+oppsecured_`x'_m_covid
egen sum_os_`x'_f_covid=sum(oppsecured_`x'_f_covid)
egen sum_os_`x'_m_covid=sum(oppsecured_`x'_m_covid)
egen sum_os_`x'_both_covid=sum(oppsecured_`x'_both_covid)
}
sort countrycode

save "$interim/Lost_Potential_Database_With_Indicators_Covid.dta", replace
