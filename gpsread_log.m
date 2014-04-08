cd 'c:\gelendzhik2004\gps\gps_proc\';
file='23august_log.txt';
[lat,lon,day,month,year,hour,min,sec,heigth,leglength,legtime1,legtime2,legtime3,legspeed,course,degree]...
        =textread(file,'Trackpoint N%f E%f %d.%d.%d %d:%d:%d %fm %fm %d:%d:%d %fkph %d%ctrue');
clear degree;
lonm=792*(lon-37.97)*100;
latm=1110*(lat-44.568)*100;
plot(latm,lonm,'.-r')
view(-90,-90)