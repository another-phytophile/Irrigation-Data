/*libname statement to access the irrigation folder*/

libname irrproj 'C:\Users\yujer\OneDrive\Documents\Github\Irrigation-Data' ;

/*clean the data*/

/*plotting graphs for datacleaning */

ods graphics off;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_2 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_2;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_3 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_3;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_4 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_4;
run;


proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_5 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_5;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_6 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_6;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_7 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_7;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_8 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_8;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_9 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_9;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_10 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_10;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_11 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_11;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_12 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_12;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_14 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_14;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_15 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_15;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_16 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_16;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_17 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_17;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_18 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_18;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_19 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_19;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_20 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_20;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_21 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_21;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_22 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_22;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_23 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_23;
run;

proc sgplot data =Irrproj.Mastersasfile;
	vbox VWC_24 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN);
run;

proc sgplot data =Irrproj.Mastersasfile;
	scatter x= TIMESTAMP y=VWC_24;
run;

proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_2 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_3 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_4 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_5 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_6 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_7 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_8 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_9 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_10 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_11 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_2_12 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_2 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_3 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_4 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_5 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_6 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_7 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_8 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_9 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_10 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_11 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;
proc sgplot data =Irrproj.Mastersasfile; vbox Load_Cells_1_12 / DISPLAYSTATS=(MEAN MAX MIN MEDIAN); run;

/*datacleaning*/
data Irrproj.MasterSASFileClean;
	set Irrproj.Mastersasfile;

	length VWC1Clean 8;
	if VWC_1 < 25 then VWC1Clean = ".";
	else if VWC_1> 47 then VWC1Clean = ".";
	else VWC1Clean =  VWC_1*1;

	length VWC2Clean 8;
	if VWC_2 < 25 then VWC2Clean = ".";
	else if VWC_2> 55 then VWC2Clean = ".";
	else VWC2Clean =  VWC_2*1;

	length VWC3Clean 8;
	if VWC_3 < 25 then VWC3Clean = ".";
	else if VWC_3> 49 then VWC3Clean = ".";
	else VWC3Clean =  VWC_3*1;

	length VWC4Clean 8;
	if VWC_4 < 25 then VWC4Clean = ".";
	else if VWC_4> 49 then VWC4Clean = ".";
	else VWC4Clean =  VWC_4*1;

	length VWC5Clean 8;
	if VWC_5 < 27 then VWC5Clean = ".";
	else if VWC_5> 52 then VWC5Clean = ".";
	else VWC5Clean =  VWC_5*1;

	length VWC6Clean 8;
	if VWC_6 < 31 then VWC6Clean = ".";
	else if VWC_6> 55 then VWC6Clean = ".";
	else VWC6Clean =  VWC_6*1;

	length VWC7Clean 8;
	if VWC_7 < 30 then VWC7Clean = ".";
	else if VWC_7> 52 then VWC7Clean = ".";
	else VWC7Clean =  VWC_7*1;

	length VWC8Clean 8;
	if VWC_8 < 30 then VWC8Clean = ".";
	else if VWC_8> 47 then VWC8Clean = ".";
	else VWC8Clean =  VWC_8*1;

	length VWC9Clean 8;
	if VWC_9 < 29 then VWC9Clean = ".";
	else if VWC_9> 58 then VWC9Clean = ".";
	else VWC9Clean =  VWC_9*1;

	length VWC10Clean 8;
	if VWC_10 < 25 then VWC10Clean = ".";
	else if VWC_10> 48 then VWC10Clean = ".";
	else VWC10Clean =  VWC_10*1;

	length VWC11Clean 8;
	if VWC_11 < 30 then VWC11Clean = ".";
	else if VWC_11> 50 then VWC11Clean = ".";
	else VWC11Clean =  VWC_11*1;

	length VWC12Clean 8;
	if VWC_12 < 30 then VWC12Clean = ".";
	else if VWC_12> 50 then VWC12Clean = ".";
	else VWC12Clean =  VWC_12*1;

	length VWC13Clean 8;
	if VWC_13 < 25 then VWC13Clean = ".";
	else if VWC_13> 47 then VWC13Clean = ".";
	else VWC13Clean =  VWC_13*1;

	length VWC14Clean 8;
	if VWC_14 < 25 then VWC14Clean = ".";
	else if VWC_14> 50 then VWC14Clean = ".";
	else VWC14Clean =  VWC_14*1;

	length VWC15Clean 8;
	if VWC_15 < 26 then VWC15Clean = ".";
	else if VWC_15> 55 then VWC15Clean = ".";
	else VWC15Clean =  VWC_15*1;

	length VWC16Clean 8;
	if VWC_16 < 28 then VWC16Clean = ".";
	else if VWC_16> 53 then VWC16Clean = ".";
	else VWC16Clean =  VWC_16*1;

	length VWC17Clean 8;
	if VWC_17 < 30 then VWC17Clean = ".";
	else if VWC_17> 53 then VWC17Clean = ".";
	else VWC17Clean =  VWC_17*1;

	length VWC18Clean 8;
	if VWC_18 < 30 then VWC18Clean = ".";
	else if VWC_18> 52 then VWC18Clean = ".";
	else VWC18Clean =  VWC_18*1;

	length VWC19Clean 8;
	if VWC_19 < 30 then VWC19Clean = ".";
	else if VWC_19> 50 then VWC19Clean = ".";
	else VWC19Clean =  VWC_19*1;

	length VWC20Clean 8;
	if VWC_20 < 30 then VWC20Clean = ".";
	else if VWC_20> 55 then VWC20Clean = ".";
	else VWC20Clean =  VWC_20*1;

	length VWC21Clean 8;
	if VWC_21 < 28 then VWC21Clean = ".";
	else if VWC_21> 55 then VWC21Clean = ".";
	else VWC21Clean =  VWC_21*1;

	length VWC22Clean 8;
	if VWC_22 < 24 then VWC22Clean = ".";
	else if VWC_22> 51 then VWC22Clean = ".";
	else VWC22Clean =  VWC_22*1;

	length VWC23Clean 8;
	if VWC_23 < 30 then VWC23Clean = ".";
	else if VWC_23> 50 then VWC23Clean = ".";
	else VWC23Clean =  VWC_23*1;

	length VWC24Clean 8;
	if VWC_24 < 30 then VWC24Clean = ".";
	else if VWC_24> 50 then VWC24Clean = ".";
	else VWC24Clean =  VWC_24*1;

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

ODS GRAPHICS on/
	width=20in;
ods graphics on / height=40in;
proc sgscatter data=Irrproj.MasterSASFileClean;
  title "all vwcs";
  plot (VWC1Clean VWC2Clean VWC3Clean VWC4Clean VWC5Clean VWC6Clean VWC7Clean VWC8Clean VWC9Clean VWC10Clean 
		VWC11Clean VWC12Clean VWC13Clean VWC14Clean VWC15Clean VWC16Clean VWC17Clean VWC18Clean VWC19Clean VWC20Clean
		 VWC21Clean VWC22Clean VWC23Clean VWC24Clean)*(TIMESTAMP);
run;

proc sgscatter data=Irrproj.MasterSASFileClean;
  title "all LCs";
  plot (LCClean1_1 LCClean2_1 LCClean2_2 LCClean2_3 LCClean2_4 LCClean2_5 LCClean2_6 LCClean2_7 LCClean2_8 LCClean2_9 LCClean2_10 LCClean2_11 LCClean2_12 LCClean1_2 LCClean1_3 LCClean1_4 LCClean1_5 LCClean1_6 LCClean1_7 LCClean1_8 LCClean1_9 LCClean1_10 LCClean1_11 LCClean1_12)*(TIMESTAMP);
run;
