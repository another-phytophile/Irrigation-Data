/*Authored By: Jerry Yu*/
/*Authored On: 2023-1-07*/
/*Authored To: 1) Adapt previous versions of the program into 1 final version*/
/*             2)   data*/
/*             3) Fit LOESS to predict target variable based */
/*                on TIMESTAMP*/
/*             4) Find extrema in original data by:*/
/*                A) Transposing data so all observations are */
/*                   on one record*/
/*                B) Search records for a sign change in the */
/*                   successive differences*/
/*                C) Find all observations in original data */
/*                   within neighborhood of LOESS extrema*/
/*                D) Find original data extrema within each */
/*                   neighborhood of LOESS extrema*/
/*    Change Logs: */

/*clear previous log*/
dm 'log;clear;output;clear;';

/*clear previous output*/
dm 'odsresults; clear';

x 'cd C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data\SAS Data Sets';

/*create library for data*/
libname irrproj '.';


/*for better ease for debugging*/
OPTIONS SYMBOLGEN MPRINT MLOGIC;

/*plotting graphs for data ing */

title;

%macro graphinit (VOI); 
%do i = 1 %to &VOI;
      %let var_name = VWC_&i;
proc sgplot data =Irrproj.Mastersasfile;
    vbox &var_name / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;
%end;
%mend graphinit; 

%graphinit (24);

%macro loadcell1graph (VOI); 
%do i = 1 %to &VOI;
      %let var_name = Load_Cells_1_&i;
proc sgplot data =Irrproj.Mastersasfile;
    vbox &var_name / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;
%end;
%mend loadcell1graph; 

%loadcell1graph (12);

%macro loadcell1graph (VOI); 
%do i = 1 %to &VOI;
      %let var_name = Load_Cells_2_&i;
proc sgplot data =Irrproj.Mastersasfile;
    vbox &var_name / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;
%end;
%mend loadcell1graph; 

%loadcell1graph (12);

/*data ing*/
data Irrproj.MasterSASFileClean ;
    set Irrproj.Mastersasfile;

    length VWCClean1  8;
    if VWC_1 < 25 then VWCClean1  = ".";
    else if VWC_1> 47 then VWCClean1  = ".";
    else VWCClean1  =  VWC_1*1;

    length VWCClean2  8;
    if VWC_2 < 25 then VWCClean2  = ".";
    else if VWC_2> 55 then VWCClean2  = ".";
    else VWCClean2  =  VWC_2*1;

    length VWCClean3  8;
    if VWC_3 < 25 then VWCClean3  = ".";
    else if VWC_3> 49 then VWCClean3  = ".";
    else VWCClean3  =  VWC_3*1;

    length VWCClean4  8;
    if VWC_4 < 25 then VWCClean4  = ".";
    else if VWC_4> 49 then VWCClean4  = ".";
    else VWCClean4  =  VWC_4*1;

    length VWCClean5  8;
    if VWC_5 < 27 then VWCClean5  = ".";
    else if VWC_5> 52 then VWCClean5  = ".";
    else VWCClean5  =  VWC_5*1;

    length VWCClean6  8;
    if VWC_6 < 31 then VWCClean6  = ".";
    else if VWC_6> 55 then VWCClean6  = ".";
    else VWCClean6  =  VWC_6*1;

    length VWCClean7  8;
    if VWC_7 < 30 then VWCClean7  = ".";
    else if VWC_7> 52 then VWCClean7  = ".";
    else VWCClean7  =  VWC_7*1;

    length VWCClean8  8;
    if VWC_8 < 30 then VWCClean8  = ".";
    else if VWC_8> 47 then VWCClean8  = ".";
    else VWCClean8  =  VWC_8*1;

    length VWCClean9  8;
    if VWC_9 < 29 then VWCClean9  = ".";
    else if VWC_9> 58 then VWCClean9  = ".";
    else VWCClean9  =  VWC_9*1;

    length VWCClean10  8;
    if VWC_10 < 25 then VWCClean10  = ".";
    else if VWC_10> 48 then VWCClean10  = ".";
    else VWCClean10  =  VWC_10*1;

    length VWCClean11  8;
    if VWC_11 < 30 then VWCClean11  = ".";
    else if VWC_11> 50 then VWCClean11  = ".";
    else VWCClean11  =  VWC_11*1;

    length VWCClean12  8;
    if VWC_12 < 30 then VWCClean12  = ".";
    else if VWC_12> 50 then VWCClean12  = ".";
    else VWCClean12  =  VWC_12*1;

    length VWCClean13  8;
    if VWC_13 < 25 then VWCClean13  = ".";
    else if VWC_13> 47 then VWCClean13  = ".";
    else VWCClean13  =  VWC_13*1;

    length VWCClean14  8;
    if VWC_14 < 25 then VWCClean14  = ".";
    else if VWC_14> 50 then VWCClean14  = ".";
    else VWCClean14  =  VWC_14*1;

    length VWCClean15  8;
    if VWC_15 < 26 then VWCClean15  = ".";
    else if VWC_15> 55 then VWCClean15  = ".";
    else VWCClean15  =  VWC_15*1;

    length VWCClean16  8;
    if VWC_16 < 28 then VWCClean16  = ".";
    else if VWC_16> 53 then VWCClean16  = ".";
    else VWCClean16  =  VWC_16*1;

    length VWCClean17  8;
    if VWC_17 < 30 then VWCClean17  = ".";
    else if VWC_17> 53 then VWCClean17  = ".";
    else VWCClean17  =  VWC_17*1;

    length VWCClean18  8;
    if VWC_18 < 30 then VWCClean18  = ".";
    else if VWC_18> 52 then VWCClean18  = ".";
    else VWCClean18  =  VWC_18*1;

    length VWCClean19  8;
    if VWC_19 < 30 then VWCClean19  = ".";
    else if VWC_19> 50 then VWCClean19  = ".";
    else VWCClean19  =  VWC_19*1;

    length VWCClean20  8;
    if VWC_20 < 30 then VWCClean20  = ".";
    else if VWC_20> 55 then VWCClean20  = ".";
    else VWCClean20  =  VWC_20*1;

    length VWCClean21  8;
    if VWC_21 < 28 then VWCClean21  = ".";
    else if VWC_21> 55 then VWCClean21  = ".";
    else VWCClean21  =  VWC_21*1;

    length VWCClean22  8;
    if VWC_22 < 24 then VWCClean22  = ".";
    else if VWC_22> 51 then VWCClean22  = ".";
    else VWCClean22  =  VWC_22*1;

    length VWCClean23  8;
    if VWC_23 < 30 then VWCClean23  = ".";
    else if VWC_23> 50 then VWCClean23  = ".";
    else VWCClean23  =  VWC_23*1;

    length VWCClean24  8;
    if VWC_24 < 30 then VWCClean24  = ".";
    else if VWC_24> 50 then VWCClean24  = ".";
    else VWCClean24  =  VWC_24*1;

    length LCClean1_1 8;
    if Load_Cells_1_1 < 5 then LCClean1_1 = ".";
    else if Load_Cells_1_1> 8 then LCClean1_1 = ".";
    else LCClean1_1 =  Load_Cells_1_1*1;

    length LCClean2_1 8;
    if Load_Cells_2_1 < 5 then LCClean2_1 = ".";
    else if Load_Cells_2_1> 8 then LCClean2_1 = ".";
    else LCClean2_1 =  Load_Cells_2_1*1;

length LCClean2_2 8 ; if Load_Cells_2_2 < 5.2136 then LCClean2_2  ="."; else if Load_Cells_2_2 > 7.5144 then LCClean2_2 ="."; else LCClean2_2 = Load_Cells_2_2 *1;
length LCClean2_3 8 ; if Load_Cells_2_3 < 4.792 then LCClean2_3 ="."; else if Load_Cells_2_3 > 6.536 then LCClean2_3 ="."; else LCClean2_3 = Load_Cells_2_3 *1;
length LCClean2_4 8 ; if Load_Cells_2_4 < 5.5656 then LCClean2_4 ="."; else if Load_Cells_2_4 > 7.0344 then LCClean2_4 ="."; else LCClean2_4 = Load_Cells_2_4 *1;
length LCClean2_5 8 ; if Load_Cells_2_5 < 5.3752 then LCClean2_5 ="."; else if Load_Cells_2_5 > 7.3321 then LCClean2_5 ="."; else LCClean2_5 = Load_Cells_2_5 *1;
length LCClean2_6 8 ; if Load_Cells_2_6 < 4.3646 then LCClean2_6 ="."; else if Load_Cells_2_6 > 10.6014 then LCClean2_6 ="."; else LCClean2_6 = Load_Cells_2_6 *1;
length LCClean2_7 8 ; if Load_Cells_2_7 < 4.815 then LCClean2_7 ="."; else if Load_Cells_2_7 > 8.559 then LCClean2_7 ="."; else LCClean2_7 = Load_Cells_2_7 *1;
length LCClean2_8 8 ; if Load_Cells_2_8 < 5.0762 then LCClean2_8 ="."; else if Load_Cells_2_8 > 8.1098 then LCClean2_8 ="."; else LCClean2_8 = Load_Cells_2_8 *1;
length LCClean2_9 8 ; if Load_Cells_2_9 < 5.0408 then LCClean2_9 ="."; else if Load_Cells_2_9 > 7.8492 then LCClean2_9 ="."; else LCClean2_9 = Load_Cells_2_9 *1;
length LCClean2_10 8 ; if Load_Cells_2_10 < 5.1574 then LCClean2_10 ="."; else if Load_Cells_2_10 > 7.4966 then LCClean2_10 ="."; else LCClean2_10 = Load_Cells_2_10 *1;
length LCClean2_11 8 ; if Load_Cells_2_11 < 4.9484 then LCClean2_11 ="."; else if Load_Cells_2_11 > 7.6876 then LCClean2_11 ="."; else LCClean2_11 = Load_Cells_2_11 *1;
length LCClean2_12 8 ; if Load_Cells_2_12 < 5.2242 then LCClean2_12 ="."; else if Load_Cells_2_12 > 7.3824 then LCClean2_12 ="."; else LCClean2_12 = Load_Cells_2_12 *1;
length LCClean1_2 8 ; if Load_Cells_1_2 < 4.466 then LCClean1_2 ="."; else if Load_Cells_1_2 > 8.066 then LCClean1_2 ="."; else LCClean1_2 = Load_Cells_1_2 *1;
length LCClean1_3 8 ; if Load_Cells_1_3 < 5.3608 then LCClean1_3 ="."; else if Load_Cells_1_3 > 7.4632 then LCClean1_3 ="."; else LCClean1_3 = Load_Cells_1_3 *1;
length LCClean1_4 8 ; if Load_Cells_1_4 < 5.494 then LCClean1_4 ="."; else if Load_Cells_1_4 > 7.262 then LCClean1_4 ="."; else LCClean1_4 = Load_Cells_1_4 *1;
length LCClean1_5 8 ; if Load_Cells_1_5 < 5.3666 then LCClean1_5 ="."; else if Load_Cells_1_5 > 7.3532 then LCClean1_5 ="."; else LCClean1_5 = Load_Cells_1_5 *1;
length LCClean1_6 8 ; if Load_Cells_1_6 < 4.682 then LCClean1_6 ="."; else if Load_Cells_1_6 > 9.194 then LCClean1_6 ="."; else LCClean1_6 = Load_Cells_1_6 *1;
length LCClean1_7 8 ; if Load_Cells_1_7 < 5.3248 then LCClean1_7 ="."; else if Load_Cells_1_7 > 8.2752 then LCClean1_7 ="."; else LCClean1_7 = Load_Cells_1_7 *1;
length LCClean1_8 8 ; if Load_Cells_1_8 < 5.2394 then LCClean1_8 ="."; else if Load_Cells_1_8 > 7.4826 then LCClean1_8 ="."; else LCClean1_8 = Load_Cells_1_8 *1;
length LCClean1_9 8 ; if Load_Cells_1_9 < 5.3154 then LCClean1_9 ="."; else if Load_Cells_1_9 > 7.4946 then LCClean1_9 ="."; else LCClean1_9 = Load_Cells_1_9 *1;
length LCClean1_10 8 ; if Load_Cells_1_10 < 5.6902 then LCClean1_10 ="."; else if Load_Cells_1_10 > 7.8118 then LCClean1_10 ="."; else LCClean1_10 = Load_Cells_1_10 *1;
length LCClean1_11 8 ; if Load_Cells_1_11 < 4.987 then LCClean1_11 ="."; else if Load_Cells_1_11 > 7.707 then LCClean1_11 ="."; else LCClean1_11 = Load_Cells_1_11 *1;
length LCClean1_12 8 ; if Load_Cells_1_12 < 5.2486 then LCClean1_12 ="."; else if Load_Cells_1_12 > 7.5883 then LCClean1_12 ="."; else LCClean1_12 = Load_Cells_1_12 *1;

drop VWC_1 VWC_2 VWC_3 VWC_4 VWC_5 VWC_6 VWC_7 VWC_8 VWC_9 VWC_10 
        VWC_11 VWC_12 VWC_13 VWC_14 VWC_15 VWC_16 VWC_17 VWC_18 VWC_19 VWC_20
         VWC_21 VWC_22 VWC_23 VWC_24 Load_Cells_1_1 Load_Cells_2_1 Load_Cells_2_2
Load_Cells_2_3
Load_Cells_2_4
Load_Cells_2_5
Load_Cells_2_6
Load_Cells_2_7
Load_Cells_2_8
Load_Cells_2_9
Load_Cells_2_10
Load_Cells_2_11
Load_Cells_2_12
Load_Cells_1_2
Load_Cells_1_3
Load_Cells_1_4
Load_Cells_1_5
Load_Cells_1_6
Load_Cells_1_7
Load_Cells_1_8 Load_Cells_1_9 Load_Cells_1_10 Load_Cells_1_11 Load_Cells_1_12;
run;

/*creating scatterplots to check if the data ing was successful*/

ODS GRAPHICS on/
    width=20in;
ods graphics on / height=40in;
proc sgscatter data=Irrproj.MasterSASFile ;
  title "all VWCCleans";
  plot (VWCClean1  VWCClean2  VWCClean3  VWCClean4  VWCClean5  VWCClean6  VWCClean7  VWCClean8  VWCClean9  VWCClean10  
        VWCClean11  VWCClean12  VWCClean13  VWCClean14  VWCClean15  VWCClean16  VWCClean17  VWCClean18  VWCClean19  VWCClean20 
         VWCClean21  VWCClean22  VWCClean23  VWCClean24 )*(TIMESTAMP);
run;

proc sgscatter data=Irrproj.MasterSASFile ;
  title "all LCs";
  plot (LCClean1_1 LCClean2_1 LCClean2_2 LCClean2_3 LCClean2_4 LCClean2_5 LCClean2_6 LCClean2_7 LCClean2_8 LCClean2_9 LCClean2_10 LCClean2_11 LCClean2_12 LCClean1_2 LCClean1_3 LCClean1_4 LCClean1_5 LCClean1_6 LCClean1_7 LCClean1_8 LCClean1_9 LCClean1_10 LCClean1_11 LCClean1_12)*(TIMESTAMP);
run;
ods graphics off;
