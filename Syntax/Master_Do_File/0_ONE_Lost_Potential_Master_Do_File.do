
********************************************************
**********Lost Potential Tracker Master Do File*********
********************************************************

**** This master do file sets the do files to be used in calculating the Lost Potential Tracker
**** Before using, set the globals below to suit the file locations in your computer
**** Not all of the secondary do files need to be run each time, i.e. if not interested in the halving or ending LP scenarios, you can * these out

set more off
dis "`c(username)'"

* Users
		if "`c(username)'"=="alasd" {
		global rawdata "C:\Users\alasd\Fab Inc Dropbox\Fab Inc Projects\ONE campaign\Data\Final Share\RawData"
		global interim "C:\Users\alasd\Fab Inc Dropbox\Fab Inc Projects\ONE campaign\Data\Final Share\Interim"
		global syntax "C:\Users\alasd\Fab Inc Dropbox\Fab Inc Projects\ONE campaign\Data\Final Share\Syntax\Secondary_Do_Files"
		global outputs "C:\Users\alasd\Fab Inc Dropbox\Fab Inc Projects\ONE campaign\Data\Final Share\Outputs"
		
		}		
		if "`c(username)'"=="" {
		global rawdata ""
		global interim ""
		global syntax ""
		global outputs ""
}
*
clear all

** Before running for the first time, install 'wbopendata' and 'kountry' plug ins
* ssc install wbopendata
* ssc install kountry

** Re-running when wanting to update:
	** Almost all the data, including the learning poverty rates, comes from the World Bank API which will automatically pull the latest available
	** The only thing that needs to be manually updated is the UN Population data, which is updated every two years
	** The process for accessing this is described in more detail in the '2_ONE_Lost_Potential_Population_Datasets' do files
	** Once those steps have been followed, this should be saved over the current data in the RawData folder.



** Learning Potential Datasets - from World Bank
** Here we automatically import the latest data from the World Bank
** We bring in the rates for males, females and total for all countries with data
** We use by gender as first choice
** We use the total as second choice, if by gender is missing
** We use the income group average, if the total is missing
do "$syntax//1_ONE_Lost_Potential_Learning_Poverty_Datasets"

** Population Datasets (single age, 10 Year Olds) - from UN
** Here we input from CSV single age population data from the UN (automatic only available for age groups)
** The CSV will need manual updating when new data is available (see pre-preparation instructions within do file)
** We bring in the 'estimates' for existing data (2015-2020)
** And the 'medium variant' projections for future data (2021-2030)
** We take only the 10 year old data (we have checked that this is smoothed and not irregularly large at age 5,10 etc.)
** We convert from the UN country codes to the World Bank country codes 
do "$syntax//2_ONE_Lost_Potential_Population_Datasets"

** Additional Datasets
** Bring in other datasets as may be necessary
** Brought from World Bank data, latest value available
** The majority of these are not actually used, but were included for checks and analysis
do "$syntax//3_ONE_Lost_Potential_Additional_Datasets"

** Intermediate data steps - a series of processing steps
** Ensuring the income groups and regions are in line
** Merging the above final datasets
** Double checking if any countries with data still missing
do "$syntax//4_ONE_Lost_Potential_Intermediate_Data_Steps"


** For the simplified tables currently used in the tracker

** Calculating Indicators
** On an annual basis between 2015-2030
** Calculating the lost potential, opportunity secured and lost days of the children turning 10 each year
do "$syntax//5_ONE_Lost_Potential_Calculating_Indicators"

	** Impact of COVID
	do "$syntax//8_ONE_Lost_Potential_Covid_Impact"
	do "$syntax//8_ONE_Lost_Potential_Calculating_Indicators_Post_Covid"
	
** For combined tables:
	** Combining the tables 
	** Simplified is just the main data used in the final tracker
	do "$syntax//10_ONE_Lost_Potential_Combining_Tables_Simplified"

	
	
	
	
	
	
	
** /* If only using the simplified data, you can toggle the rest of this do file out with the /* 
** It can take a long time to run everything
 /*

** For this section - will get the full tables of all scenarios
** Atleast do files 1-5 will need to be run first for this section
** For the scenarios
	** Scenarios for Halving, Ending LP
	do "$syntax//7_ONE_Lost_Potential_Scenarios"
	
	do "$syntax//7_ONE_Lost_Potential_Scenarios_Calculating_Indicators_Halving"
	do "$syntax//7_ONE_Lost_Potential_Scenarios_Calculating_Indicators_Ending"
	
	** Post-Covid Scenarios for Halving, Ending LP
	do "$syntax//8_ONE_Lost_Potential_Scenarios_Post_Covid"
	
	do "$syntax//8_ONE_Lost_Potential_Scenarios_Calculating_Indicators_Halving_Post_Covid"
	do "$syntax//8_ONE_Lost_Potential_Scenarios_Calculating_Indicators_Ending_Post_Covid"

** For combined tables:
	** Combining the tables 
	** Full includes all the scenarios
	do "$syntax//10_ONE_Lost_Potential_Combining_Tables_Full"
	

	

	
** For individual tables:
**Atleast do files 1-5 and 7 will need to be run first for this section
	** Outputting Tables
	** Outputting the annual results between 2015-2030
	** For global, income groups and regions
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Children_Turning_Ten"
	
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Lost_Potential"
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured"

	** Outputting Tables for halving LP scenarios
	** Outputting the annual results between 2015-2030
	** For global, income groups and regions
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Lost_Potential_Halving"
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured_Halving"

	** Outputting Tables for ending LP scenarios
	** Outputting the annual results between 2015-2030
	** For global, income groups and regions
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Lost_Potential_Ending"
	do "$syntax//6_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured_Ending"

**	Atleast do files 1-5 and 7 will need to be run first for this section
	** Post-Covid BAU Tables
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Lost_Potential_Post_Covid"
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured_Post_Covid"

	** Post-Covid Outputting Tables for halving LP scenarios
	** Outputting the annual results between 2015-2030
	** For global, income groups and regions
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Lost_Potential_Halving_Post_Covid"
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured_Halving_Post_Covid"

	** Post-Covid Outputting Tables for ending LP scenarios
	** Outputting the annual results between 2015-2030
	** For global, income groups and region
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Lost_Potential_Ending_Post_Covid"
	do "$syntax//9_ONE_Lost_Potential_Outputting_Tables_Opportunity_Secured_Ending_Post_Covid"




** If going from Daily to other time periods, incorporate these calculations
	*do  "$syntax//10_ONE_Lost_Potential_Converting_Time_Periods"