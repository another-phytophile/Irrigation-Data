/*
Authored By: Jerry, Yu
Authored On: 2022-11-28
Authored To: 1) Clean data
             2) Fit LOESS to predict target variable based 
                on TIMESTAMP
             3) Find extrema in original data by:
                A) Transposing data so all observations are 
                   on one record
                B) Search records for a sign change in the 
                   successive differences
                C) Find all observations in original data 
                   within neighborhood of LOESS extrema
                D) Find original data extrema within each 
                   neighborhood of LOESS extrema
              4) Rewrite the code written by Jonathan W. Duggins to apply to all variables

Change Logs: 

Modified By: Jerry Yu
Modified On: 2022-12-2,3,4,5
Modified To: 
    1) Adapt code written by Dr. Duggins to fit for all 48 variables, both maxes and mins
    2)use macros to reduce code space

Modified By: Jerry Yu
Modified On: 2022-12-16,17,18,19
Modified To: 
    1) Modify code to pick max extrema 30 minutes after the absolute data extrema


/*libname statement to access the irrigation folder*/
/*ods output off;*/
/*ods graphics / reset;*/

libname irrproj 'C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\SAS Data Sets';

/*Sequence data by timestamp in case data is not
 already sorted*/
proc sort data = Irrproj.mastersasfileclean
    nodupkey;
  by TimeStamp;
run;

/*Model
 - Fit LOESS model 
 - Score original data
 - Save LOESS results 
*/
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_1  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_1  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_2  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_2  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_3  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_3  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_4  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_4  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_5  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_5  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_6  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_6  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_7  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_7  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_8  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_8  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_9  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_9  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_10  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_10  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_11  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_11  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean1_12  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean1_12  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean1  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean1  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean2  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean2  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean3  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean3  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean4  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean4  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean5  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean5  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean6  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean6  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean7  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean7  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean8  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean8  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean9  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean9  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean10  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean10  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean11  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean11  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean12  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean12  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean13  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean13  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean14  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean14  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean15  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean15  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean16  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean16  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean17  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean17  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean18  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean18  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean19  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean19  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean20  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean20  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean21  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean21  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean22  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean22  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean23  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean23  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  VWCClean24  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1VWCClean24  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_1  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_1  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_2  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_2  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_3  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_3  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_4  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_4  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_5  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_5  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_6  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_6  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_7  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_7  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_8  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_8  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_9  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_9  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_10  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_10  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_11  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_11  (drop = smoothingparameter scoredata);
run;
proc loess data=Irrproj.mastersasfileclean plots=none;
  model  LCClean2_12  =TIMESTAMP/smooth = 0.0025;
score;
ods output ScoreResults=p1LCClean2_12  (drop = smoothingparameter scoredata);
run;

/*combine all the datasets into 1*/

data Irrproj.LOESSResults ;
    merge p1LCClean1_1 p1LCClean1_2 p1LCClean1_3 p1LCClean1_4 p1LCClean1_5 p1LCClean1_6 p1LCClean1_7 p1LCClean1_8 p1LCClean1_9 p1LCClean1_10 p1LCClean1_11 p1LCClean1_12 p1LCClean2_1 p1LCClean2_2 p1LCClean2_3 p1LCClean2_4 p1LCClean2_5 p1LCClean2_6 p1LCClean2_7 p1LCClean2_8 p1LCClean2_9 p1LCClean2_10 p1LCClean2_11 p1LCClean2_12
    p1VWCClean1 p1VWCClean2 p1VWCClean3 p1VWCClean4 p1VWCClean5 p1VWCClean6 p1VWCClean7 p1VWCClean8 p1VWCClean9 p1VWCClean10 p1VWCClean11 p1VWCClean12 p1VWCClean13 p1VWCClean14 p1VWCClean15 p1VWCClean16 p1VWCClean17 p1VWCClean18 p1VWCClean19 p1VWCClean20 p1VWCClean21 p1VWCClean22 p1VWCClean23 p1VWCClean24;
    by TIMESTAMP;
run;

/*Reshape to get all predicted values 
 in single record for easier processing*/
proc transpose data = Irrproj.LOESSResults 
               out = Irrproj.TransResults 
               prefix = obs;
  var p_LCClean1_1 p_LCClean1_2 p_LCClean1_3 p_LCClean1_4 p_LCClean1_5 p_LCClean1_6 p_LCClean1_7 p_LCClean1_8 p_LCClean1_9 p_LCClean1_10 p_LCClean1_11 p_LCClean1_12 p_LCClean2_1 p_LCClean2_2 p_LCClean2_3 p_LCClean2_4 p_LCClean2_5 p_LCClean2_6 p_LCClean2_7 p_LCClean2_8 p_LCClean2_9 p_LCClean2_10 p_LCClean2_11 p_LCClean2_12 p_VWCClean1 p_VWCClean2 p_VWCClean3 p_VWCClean4 p_VWCClean5 p_VWCClean6 p_VWCClean7 p_VWCClean8 p_VWCClean9 p_VWCClean10 p_VWCClean11 p_VWCClean12 p_VWCClean13 p_VWCClean14 p_VWCClean15 p_VWCClean16 p_VWCClean17 p_VWCClean18 p_VWCClean19 p_VWCClean20 p_VWCClean21 p_VWCClean22 p_VWCClean23 p_VWCClean24;
  id obs;
run;

/*data test1; */
/*  set Irrproj.TransResults ;*/
/*  if _NAME_ = "p_LCClean1_1" ;*/
/*  drop _NAME_ _LABEL_;*/
/*run;*/

/*Locate the extrema*/
data Irrproj.Extrema (keep = obs type _NAME_);
  set Irrproj.TransResults;
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
        output Irrproj.Extrema;
      end;
      else if SignAhead > SignBehind then do;
          Type = "Min";
          output Irrproj.Extrema;
        end;
  end;
run;

/*Check the data to see if the number of estimated minimums and maximums are reasonable*/
/*preliminary sorting step*/
proc sort data = Irrproj.Extrema;
    by _NAME_;
run;
/*Checks frequency of maxs and mins for each variable*/
proc freq data =Irrproj.Extrema;
    by _NAME_;
    tables type;
run;

/*START OF MINS PROCESSING*/

/*Find original records that are 
  within D spots of extrema*/
data Neighborhoodmin(drop = nbrhood d);
  *Only bring in records of the extrema type we want;
  set Irrproj.Extrema(where = (lowcase(type) = "min"));

  *Set neighborhood width for search;
  nbrhood = 30;

  *Keep track of which local extrema;
  Extrema + 1;
  
  *Find records within the neighborhood;
  do d = -nbrhood to nbrhood;
    Rec = Obs + d;
    set Irrproj.LOESSResults(drop = obs) point = Rec;
    output;
  end;
run;

/*Find min for each group
 - First SORT gets ensures smallest target
   variable is first in each group
    - If tie on target variable, use predicted
      target variable to break the tie
 - Second SORT removes any duplicates, so
   only first record (which is smallest)
   remains.
 - Much less efficient than SQL, so swap this for
   SQL code if all users are comfortable with SQL
 - I am not very comfotable with SQL
*/

/*for better ease for debugging*/
OPTIONS SYMBOLGEN MPRINT MLOGIC;

/*Use a macro statement to aitomate the generation of code to reduce repetitivness*/
%macro mins (VOI); /*VOI is the only parameter we have to set for this entire macro*/
%let NSortmin =NSortmin%sysfunc(tranwrd(&VOI,%str( ),%str(NSortmin)));/* add prefizes ot VOI for use in the code elsewhere*/
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

%mins ( LCClean1_1 );

%mins ( LCClean1_2 );

%mins ( LCClean1_3 );

%mins ( LCClean1_4 );

%mins ( LCClean1_5 );

%mins ( LCClean1_6 );

%mins ( LCClean1_7 );

%mins ( LCClean1_8 );

%mins ( LCClean1_9 );

%mins ( LCClean1_10 );

%mins ( LCClean1_11 );

%mins ( LCClean1_12 );

%mins ( LCClean2_1 );

%mins ( LCClean2_2 );

%mins ( LCClean2_3 );

%mins ( LCClean2_4 );

%mins ( LCClean2_5 );

%mins ( LCClean2_6 );

%mins ( LCClean2_7 );

%mins ( LCClean2_8 );

%mins ( LCClean2_9 );

%mins ( LCClean2_10 );

%mins ( LCClean2_11 );

%mins ( LCClean2_12 );


%mins ( VWCClean1 );

%mins ( VWCClean2 );

%mins ( VWCClean3 );

%mins ( VWCClean4 );

%mins ( VWCClean5 );

%mins ( VWCClean6 );

%mins ( VWCClean7 );

%mins ( VWCClean8 );

%mins ( VWCClean9 );

%mins ( VWCClean10 );

%mins ( VWCClean11 );

%mins ( VWCClean12 );

%mins ( VWCClean13 );

%mins ( VWCClean14 );

%mins ( VWCClean15 );

%mins ( VWCClean16 );

%mins ( VWCClean17 );

%mins ( VWCClean18 );

%mins ( VWCClean19 );

%mins ( VWCClean20 );

%mins ( VWCClean21 );

%mins ( VWCClean22 );

%mins ( VWCClean23 );

%mins ( VWCClean24 );
 
/*START OF MAX PROCESSING*/

/*Find original records that are 
  within D spots of extrema*/
data Neighborhoodmax(drop = nbrhood d);
  *Only bring in records of the extrema type we want;
  set Irrproj.Extrema(where = (lowcase(type) = "max"));

  *Set neighborhood width for search;
  nbrhood = 30;

  *Keep track of which local extrema;
  Extrema + 1;
  
  *Find records within the neighborhood;
  do d = -nbrhood to nbrhood;
    Rec = Obs + d;
    set Irrproj.LOESSResults(drop = obs) point = Rec;
    output;
  end;
run;

/*start of copypasta for max*/

/*Sort Steps for  LCClean1_1 */

/*Sort Steps for  LCClean1_1 */

proc sort data = Neighborhoodmax (where = (not missing( LCClean1_1 ))) 
          out =  NSortmaxLCClean1_1 ;
  where _NAME_="p_LCClean1_1";
  by descending Extrema descending Type descending LCClean1_1  descending p_LCClean1_1 ;
run;

proc sort data = NSortmaxLCClean1_1 out =  MaxresultsLCClean1_1 (rename = LCClean1_1 = maxLCClean1_1 keep = TIMESTAMP LCClean1_1 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_1 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_2 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_2 ))) 
          out =  NSortmaxLCClean1_2 ;
  where _NAME_="p_LCClean1_2";
  by descending Extrema descending Type descending LCClean1_2  descending p_LCClean1_2 ;
run;

proc sort data = NSortmaxLCClean1_2 out =  MaxresultsLCClean1_2 (rename = LCClean1_2 = maxLCClean1_2 keep = TIMESTAMP LCClean1_2 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_2 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_3 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_3 ))) 
          out =  NSortmaxLCClean1_3 ;
  where _NAME_="p_LCClean1_3";
  by descending Extrema descending Type descending LCClean1_3  descending p_LCClean1_3 ;
run;

proc sort data = NSortmaxLCClean1_3 out =  MaxresultsLCClean1_3 (rename = LCClean1_3 = maxLCClean1_3 keep = TIMESTAMP LCClean1_3 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_3 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_4 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_4 ))) 
          out =  NSortmaxLCClean1_4 ;
  where _NAME_="p_LCClean1_4";
  by descending Extrema descending Type descending LCClean1_4  descending p_LCClean1_4 ;
run;

proc sort data = NSortmaxLCClean1_4 out =  MaxresultsLCClean1_4 (rename = LCClean1_4 = maxLCClean1_4 keep = TIMESTAMP LCClean1_4 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_4 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_5 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_5 ))) 
          out =  NSortmaxLCClean1_5 ;
  where _NAME_="p_LCClean1_5";
  by descending Extrema descending Type descending LCClean1_5  descending p_LCClean1_5 ;
run;

proc sort data = NSortmaxLCClean1_5 out =  MaxresultsLCClean1_5 (rename = LCClean1_5 = maxLCClean1_5 keep = TIMESTAMP LCClean1_5 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_5 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_6 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_6 ))) 
          out =  NSortmaxLCClean1_6 ;
  where _NAME_="p_LCClean1_6";
  by descending Extrema descending Type descending LCClean1_6  descending p_LCClean1_6 ;
run;

proc sort data = NSortmaxLCClean1_6 out =  MaxresultsLCClean1_6 (rename = LCClean1_6 = maxLCClean1_6 keep = TIMESTAMP LCClean1_6 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_6 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_7 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_7 ))) 
          out =  NSortmaxLCClean1_7 ;
  where _NAME_="p_LCClean1_7";
  by descending Extrema descending Type descending LCClean1_7  descending p_LCClean1_7 ;
run;

proc sort data = NSortmaxLCClean1_7 out =  MaxresultsLCClean1_7 (rename = LCClean1_7 = maxLCClean1_7 keep = TIMESTAMP LCClean1_7 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_7 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_8 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_8 ))) 
          out =  NSortmaxLCClean1_8 ;
  where _NAME_="p_LCClean1_8";
  by descending Extrema descending Type descending LCClean1_8  descending p_LCClean1_8 ;
run;

proc sort data = NSortmaxLCClean1_8 out =  MaxresultsLCClean1_8 (rename = LCClean1_8 = maxLCClean1_8 keep = TIMESTAMP LCClean1_8 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_8 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_9 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_9 ))) 
          out =  NSortmaxLCClean1_9 ;
  where _NAME_="p_LCClean1_9";
  by descending Extrema descending Type descending LCClean1_9  descending p_LCClean1_9 ;
run;

proc sort data = NSortmaxLCClean1_9 out =  MaxresultsLCClean1_9 (rename = LCClean1_9 = maxLCClean1_9 keep = TIMESTAMP LCClean1_9 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_9 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_10 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_10 ))) 
          out =  NSortmaxLCClean1_10 ;
  where _NAME_="p_LCClean1_10";
  by descending Extrema descending Type descending LCClean1_10  descending p_LCClean1_10 ;
run;

proc sort data = NSortmaxLCClean1_10 out =  MaxresultsLCClean1_10 (rename = LCClean1_10 = maxLCClean1_10 keep = TIMESTAMP LCClean1_10 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_10 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_11 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_11 ))) 
          out =  NSortmaxLCClean1_11 ;
  where _NAME_="p_LCClean1_11";
  by descending Extrema descending Type descending LCClean1_11  descending p_LCClean1_11 ;
run;

proc sort data = NSortmaxLCClean1_11 out =  MaxresultsLCClean1_11 (rename = LCClean1_11 = maxLCClean1_11 keep = TIMESTAMP LCClean1_11 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_11 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean1_12 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_12 ))) 
          out =  NSortmaxLCClean1_12 ;
  where _NAME_="p_LCClean1_12";
  by descending Extrema descending Type descending LCClean1_12  descending p_LCClean1_12 ;
run;

proc sort data = NSortmaxLCClean1_12 out =  MaxresultsLCClean1_12 (rename = LCClean1_12 = maxLCClean1_12 keep = TIMESTAMP LCClean1_12 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean1_12 ;
by TIMESTAMP;
run;

/*Sort Steps for  LCClean2_1 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_1 ))) 
          out =  NSortmaxLCClean2_1 ;
  where _NAME_="p_LCClean2_1";
  by descending Extrema descending Type descending LCClean2_1  descending p_LCClean2_1 ;
run;

proc sort data = NSortmaxLCClean2_1 out =  MaxresultsLCClean2_1 (rename = LCClean2_1  = maxLCClean2_1 keep = TIMESTAMP LCClean2_1 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_1 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_2 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_2 ))) 
          out =  NSortmaxLCClean2_2 ;
  where _NAME_="p_LCClean2_2";
  by descending Extrema descending Type descending LCClean2_2  descending p_LCClean2_2 ;
run;

proc sort data = NSortmaxLCClean2_2 out =  MaxresultsLCClean2_2 (rename = LCClean2_2 =maxLCClean2_2 keep = TIMESTAMP LCClean2_2 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_2 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_3 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_3 ))) 
          out =  NSortmaxLCClean2_3 ;
  where _NAME_="p_LCClean2_3";
  by descending Extrema descending Type descending LCClean2_3  descending p_LCClean2_3 ;
run;

proc sort data = NSortmaxLCClean2_3 out =  MaxresultsLCClean2_3 (rename = LCClean2_3 =maxLCClean2_3 keep = TIMESTAMP LCClean2_3 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_3 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_4 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_4 ))) 
          out =  NSortmaxLCClean2_4 ;
  where _NAME_="p_LCClean2_4";
  by descending Extrema descending Type descending LCClean2_4  descending p_LCClean2_4 ;
run;

proc sort data = NSortmaxLCClean2_4 out =  MaxresultsLCClean2_4 (rename = LCClean2_4 =maxLCClean2_4 keep = TIMESTAMP LCClean2_4 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_4 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_5 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_5 ))) 
          out =  NSortmaxLCClean2_5 ;
  where _NAME_="p_LCClean2_5";
  by descending Extrema descending Type descending LCClean2_5  descending p_LCClean2_5 ;
run;

proc sort data = NSortmaxLCClean2_5 out =  MaxresultsLCClean2_5 (rename = LCClean2_5 =maxLCClean2_5 keep = TIMESTAMP LCClean2_5 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_5 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_6 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_6 ))) 
          out =  NSortmaxLCClean2_6 ;
  where _NAME_="p_LCClean2_6";
  by descending Extrema descending Type descending LCClean2_6  descending p_LCClean2_6 ;
run;

proc sort data = NSortmaxLCClean2_6 out =  MaxresultsLCClean2_6 (rename = LCClean2_6 =maxLCClean2_6 keep = TIMESTAMP LCClean2_6 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_6 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_7 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_7 ))) 
          out =  NSortmaxLCClean2_7 ;
  where _NAME_="p_LCClean2_7";
  by descending Extrema descending Type descending LCClean2_7  descending p_LCClean2_7 ;
run;

proc sort data = NSortmaxLCClean2_7 out =  MaxresultsLCClean2_7 (rename = LCClean2_7 =maxLCClean2_7 keep = TIMESTAMP LCClean2_7 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_7 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_8 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_8 ))) 
          out =  NSortmaxLCClean2_8 ;
  where _NAME_="p_LCClean2_8";
  by descending Extrema descending Type descending LCClean2_8  descending p_LCClean2_8 ;
run;

proc sort data = NSortmaxLCClean2_8 out =  MaxresultsLCClean2_8 (rename = LCClean2_8 =maxLCClean2_8 keep = TIMESTAMP LCClean2_8 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_8 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_9 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_9 ))) 
          out =  NSortmaxLCClean2_9 ;
  where _NAME_="p_LCClean2_9";
  by descending Extrema descending Type descending LCClean2_9  descending p_LCClean2_9 ;
run;

proc sort data = NSortmaxLCClean2_9 out =  MaxresultsLCClean2_9 (rename = LCClean2_9 =maxLCClean2_9 keep = TIMESTAMP LCClean2_9 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_9 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_10 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_10 ))) 
          out =  NSortmaxLCClean2_10 ;
  where _NAME_="p_LCClean2_10";
  by descending Extrema descending Type descending LCClean2_10  descending p_LCClean2_10 ;
run;

proc sort data = NSortmaxLCClean2_10 out =  MaxresultsLCClean2_10 (rename = LCClean2_10 =maxLCClean2_10 keep = TIMESTAMP LCClean2_10 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_10 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_11 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_11 ))) 
          out =  NSortmaxLCClean2_11 ;
  where _NAME_="p_LCClean2_11";
  by descending Extrema descending Type descending LCClean2_11  descending p_LCClean2_11 ;
run;

proc sort data = NSortmaxLCClean2_11 out =  MaxresultsLCClean2_11 (rename = LCClean2_11 =maxLCClean2_11 keep = TIMESTAMP LCClean2_11 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_11 ;
by TIMESTAMP;
run;
/*Sort Steps for  LCClean2_12 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean2_12 ))) 
          out =  NSortmaxLCClean2_12 ;
  where _NAME_="p_LCClean2_12";
  by descending Extrema descending Type descending LCClean2_12  descending p_LCClean2_12 ;
run;

proc sort data = NSortmaxLCClean2_12 out =  MaxresultsLCClean2_12 (rename = LCClean2_12 =maxLCClean2_12 keep = TIMESTAMP LCClean2_12 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsLCClean2_12 ;
by TIMESTAMP;
run;

/*Sort Steps for  VWCClean1 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean1 ))) 
          out =  NSortmaxVWCClean1 ;
  where _NAME_="p_VWCClean1";
  by descending Extrema descending Type descending VWCClean1  descending p_VWCClean1 ;
run;

proc sort data = NSortmaxVWCClean1 out =  MaxresultsVWCClean1 (rename = VWCClean1 = maxVWCClean1 keep = TIMESTAMP VWCClean1 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean1 ;
by TIMESTAMP;
run;

/*Sort Steps for  VWCClean2 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean2 ))) 
          out =  NSortmaxVWCClean2 ;
  where _NAME_="p_VWCClean2";
  by descending Extrema descending Type descending VWCClean2  descending p_VWCClean2 ;
run;

proc sort data = NSortmaxVWCClean2 out =  MaxresultsVWCClean2 (rename = VWCClean2 = maxVWCClean2 keep = TIMESTAMP VWCClean2 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean2 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean3 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean3 ))) 
          out =  NSortmaxVWCClean3 ;
  where _NAME_="p_VWCClean3";
  by descending Extrema descending Type descending VWCClean3  descending p_VWCClean3 ;
run;

proc sort data = NSortmaxVWCClean3 out =  MaxresultsVWCClean3 (rename = VWCClean3 = maxVWCClean3 keep = TIMESTAMP VWCClean3 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean3 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean4 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean4 ))) 
          out =  NSortmaxVWCClean4 ;
  where _NAME_="p_VWCClean4";
  by descending Extrema descending Type descending VWCClean4  descending p_VWCClean4 ;
run;

proc sort data = NSortmaxVWCClean4 out =  MaxresultsVWCClean4 (rename = VWCClean4 = maxVWCClean4 keep = TIMESTAMP VWCClean4 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean4 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean5 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean5 ))) 
          out =  NSortmaxVWCClean5 ;
  where _NAME_="p_VWCClean5";
  by descending Extrema descending Type descending VWCClean5  descending p_VWCClean5 ;
run;

proc sort data = NSortmaxVWCClean5 out =  MaxresultsVWCClean5 (rename = VWCClean5 = maxVWCClean5 keep = TIMESTAMP VWCClean5 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean5 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean6 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean6 ))) 
          out =  NSortmaxVWCClean6 ;
  where _NAME_="p_VWCClean6";
  by descending Extrema descending Type descending VWCClean6  descending p_VWCClean6 ;
run;

proc sort data = NSortmaxVWCClean6 out =  MaxresultsVWCClean6 (rename = VWCClean6 = maxVWCClean6 keep = TIMESTAMP VWCClean6 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean6 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean7 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean7 ))) 
          out =  NSortmaxVWCClean7 ;
  where _NAME_="p_VWCClean7";
  by descending Extrema descending Type descending VWCClean7  descending p_VWCClean7 ;
run;

proc sort data = NSortmaxVWCClean7 out =  MaxresultsVWCClean7 (rename = VWCClean7 = maxVWCClean7 keep = TIMESTAMP VWCClean7 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean7 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean8 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean8 ))) 
          out =  NSortmaxVWCClean8 ;
  where _NAME_="p_VWCClean8";
  by descending Extrema descending Type descending VWCClean8  descending p_VWCClean8 ;
run;

proc sort data = NSortmaxVWCClean8 out =  MaxresultsVWCClean8 (rename = VWCClean8 = maxVWCClean8 keep = TIMESTAMP VWCClean8 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean8 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean9 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean9 ))) 
          out =  NSortmaxVWCClean9 ;
  where _NAME_="p_VWCClean9";
  by descending Extrema descending Type descending VWCClean9  descending p_VWCClean9 ;
run;

proc sort data = NSortmaxVWCClean9 out =  MaxresultsVWCClean9 (rename = VWCClean9 = maxVWCClean9 keep = TIMESTAMP VWCClean9 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean9 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean10 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean10 ))) 
          out =  NSortmaxVWCClean10 ;
  where _NAME_="p_VWCClean10";
  by descending Extrema descending Type descending VWCClean10  descending p_VWCClean10 ;
run;

proc sort data = NSortmaxVWCClean10 out =  MaxresultsVWCClean10 (rename = VWCClean10 = maxVWCClean10 keep = TIMESTAMP VWCClean10 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean10 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean11 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean11 ))) 
          out =  NSortmaxVWCClean11 ;
  where _NAME_="p_VWCClean11";
  by descending Extrema descending Type descending VWCClean11  descending p_VWCClean11 ;
run;

proc sort data = NSortmaxVWCClean11 out =  MaxresultsVWCClean11 (rename = VWCClean11 = maxVWCClean11 keep = TIMESTAMP VWCClean11 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean11 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean12 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean12 ))) 
          out =  NSortmaxVWCClean12 ;
  where _NAME_="p_VWCClean12";
  by descending Extrema descending Type descending VWCClean12  descending p_VWCClean12 ;
run;

proc sort data = NSortmaxVWCClean12 out =  MaxresultsVWCClean12 (rename = VWCClean12 = maxVWCClean12 keep = TIMESTAMP VWCClean12 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean12 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean13 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean13 ))) 
          out =  NSortmaxVWCClean13 ;
  where _NAME_="p_VWCClean13";
  by descending Extrema descending Type descending VWCClean13  descending p_VWCClean13 ;
run;

proc sort data = NSortmaxVWCClean13 out =  MaxresultsVWCClean13 (rename = VWCClean13 = maxVWCClean13 keep = TIMESTAMP VWCClean13 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean13 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean14 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean14 ))) 
          out =  NSortmaxVWCClean14 ;
  where _NAME_="p_VWCClean14";
  by descending Extrema descending Type descending VWCClean14  descending p_VWCClean14 ;
run;

proc sort data = NSortmaxVWCClean14 out =  MaxresultsVWCClean14 (rename = VWCClean14 = maxVWCClean14 keep = TIMESTAMP VWCClean14 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean14 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean15 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean15 ))) 
          out =  NSortmaxVWCClean15 ;
  where _NAME_="p_VWCClean15";
  by descending Extrema descending Type descending VWCClean15  descending p_VWCClean15 ;
run;

proc sort data = NSortmaxVWCClean15 out =  MaxresultsVWCClean15 (rename = VWCClean15 = maxVWCClean15 keep = TIMESTAMP VWCClean15 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean15 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean16 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean16 ))) 
          out =  NSortmaxVWCClean16 ;
  where _NAME_="p_VWCClean16";
  by descending Extrema descending Type descending VWCClean16  descending p_VWCClean16 ;
run;

proc sort data = NSortmaxVWCClean16 out =  MaxresultsVWCClean16 (rename = VWCClean16 = maxVWCClean16 keep = TIMESTAMP VWCClean16 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean16 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean17 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean17 ))) 
          out =  NSortmaxVWCClean17 ;
  where _NAME_="p_VWCClean17";
  by descending Extrema descending Type descending VWCClean17  descending p_VWCClean17 ;
run;

proc sort data = NSortmaxVWCClean17 out =  MaxresultsVWCClean17 (rename = VWCClean17 = maxVWCClean17 keep = TIMESTAMP VWCClean17 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean17 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean18 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean18 ))) 
          out =  NSortmaxVWCClean18 ;
  where _NAME_="p_VWCClean18";
  by descending Extrema descending Type descending VWCClean18  descending p_VWCClean18 ;
run;

proc sort data = NSortmaxVWCClean18 out =  MaxresultsVWCClean18 (rename = VWCClean18 = maxVWCClean18 keep = TIMESTAMP VWCClean18 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean18 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean19 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean19 ))) 
          out =  NSortmaxVWCClean19 ;
  where _NAME_="p_VWCClean19";
  by descending Extrema descending Type descending VWCClean19  descending p_VWCClean19 ;
run;

proc sort data = NSortmaxVWCClean19 out =  MaxresultsVWCClean19 (rename = VWCClean19 = maxVWCClean19 keep = TIMESTAMP VWCClean19 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean19 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean20 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean20 ))) 
          out =  NSortmaxVWCClean20 ;
  where _NAME_="p_VWCClean20";
  by descending Extrema descending Type descending VWCClean20  descending p_VWCClean20 ;
run;

proc sort data = NSortmaxVWCClean20 out =  MaxresultsVWCClean20 (rename = VWCClean20 = maxVWCClean20 keep = TIMESTAMP VWCClean20 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean20 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean21 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean21 ))) 
          out =  NSortmaxVWCClean21 ;
  where _NAME_="p_VWCClean21";
  by descending Extrema descending Type descending VWCClean21  descending p_VWCClean21 ;
run;

proc sort data = NSortmaxVWCClean21 out =  MaxresultsVWCClean21 (rename = VWCClean21 = maxVWCClean21 keep = TIMESTAMP VWCClean21 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean21 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean22 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean22 ))) 
          out =  NSortmaxVWCClean22 ;
  where _NAME_="p_VWCClean22";
  by descending Extrema descending Type descending VWCClean22  descending p_VWCClean22 ;
run;

proc sort data = NSortmaxVWCClean22 out =  MaxresultsVWCClean22 (rename = VWCClean22 = maxVWCClean22 keep = TIMESTAMP VWCClean22 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean22 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean23 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean23 ))) 
          out =  NSortmaxVWCClean23 ;
  where _NAME_="p_VWCClean23";
  by descending Extrema descending Type descending VWCClean23  descending p_VWCClean23 ;
run;

proc sort data = NSortmaxVWCClean23 out =  MaxresultsVWCClean23 (rename = VWCClean23 = maxVWCClean23 keep = TIMESTAMP VWCClean23 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean23 ;
by TIMESTAMP;
run;
/*Sort Steps for  VWCClean24 */

proc sort data = Irrproj.Neighborhoodmax (where = (not missing( VWCClean24 ))) 
          out =  NSortmaxVWCClean24 ;
  where _NAME_="p_VWCClean24";
  by descending Extrema descending Type descending VWCClean24  descending p_VWCClean24 ;
run;

proc sort data = NSortmaxVWCClean24 out =  MaxresultsVWCClean24 (rename = VWCClean24 = maxVWCClean24 keep = TIMESTAMP VWCClean24 )
          nodupkey ; 
  by descending Extrema descending Type;
run;
quit;
proc sort data =  MaxresultsVWCClean24 ;
by TIMESTAMP;
run;

data Rawmaxes;
    merge Irrproj.mastersasfileclean MaxresultsLCClean1_1 MaxresultsLCClean1_2 MaxresultsLCClean1_3 MaxresultsLCClean1_4 MaxresultsLCClean1_5 MaxresultsLCClean1_6 MaxresultsLCClean1_7 MaxresultsLCClean1_8 MaxresultsLCClean1_9 MaxresultsLCClean1_10 MaxresultsLCClean1_11 MaxresultsLCClean1_12 MaxresultsLCClean2_1 MaxresultsLCClean2_2 MaxresultsLCClean2_3 MaxresultsLCClean2_4 MaxresultsLCClean2_5 MaxresultsLCClean2_6 MaxresultsLCClean2_7 MaxresultsLCClean2_8 MaxresultsLCClean2_9 MaxresultsLCClean2_10 MaxresultsLCClean2_11 MaxresultsLCClean2_12
MaxResultsVWCClean1
MaxResultsVWCClean2
MaxResultsVWCClean3
MaxResultsVWCClean4
MaxResultsVWCClean5
MaxResultsVWCClean6
MaxResultsVWCClean7
MaxResultsVWCClean8
MaxResultsVWCClean9
MaxResultsVWCClean10
MaxResultsVWCClean11
MaxResultsVWCClean12
MaxResultsVWCClean13
MaxResultsVWCClean14
MaxResultsVWCClean15
MaxResultsVWCClean16
MaxResultsVWCClean17
MaxResultsVWCClean18
MaxResultsVWCClean19
MaxResultsVWCClean20
MaxResultsVWCClean21
MaxResultsVWCClean22
MaxResultsVWCClean23
MaxResultsVWCClean24;
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

%plus30max ( LCClean1_1 );

%plus30max ( LCClean1_2 );

%plus30max ( LCClean1_3 );

%plus30max ( LCClean1_4 );

%plus30max ( LCClean1_5 );

%plus30max ( LCClean1_6 );

%plus30max ( LCClean1_7 );

%plus30max ( LCClean1_8 );

%plus30max ( LCClean1_9 );

%plus30max ( LCClean1_10 );

%plus30max ( LCClean1_11 );

%plus30max ( LCClean1_12 );

%plus30max ( LCClean2_1 );

%plus30max ( LCClean2_2 );

%plus30max ( LCClean2_3 );

%plus30max ( LCClean2_4 );

%plus30max ( LCClean2_5 );

%plus30max ( LCClean2_6 );

%plus30max ( LCClean2_7 );

%plus30max ( LCClean2_8 );

%plus30max ( LCClean2_9 );

%plus30max ( LCClean2_10 );

%plus30max ( LCClean2_11 );

%plus30max ( LCClean2_12 );


%plus30max ( VWCClean1 );

%plus30max ( VWCClean2 );

%plus30max ( VWCClean3 );

%plus30max ( VWCClean4 );

%plus30max ( VWCClean5 );

%plus30max ( VWCClean6 );

%plus30max ( VWCClean7 );

%plus30max ( VWCClean8 );

%plus30max ( VWCClean9 );

%plus30max ( VWCClean10 );

%plus30max ( VWCClean11 );

%plus30max ( VWCClean12 );

%plus30max ( VWCClean13 );

%plus30max ( VWCClean14 );

%plus30max ( VWCClean15 );

%plus30max ( VWCClean16 );

%plus30max ( VWCClean17 );

%plus30max ( VWCClean18 );

%plus30max ( VWCClean19 );

%plus30max ( VWCClean20 );

%plus30max ( VWCClean21 );

%plus30max ( VWCClean22 );

%plus30max ( VWCClean23 );

%plus30max ( VWCClean24 );


/*combine maximum and minimum numbers with original numbers*/
data Irrproj.FinalResults;
    merge Irrproj.mastersasfileclean CmaxLCClean1_1 CmaxLCClean1_2 CmaxLCClean1_3 CmaxLCClean1_4 CmaxLCClean1_5 CmaxLCClean1_6 CmaxLCClean1_7 CmaxLCClean1_8 CmaxLCClean1_9 CmaxLCClean1_10 CmaxLCClean1_11 CmaxLCClean1_12 CmaxLCClean2_1 CmaxLCClean2_2 CmaxLCClean2_3 CmaxLCClean2_4 CmaxLCClean2_5 CmaxLCClean2_6 CmaxLCClean2_7 CmaxLCClean2_8 CmaxLCClean2_9 CmaxLCClean2_10 CmaxLCClean2_11 CmaxLCClean2_12
CmaxVWCClean1
CmaxVWCClean2
CmaxVWCClean3
CmaxVWCClean4
CmaxVWCClean5
CmaxVWCClean6
CmaxVWCClean7
CmaxVWCClean8
CmaxVWCClean9
CmaxVWCClean10
CmaxVWCClean11
CmaxVWCClean12
CmaxVWCClean13
CmaxVWCClean14
CmaxVWCClean15
CmaxVWCClean16
CmaxVWCClean17
CmaxVWCClean18
CmaxVWCClean19
CmaxVWCClean20
CmaxVWCClean21
CmaxVWCClean22
CmaxVWCClean23
CmaxVWCClean24
MinResultsVWCClean1 MinResultsLCClean1_1
MinResultsVWCClean2 MinResultsLCClean1_2
MinResultsVWCClean3 MinResultsLCClean1_3
MinResultsVWCClean4 MinResultsLCClean1_4
MinResultsVWCClean5 MinResultsLCClean1_5
MinResultsVWCClean6 MinResultsLCClean1_6
MinResultsVWCClean7 MinResultsLCClean1_7
MinResultsVWCClean8 MinResultsLCClean1_8
MinResultsVWCClean9 MinResultsLCClean1_9
MinResultsVWCClean10 MinResultsLCClean1_10
MinResultsVWCClean11 MinResultsLCClean1_11
MinResultsVWCClean12 MinResultsLCClean1_12
MinResultsVWCClean13 MinResultsLCClean2_1
MinResultsVWCClean14 MinResultsLCClean2_2
MinResultsVWCClean15 MinResultsLCClean2_3
MinResultsVWCClean16 MinResultsLCClean2_4
MinResultsVWCClean17 MinResultsLCClean2_5
MinResultsVWCClean18 MinResultsLCClean2_6
MinResultsVWCClean19 MinResultsLCClean2_7
MinResultsVWCClean20 MinResultsLCClean2_8
MinResultsVWCClean21 MinResultsLCClean2_9
MinResultsVWCClean22 MinResultsLCClean2_10
MinResultsVWCClean23 MinResultsLCClean2_11
MinResultsVWCClean24 MinResultsLCClean2_12
    ;
    by TIMESTAMP;
run;

/*remove duplicated data*/

proc sort data = Irrproj.FinalResults 
          nodupkey ; 
  by TIMESTAMP;
run;
quit;

/*Check results of program with a scatterplot*/
title "Minimum Points For Data";
ODS GRAPHICS on/
    width=30in;
/*Macro for making graphing easier*/
/*start of min graphs*/
%macro plots (VOI);
%let min =min%sysfunc(tranwrd(&VOI,%str( ),%str(min)));
proc sgplot data=Irrproj.FinalResults noautolegend;
scatter x=TIMESTAMP y=&VOI;
scatter x=TIMESTAMP y=&min / markerattrs=(symbol=circlefilled color=red);
run;
%mend plots;

%plots ( LCClean1_1 );

%plots ( LCClean1_2 );

%plots ( LCClean1_3 );

%plots ( LCClean1_4 );

%plots ( LCClean1_5 );

%plots ( LCClean1_6 );

%plots ( LCClean1_7 );

%plots ( LCClean1_8 );

%plots ( LCClean1_9 );

%plots ( LCClean1_10 );

%plots ( LCClean1_11 );

%plots ( LCClean1_12 );

%plots ( LCClean2_1 );

%plots ( LCClean2_2 );

%plots ( LCClean2_3 );

%plots ( LCClean2_4 );

%plots ( LCClean2_5 );

%plots ( LCClean2_6 );

%plots ( LCClean2_7 );

%plots ( LCClean2_8 );

%plots ( LCClean2_9 );

%plots ( LCClean2_10 );

%plots ( LCClean2_11 );

%plots ( LCClean2_12 );


%plots ( VWCClean1 );

%plots ( VWCClean2 );

%plots ( VWCClean3 );

%plots ( VWCClean4 );

%plots ( VWCClean5 );

%plots ( VWCClean6 );

%plots ( VWCClean7 );

%plots ( VWCClean8 );

%plots ( VWCClean9 );

%plots ( VWCClean10 );

%plots ( VWCClean11 );

%plots ( VWCClean12 );

%plots ( VWCClean13 );

%plots ( VWCClean14 );

%plots ( VWCClean15 );

%plots ( VWCClean16 );

%plots ( VWCClean17 );

%plots ( VWCClean18 );

%plots ( VWCClean19 );

%plots ( VWCClean20 );

%plots ( VWCClean21 );

%plots ( VWCClean22 );

%plots ( VWCClean23 );

%plots ( VWCClean24 );

title "Maximum Points For Data";

%macro maxplots (VOI);
%let Cmax =Cmax%sysfunc(tranwrd(&VOI,%str( ),%str(Cmax)));
proc sgplot data=Irrproj.FinalResults noautolegend;
scatter x=TIMESTAMP y=&VOI;
scatter x=TIMESTAMP y=&Cmax / markerattrs=(symbol=circlefilled color=red);
run;
%mend maxplots;

%maxplots ( LCClean1_1 );

%maxplots ( LCClean1_2 );

%maxplots ( LCClean1_3 );

%maxplots ( LCClean1_4 );

%maxplots ( LCClean1_5 );

%maxplots ( LCClean1_6 );

%maxplots ( LCClean1_7 );

%maxplots ( LCClean1_8 );

%maxplots ( LCClean1_9 );

%maxplots ( LCClean1_10 );

%maxplots ( LCClean1_11 );

%maxplots ( LCClean1_12 );

%maxplots ( LCClean2_1 );

%maxplots ( LCClean2_2 );

%maxplots ( LCClean2_3 );

%maxplots ( LCClean2_4 );

%maxplots ( LCClean2_5 );

%maxplots ( LCClean2_6 );

%maxplots ( LCClean2_7 );

%maxplots ( LCClean2_8 );

%maxplots ( LCClean2_9 );

%maxplots ( LCClean2_10 );

%maxplots ( LCClean2_11 );

%maxplots ( LCClean2_12 );


%maxplots ( VWCClean1 );

%maxplots ( VWCClean2 );

%maxplots ( VWCClean3 );

%maxplots ( VWCClean4 );

%maxplots ( VWCClean5 );

%maxplots ( VWCClean6 );

%maxplots ( VWCClean7 );

%maxplots ( VWCClean8 );

%maxplots ( VWCClean9 );

%maxplots ( VWCClean10 );

%maxplots ( VWCClean11 );

%maxplots ( VWCClean12 );

%maxplots ( VWCClean13 );

%maxplots ( VWCClean14 );

%maxplots ( VWCClean15 );

%maxplots ( VWCClean16 );

%maxplots ( VWCClean17 );

%maxplots ( VWCClean18 );

%maxplots ( VWCClean19 );

%maxplots ( VWCClean20 );

%maxplots ( VWCClean21 );

%maxplots ( VWCClean22 );

%maxplots ( VWCClean23 );

%maxplots ( VWCClean24 );

ODS GRAPHICS off;
/*export the data*/
proc export data=Irrproj.FinalResults
    outfile="C:\Users\yujer\Downloads\Irrproj.updatedfinalresults.xlsx"
    dbms=xlsx
    replace;
run;
/*dm 'odsresults; clear';*/



