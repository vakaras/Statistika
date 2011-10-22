libname proj "C:\SAS\projektas\db";

/* Papildymas trukme */
data proj.os;
format mid_time time8. ;
set proj.os;
duration=(stop_time - start_time)/60;
mid_time=(start_time + stop_time)/2;
run;

%MACRO analyse(kintamasis=);

/* Dažnis pagal trukmę. */
proc gchar data=proj.os;
vbar &kintamasis / levels=14;
run;

/* Charakteristikų analizė */
proc means data=proj.os n sum p25 p50 p75 mean max min std skew kurt;
var &kintamasis;
run;

%MEND analyse;

%MACRO show_box(kintamasis=);

PROC BOXPLOT DATA=proj.os;
PLOT &kintamasis*type_id / BOXSTYLE=schematic;
RUN;
QUIT;

%MEND show_box;


%analyse(kintamasis=duration);
%analyse(kintamasis=mid_time);
*%analyse(kintamasis=start_time);
*%analyse(kintamasis=stop_time);

%show_box(kintamasis=duration);
*%show_box(kintamasis=start_time);
*%show_box(kintamasis=stop_time);
%show_box(kintamasis=mid_time);
