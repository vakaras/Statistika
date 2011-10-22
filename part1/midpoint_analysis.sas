libname proj "C:\SAS\projektas\db";

/* Papildymas trukme */
data proj.visi;
format mid_time time8. ;
set proj.visi;
duration=(stop_time - start_time);
mid_time=(start_time + stop_time)/2;
run;

%MACRO analyse(kintamasis=);

proc means data=proj.visi noprint;
var &kintamasis;
output out=proj.rez n=count sum=sum p25=q1 p50=q2 p75=q3 mean=mean
	max=max min=min std=std skew=skew kurt=kurt;
by name;
run;

data proj.rez;
format sum time8. mean time8. q1 time8. q2 time8. q3 time8. max time8. min time8.;
set proj.rez;
run;

%MEND analyse;

%MACRO show_box(kintamasis=);

axis1 order = ( 25200 to 86400 by 3600)
	label = (height = 1.25 'Darbo vidurio momentai');
axis2 label = (height = 1.25 'Veiklų tipai');

PROC BOXPLOT DATA=proj.visi;
PLOT &kintamasis * type_id /
	BOXSTYLE=schematic
	vaxis=axis1
	haxis=axis2;
RUN;
QUIT;

%MEND show_box;


%analyse(kintamasis=mid_time);
%show_box(kintamasis=mid_time);
