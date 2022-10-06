/*attempt one for SAS cleaning program*/

************************************************;
*Jerry Yu                                                                                 ;
*HW 1 Assignment   ;
*9/10/2022                                                                                     ;
************************************************;

/*DISCLAIMER: SAS Studio is not working for me, I am therefore using regular SAS until it is fixed*/

/*I am using a libname statement to make a library called hyu23*/
libname hyu23 'C:\sas\studioconfig\documents' ;

/*use a filename statement to designate the location of the file to SAS*/

filename scale url 'https://www4.stat.ncsu.edu/~online/ST307/Data/hyu23_balance-scale.csv';

/*now use proc import to import data*/

proc import datafile=scale
	dbms=csv
	out=hyu23.scale;
	getnames=yes;
	GUESSINGROWS = MAX;
run;

/*use proc sort to sort file by Right_Weight variable*/

proc sort data=hyu23.scale;
	by Right_Weight;
run;

/*use proc print to print sorted data*/

proc print data = hyu23.scale;
run;

/*First value of Right_Weight variable is 1*/

/*import yeast file. Note that the address is very different because I am not using SAS studio*/

filename yeast 'C:\Users\yujer\Downloads\hyu23_yeast.tsv';

proc import datafile=yeast
	dbms=tab
	out=hyu23.yeast;
	getnames=no;
	GUESSINGROWS = MAX;
run;

/*use a data step to add column labels to the dataset*/
data hyu23.yeast;
	set hyu23.yeast;
	rename var1 = gvh
			var2 = seq_name
			var3 = erl;
run;

/*print the dataset. not strictly necessary, but useful to get the first value */

proc print data = hyu23.yeast;
run;

/*the first values of the gvh variable is 0.44*/

/*use a libname statement to create a folder for the hepatitis data*/

libname hepat xlsx 'C:\Users\yujer\Downloads\hyu23_hepatitis.xlsx';

/*use a data step to extract the data file from the hepat folder and save it as a SAS dataset in the work folder*/

data work.hepatitis;
	set hepat.SHEET1;
run;
