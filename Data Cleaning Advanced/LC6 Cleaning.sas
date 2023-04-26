/*Author: Haozhe (Jerry)Yu*/
/*Purpose:*/
/*        1. Read in a slightly modified LC dataset from excel*/
/*        2. Redo the loess smoothing procedure with lc_1_6, because they data is so anomalous
/*Date: 4/20/2023*/
/*Changelog: */
/*          4/20/23: set up program */

/*clear previous log*/
dm "log;clear;output;clear;";

/*clear previous output*/
ods listing close;
ods html close;
ods html;

/*library & fileref statements*/
x ' cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\Data Cleaning Advanced\SAS and Final Data Sets';
libname Results '.';

x 'cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\Data Cleaning Advanced\Raw Data Sets';
filename RawData ".\Whole crop water use analysis zone by zone (for Jerry).xlsx";

x 'cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\SAS Data Sets';
/*create library for data*/
libname irrproj '.';

data Lc_1_6 Results.LC6Sorting (keep=Timestamp Date Time Light_dark_period LCClean1_6 LCClean2_6);
set Irrproj.mastersasfileclean;
where Timestamp >'08nov2020:10:25:00'dt;
run;

proc loess data=Results.LC6Sorting plots=none;
  model  LCClean1_6  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_6  (drop = smoothingparameter scoredata);
run;

proc loess data=Results.LC6Sorting plots=none;
  model  LCClean2_6  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_6  (drop = smoothingparameter scoredata);
run;

data Results.LC6LoessResults ;
  merge p1LCClean1_6 p1LCClean2_6;
  by TIMESTAMP;
run;

/*Reshape to get all predicted values 
 in single record for easier processing*/
proc transpose data = Results.LC6LoessResults 
               out = Results.LC6LoessTransResults 
               prefix = obs;
  var p_LCClean1_6 p_LCClean2_6;
  id obs;
run;

/*Locate the extrema*/
data Results.LC6Extrema (keep = obs type _NAME_);
  set Results.LC6LoessTransResults;
*Group observed values into array
  ;
  array aval[*] obs:;
    *buffer at each end of graph to avoid edge effects;
  criterion = 2;
   *Loop through array:
    - Save observation number in case we find extrama
    - Determine change from previous/next predicted value
    - If we find max or min, then label and output
  ;
  do j = criterion+1 to dim(aval)-criterion-1;
    obs = j;
    SignAhead = sign(aval[j+1]-aval[j]);
    SignBehind = sign(aval[j]-aval[j-1]);
    if SignAhead < SignBehind then do;
        Type = "Max";
        output Results.LC6Extrema;
      end;
      else if SignAhead > SignBehind then do;
          Type = "Min";
          output Results.LC6Extrema;
        end;
  end;
run;

/*Check the data to see if the number of estimated minimums and maximums are reasonable*/
/*preliminary sorting step*/
proc sort data = Results.LC6Extrema;
    by _NAME_;
run;
/*Checks frequency of maxs and mins for each variable*/
proc freq data =Results.LC6Extrema;
    by _NAME_;
    tables type;
run;

/*START OF MINS PROCESSING*/

/*Find original records that are 
  within D spots of extrema*/
data Neighborhoodmin(drop = nbrhood d);
  *Only bring in records of the extrema type we want;
  set Results.LC6Extrema(where = (lowcase(type) = "min"));

  *Set neighborhood width for search;
  nbrhood = 30;

  *Keep track of which local extrema;
  Extrema + 1;
  
  *Find records within the neighborhood;
  do d = -nbrhood to nbrhood;
    Rec = Obs + d;
    set Results.LC6LOESSRESULTS(drop = obs) point = Rec;
    output;
  end;
run;

%macro mins (VOI); /*VOI is the only parameter we have to set for this entire macro*/
%let NSortmin =NSortmin%sysfunc(tranwrd(&VOI,%str( ),%str(NSortmin)));/* add prefies ot VOI for use in the code elsewhere*/
%let p =p_%sysfunc(tranwrd(&VOI,%str( ),%str(p_)));
%let MinResults =MinResults%sysfunc(tranwrd(&VOI,%str( ),%str(MinResults)));
%let min =min%sysfunc(tranwrd(&VOI,%str( ),%str(min)));
/*start of code*/
proc sort data = Neighborhoodmin (where = (not missing(&VOI))) 
          out = &NSortmin;
          where _NAME_="&p";
  by Extrema Type &VOI &p;
run;

proc sort data = &NSortmin  
          out = &MinResults (rename = &VOI = &min keep = &VOI TIMESTAMP )
          nodupkey ; 
  by Extrema Type;
run;

proc sort data = &MinResults;
By TIMESTAMP;
run;
%mend mins;

%mins ( LCClean1_6 );

%mins ( LCClean2_6 );

/*START OF MAX PROCESSING*/

/*Find original records that are 
  within D spots of extrema*/
data Neighborhoodmax(drop = nbrhood d);
  *Only bring in records of the extrema type we want;
  set Results.LC6Extrema(where = (lowcase(type) = "max"));

  *Set neighborhood width for search;
  nbrhood = 30;

  *Keep track of which local extrema;
  Extrema + 1;
  
  *Find records within the neighborhood;
  do d = -nbrhood to nbrhood;
    Rec = Obs + d;
    set Results.LC6LoessResults(drop = obs) point = Rec;
    output;
  end;
run;

%macro maxes (VOI); /*VOI is the only parameter we have to set for this entire macro*/
%let NSortmax =NSortmax%sysfunc(tranwrd(&VOI,%str( ),%str(NSortmax)));/* add prefies ot VOI for use in the code elsewhere*/
%let p =p_%sysfunc(tranwrd(&VOI,%str( ),%str(p_)));
%let MaxResults =MaxResults%sysfunc(tranwrd(&VOI,%str( ),%str(MaxResults)));
%let max =max%sysfunc(tranwrd(&VOI,%str( ),%str(max)));
/*start of code*/
proc sort data = Neighborhoodmax (where = (not missing(&VOI))) 
          out = &NSortmax;
          where _NAME_="&p";
  by Extrema Type &VOI &p;
run;

proc sort data = &NSortmax  
          out = &MaxResults (rename = &VOI = &max keep = &VOI TIMESTAMP )
          nodupkey ; 
  by Extrema Type;
run;

proc sort data = &MaxResults;
By TIMESTAMP;
run;
%mend maxes;

%maxes ( LCClean1_6 );

%maxes ( LCClean2_6 );

data Rawmaxes;
    merge Irrproj.mastersasfileclean 
          MaxresultsLCClean1_6 
          MaxresultsLCClean2_6
          ;
by TIMESTAMP;
run;

/*delete duplicated data*/
proc sort data = Rawmaxes out = CleanRawmaxes
          nodupkey ; 
  by TIMESTAMP;
run;
quit;

/*pick obervation 60 minutes after the inital maximum*/

%macro plus30max (VOI);
%let Cmax =Cmax%sysfunc(tranwrd(&VOI,%str( ),%str(Cmax)));
%let max =max%sysfunc(tranwrd(&VOI,%str( ),%str(max)));
data &Cmax ;
set CleanRawmaxes;
if &max>. then do p=max(_n_+12,1) to min(_n_+12,nobs);
  set CleanRawmaxes point=p nobs=nobs;
  output;
  end;
  rename &VOI = &Cmax;
  keep TIMESTAMP &VOI;
run;
%mend plus30max;

%plus30max ( LCClean1_6 );

%plus30max ( LCClean2_6 );

/*combine maximum and minimum numbers with original numbers*/
data LC6after (keep=Timestamp Date Time Light_dark_period LCClean1_6 LCClean2_6 CmaxLCClean1_6 CmaxLCClean2_6 minLCClean1_6 minLCClean2_6);
  merge Irrproj.mastersasfileclean 
        CmaxLCClean1_6 
        CmaxLCClean2_6
        MinResultsLCClean1_6
        MinResultsLCClean2_6
        ;
  by TIMESTAMP;
run;

data Results.LC6final(keep=Timestamp Date Time Light_dark_period LCClean1_6 LCClean2_6 CmaxLCClean1_6 CmaxLCClean2_6 minLCClean1_6 minLCClean2_6);
  set Irrproj.FinalResults (where=(timestamp < '08nov2020:10:25:00'dt))
      LC6after (where=(timestamp > '08nov2020:10:25:00'dt));
run;

proc sort data = Irrproj.FinalResults 
          nodupkey ; 
  by TIMESTAMP;
run;
quit;

/*Check results of program with a scatterplot*/
title 
ODS GRAPHICS on/ width=30in;
/*Macro for making graphing easier*/
/*start of min graphs*/
%macro plots (VOI);
%let min =min%sysfunc(tranwrd(&VOI,%str( ),%str(min)));
proc sgplot data=Results.LC6final noautolegend;
scatter x=TIMESTAMP y=&VOI;
scatter x=TIMESTAMP y=&min / markerattrs=(symbol=circlefilled color=red);
run;
%mend plots;

%plots ( LCClean1_6 );

%plots ( LCClean2_6 );

%macro maxplots (VOI);
%let Cmax =Cmax%sysfunc(tranwrd(&VOI,%str( ),%str(Cmax)));
proc sgplot data=Results.LC6final noautolegend;
scatter x=TIMESTAMP y=&VOI;
scatter x=TIMESTAMP y=&Cmax / markerattrs=(symbol=circlefilled color=red);
run;
%mend maxplots;

%maxplots ( LCClean1_6 );

%maxplots ( LCClean2_6 );

ods graphics off;

quit;
