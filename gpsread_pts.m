cd 'c:\gelendzhik2004\gps\gps_proc\'
file='26august_pts.txt';
[number,lat,lon,heigth]=textread(file,'Waypoint%dUser Waypoint N%f E%f%fm Symbol & Name Unknown Waypoint');
plot(lat,lon,'.r')
view(-90,-90)