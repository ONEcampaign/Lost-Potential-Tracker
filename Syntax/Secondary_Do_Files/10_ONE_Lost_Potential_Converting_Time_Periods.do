*** Going from Daily Lost Potential to other measures



*Note 24*60=1440 for minutes in a day
* 24*60*60=86400 seconds in a day


foreach x in 2015	2016	2017	2018	2019	2020	2021	2022	2023	2024	2025	2026	2027	2028	2029	2030 {

gen lost_sum_`x'_f_per_year = lost_sum_`x'_f*365
gen lost_sum_`x'_m_per_year = lost_sum_`x'_m*365
gen lost_sum_`x'_both_per_year = lost_sum_`x'_both*365

gen lost_sum_`x'_f_per_hour = lost_sum_`x'_f/24
gen lost_sum_`x'_m_per_hour = lost_sum_`x'_m/24
gen lost_sum_`x'_both_per_hour = lost_sum_`x'_both/24

gen lost_sum_`x'_f_per_minute = lost_sum_`x'_f/1440
gen lost_sum_`x'_m_per_minute = lost_sum_`x'_m/1440
gen lost_sum_`x'_both_per_minute = lost_sum_`x'_both/1440

gen lost_sum_`x'_f_per_second = lost_sum_`x'_f/86400
gen lost_sum_`x'_m_per_second = lost_sum_`x'_m/86400
gen lost_sum_`x'_both_per_second = lost_sum_`x'_both/86400
}
*

** Can then drop lost_sum_`x'_f and rename lost_sum_`x'_f_per_XXX to lost_sum_`x'_f and similar, and integrate into the outputting tables and combining tables
