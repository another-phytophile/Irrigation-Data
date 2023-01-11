/*
Authored By: Jonathan W. Duggins
Authored On: 2022-11-10
Authored To: 1) Adapt code written by Jerry Yu
             2) Clean data
             3) Fit LOESS to predict target variable based 
                on TIMESTAMP
             4) Find extrema in original data by:
                A) Transposing data so all observations are 
                   on one record
                B) Search records for a sign change in the 
                   successive differences
                C) Find all observations in original data 
                   within neighborhood of LOESS extrema
                D) Find original data extrema within each 
                   neighborhood of LOESS extrema

Change Logs: 

Modified By: 
Modified On: 
Modified To: 
*/

*Set path to structured data files;
libname Jerry "C:\Users\Jonathan\Desktop\JWD Consulting";

/*Clean data and determine number of observations*/
data Jerry.Station1Clean;
  set Jerry.MasterSasFile end = last;

  *Group variables variables
    - Columns are the different VWC/LC variables
    - Row 1 is Dirty, Row 2 is Clean
  ;
  array Varz[2,4] VWC_1 VWC_13 Load_Cells_1_1 Load_Cells_2_1
                  VWC1Clean VWC13Clean LC11Clean LC21Clean;

  *Group the bounds together too
    - Each variable has its own column in case bounds change
    - First row lower, second row upper
  ;
  array Boundz[2,4] _temporary_ (25 25 5 5
                                 47 47 8 8);

  *Loop through all variables in array group
   - If inside its bounds, assign to Clean
   - If outside its bounds, Clean is missing
  ;
  do i = 1 to dim(Varz,2);
    if Boundz[1,i] le Varz[1,i] le Boundz[2,i] then Varz[2,i] = Varz[1,i];
      else call missing(Varz[2,i]);
  end;

  *Save the number of observations to macro variable;
  if last then call symput('nobs',_n_);

  *List of variables to *NOT* send to the data set;
  drop i VWC_1 VWC_13 Load_Cells_1_1 Load_Cells_2_1;
run;

/*Sequence data by timestamp in case data is not
 already sorted*/
proc sort data = Jerry.Station1Clean;
  by TimeStamp;
run;

/*Model
 - Fit LOESS model 
 - Score original data
 - Save LOESS results 
*/
ods output ScoreResults = Jerry.LoessResults(drop = smoothingparameter
                                                    scoredata);
proc loess data=Jerry.Station1Clean;
  model LC21Clean = TimeStamp / smooth = 0.0025;
  score data = Jerry.Station1Clean;
run;

/*Reshape to get all predicted values 
 in single record for easier processing*/
proc transpose data = Jerry.LOESSResults 
               out = Jerry.TransResults 
               prefix = obs;
  var p_LC21Clean;
  id obs;
run;

/*Locate the extrema*/
data Jerry.Extrema(keep = obs type);
  set Jerry.TransResults;

  *Group observed values into array
   - Macro variable created from DATA step above
  ;
  array aval[&nobs] obs:;

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
        output Jerry.Extrema;
      end;
      else if SignAhead > SignBehind then do;
          Type = "Min";
          output Jerry.Extrema;
        end;
  end;
run;

/*Find original records that are 
  within D spots of extrema*/
data Jerry.Neighborhood(drop = nbrhood d);
  *Only bring in records of the extrema type we want;
  set Jerry.Extrema(where = (lowcase(type) = "min"));

  *Set neighborhood width for search;
  nbrhood = 3;

  *Keep track of which local extrema;
  Extrema + 1;
  
  *Find records within the neighborhood;
  do d = -nbrhood to nbrhood;
    Rec = Obs + d;
    set Jerry.LoessResults(drop = obs) point = Rec;
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
 - Add DESCENDING keyword before target variable
   if maxima are of interest.
 - Much less efficient than SQL, so swap this for
   SQL code if all users are comfortable with SQL
*/
proc sort data = Jerry.Neighborhood(where = (not missing(LC21Clean)))
          out = Jerry.NeighborSort;
  by Extrema Type LC21Clean p_LC21Clean;
run;

proc sort data = Jerry.NeighborSort 
          out = Jerry.Results
          nodupkey;
  by Extrema Type;
run;

quit;
