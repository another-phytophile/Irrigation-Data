/*Jerry Yu*/
/*12/16/22*/
/*Create a program to find the point where the loss of water from a pot becomes due to */
/*evaprotranspiration and not due to runoff*
Substantial part of code and consulting done by Dr. Duggins/


/*libname statement to access the irrigation folder*/
/*ods output off;*/
/*ods graphics / reset;*/

libname irrproj 'C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data' ;

/*combine all maxes into a dataset*/

data aamaxtest;
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

proc sort data = Irrproj.Finalresults out =  sortedfinals
          nodupkey ; 
  by TIMESTAMP;
run;
quit;

data aCleanmaxVWCClean1 ;
set CleanRawmaxes;
if maxVWCClean1>. then do p=max(_n_+6,1) to min(_n_+6,nobs);
  set CleanRawmaxes point=p nobs=nobs;
  output;
  end;
  rename VWCClean1 = CmaxVWCClean1;
  keep TIMESTAMP VWCClean1;
run;

proc sort data = aCleanmaxVWCClean1;
	by TIMESTAMP;
run;





/*/*create  export excel fiel to process in JMP*/*/
/*data JMPtest (keep = VWCClean1 VWCClean10 p_VWCClean1 p_VWCClean10 TIMESTAMP p_LCClean2_3 p_LCClean2_11 LCClean2_3 LCClean2_11);*/
/*set Irrproj.Loessresults;*/
/*run;*/
/*proc expand data =JMPtest out=exportJMP1 ; */
/*convert p_LCClean2_11=signdif/transformout=(reverse dif 10 reverse); */
/*run;*/
/*proc expand data = exportJMP1 out = exportJMP2;*/
/*convert signdif=asymptotes/transformout=(reverse dif 5 reverse);*/
/*proc export data =exportJMP2*/
/*outfile = 'C:\Users\yujer\Downloads\exportJMP8'*/
/*dbms=xlsx*/
/*replace;*/
/*run;*/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/*/*Start of inflection processing */*/
/**/
/*/*Find original records that are */
/*  within D spots of extrema*/*/
/*data Neighborhoodinflection(drop = nbrhood d);*/
/*  *Only bring in records of the extrema type we want;*/
/*  set Irrproj.Extrema(where = (lowcase(type) = "max"));*/
/**/
/*  *Set neighborhood width for search;*/
/*  nbrhood = 6;*/
/**/
/*  *Keep track of which local extrema;*/
/*  Extrema + 1;*/
/*  */
/*  *Find records within the neighborhood;*/
/*  do d = -nbrhood to nbrhood;*/
/*    Rec = Obs + d;*/
/*    set Irrproj.LOESSResults(drop = obs) point = Rec;*/
/*    output;*/
/*  end;*/
/*run;*/
/* data P1maxtest;*/
/* 	set Neighborhoodinflection;*/
/*	where _NAME_="p_LCClean1_1";*/
/*run;*/
/*ODS GRAPHICS on/*/
/*	width=30in;*/
/*proc sgplot  data =P1maxtest*/
/**/
/*proc sort data = Irrproj.Neighborhoodmax (where = (not missing( LCClean1_1 ))) */
/*          out =  NSortmaxLCClean1_1 ;*/
/*  where _NAME_="p_LCClean1_1";*/
/*  by descending Extrema descending Type descending LCClean1_1  descending p_LCClean1_1 ;*/
/*run;*/
/**/
/*proc sort data = NSortmaxLCClean1_1 out =  MaxresultsLCClean1_1 (rename = LCClean1_1 = maxLCClean1_1 keep = TIMESTAMP LCClean1_1 )*/
/*          nodupkey ; */
/*  by descending Extrema descending Type;*/
/*run;*/
/*quit;*/
/*proc sort data =  MaxresultsLCClean1_1 ;*/
/*by TIMESTAMP;*/
/*run;*/

