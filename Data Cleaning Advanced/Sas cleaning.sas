/*Author: Hazoshe (Jerry)Yu*/
/*Purpose:*/
/*        1. Read in a slightly modified LC dataset from excel*/
/*        2. Subset the data into 24 data sets based on the LC data*/
/*        3. Where there are 2 maxes or 2 mins in a row, find an intervening maximum or minimum or delete one of the maximums or minimums*/
/*        4. Deal with other erroneous data points, as needed*/
/*Date: 4/20/2023*/
/*Changelog: */
/*          4/20/23: set up program */

/*clear previous log*/
dm "log;clear;output;clear;";

/*library & fileref statements*/
x ' cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\Data Cleaning Advanced\SAS and Final Data Sets';
libname Results '.';

x 'cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\Data Cleaning Advanced\Raw Data Sets';
filename RawData ".\Whole crop water use analysis zone by zone (for Jerry).xlsx";

/*import Whole crop water use analysis zone by zone(for Jerry)*/
proc import datafile="RawData"
  out = Results.RawSasminmax
  DBMS = xlsx
  replace;
  sheet="Data Table";
  range= "A2:BC";
run;

%macro test(voi);
data test&voi;
  set Results.RawSasminmax;
  where &voi ne .;
run;
%mend;

%test(CmaxLC_1_1);

%test(minLC_1_1);

%test(CmaxLC_2_1);

%test(minLC_2_1);

%test(CmaxLC_1_2);

%test(minLC_1_2);
/*replace variables names to make life easier lol*/
/*data work.RawSasminmax;*/
/*   set Results.RawSasminmax;*/
/*   rename a_CmaxLC_1_1-a_minLC_2_12 = VOI1-VOI48;*/
/*   drop Zone_ Plant_ID Sensor_type;*/
/*run;*/
/*that did not work, despite like over an hour of effort, please please dont use SAS after this*/

/*create a macro to subset the functions*/
