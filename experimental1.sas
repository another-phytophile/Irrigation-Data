/*libname statement to access the irrigation folder*/

libname irrproj 'C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data' ;

/*clean the data*/

data Irrproj.Station1Clean;
	set Irrproj.Station1;

	length VWC1Clean 8;
	if VWC_1 < 25 then VWC1Clean = ".";
	else if VWC_1> 47 then VWC1Clean = ".";
	else VWC1Clean =  VWC_1*1;

	length VWC13Clean 8;
	if VWC_13 < 25 then VWC13Clean = ".";
	else if VWC_13> 47 then VWC13Clean = ".";
	else VWC13Clean =  VWC_13*1;

	length LC11Clean 8;
	if Load_Cells_1_1 < 5 then LC11Clean = ".";
	else if Load_Cells_1_1> 8 then LC11Clean = ".";
	else LC11Clean =  Load_Cells_1_1*1;

	length LC21Clean 8;
	if Load_Cells_2_1 < 5 then LC21Clean = ".";
	else if Load_Cells_2_1> 8 then LC21Clean = ".";
	else LC21Clean =  Load_Cells_2_1*1;

drop VWC_1 VWC_13 Load_Cells_1_1 Load_Cells_2_1;
run;

/*fit a nonparametric model to the data*/
proc loess data = Irrproj.Station1Clean plots=none;
	model LC21Clean=TIMESTAMP/smooth = 0.0025;
	score;
	ods output ScoreResults=mininprogressLC21;
run;
/*use the derivative and other measurments to get a local minimum*/
proc expand data=mininprogressLC21 out=mininprogress2;
convert p_LC21Clean=signdif/transformout=(dif sign movsum 2 lead); 
convert p_LC21Clean=plusone/transformout = (dif 1);
convert LC11Clean=tmeanLC11/transformout = (reverse movmin 200 reverse);
convert LC21Clean=tmeanLC21/transformout = (reverse movmin 200 reverse);
convert VWC13Clean=tmeanVWC13/transformout = (reverse movmin 200 reverse);
convert VWC1Clean=tmeanVWC1/transformout= (reverse movmin 200 reverse);
/*if plusone is negative, we have a local minimum*/
run;
	
/*continuing the last step*/
data Irrproj.Station1MinData;
	set mininprogress2;
	length lminLC21 8;
	if (signdif=0) & (plusone<0) then lminLC21 = tmeanLC21;
	else lminLC21 = .;

	length lminLC11 8;
	if (signdif=0) & (plusone<0) & (tmeanLC11>5) then lminLC11 = tmeanLC11;
	else if (signdif=0) & (plusone<0) & (tmeanLC11<5) then lminLC11 = LC11Clean;
	else lminLC11 = .;

	length lminVWC1 8;
	if (signdif=0) & (plusone<0) & (tmeanVWC1>25) then lminVWC1 = tmeanVWC1;
	else lminVWC1 = .;

	length lminVWC13 8;
	if (signdif=0) & (plusone<0) then lminVWC13 = tmeanVWC13;
	else lminVWC13 = .;
run;

/*graph the data */

title "Minimum Points For Data";
ODS GRAPHICS on/
	width=20in;

proc sgplot data=Irrproj.Station1MinData noautolegend;
scatter x=TIMESTAMP y=LC21Clean;
series x=TIMESTAMP y=p_LC21Clean;
scatter x=TIMESTAMP y= lminLC21 / markerattrs=(symbol=circlefilled color=red);
run;

proc sgplot data=Irrproj.Station1MinData noautolegend;
scatter x=TIMESTAMP y=LC11Clean;
scatter x=TIMESTAMP y= lminLC11 / markerattrs=(symbol=circlefilled color=red);
run;

proc sgplot data=Irrproj.Station1MinData noautolegend;
scatter x=TIMESTAMP y=VWC1Clean;
scatter x=TIMESTAMP y= lminVWC1 / markerattrs=(symbol=circlefilled color=red);
run;

proc sgplot data=Irrproj.Station1MinData noautolegend;
scatter x=TIMESTAMP y=VWC13Clean;
scatter x=TIMESTAMP y= lminVWC13 / markerattrs=(symbol=circlefilled color=red);
run;

/*create a subset of the data that contains only the local mins*/

data Irrproj.localminsonly;
	set Irrproj.Station1Mindata;
	keep TIME Obs TIMESTAMP Date Light_dark_period lminLC21 lminLC11 lminVWC1 lminVWC13;
	if lminLC21 ='' then delete;
run;
/* Show the locations of the slope changes (where y = 1) on a graph */
/*proc print data=avis6;*/
/*	var LC21Clean TIMESTAMP tmeanLC21 lmin;*/
/*run;*/
/**/
/*/*data plottest*/*/
/*/*set nptrd;*/*/
/**/
/**/
/*proc sgplot data = Irrproj.Station1clean;*/
/*	scatter y = LC21Clean x=TIMESTAMP;*/
/*run;*/
/**/
/*proc loess data = Irrproj.Station1clean;*/
/*	model LC21Clean=TIMESTAMP;*/
/*run;*/
/*/*no longer in use*/*/
/*/*proc sgplot data=station1transition;*/*/
/*/*	vbox VWC1Clean/ DISPLAYSTATS=(MEAN MAX MIN MEDIAN); */*/
/*/*run;*/*/
/*/**/*/
/*/*proc sgplot data=station1transition;*/*/
/*/*vbox VWC13Clean/ DISPLAYSTATS=(MEAN MAX MIN MEDIAN);*/*/
/*/*run;*/*/
/*/**/*/
/*/*proc sgplot data=station1transition;*/*/
/*/*vbox LC11Clean/ DISPLAYSTATS=(MEAN MAX MIN MEDIAN);*/*/
/*/*run;*/*/
/*/**/*/
/*/*proc sgplot data=station1transition;*/*/
/*/*vbox LC21Clean/ DISPLAYSTATS=(MEAN MAX MIN MEDIAN);*/*/
/*/*run;*/*/

/*dm 'odsresults; clear';*/


