clc;
clear;
warning off;
prompt  = {'Enter file name:'};%
titul='Enter filename';
def={'c:\gelendzhik2004\kodak\olympus\aug'};
lines=1;
answer=inputdlg(prompt,titul,lines,def);
file=answer{1};
 x=imread(file);
 figure;
 imshow(x);
 title('use mouse to input coordinates');
ch=1;
[cx,cy,c,xi,yi] = improfile;
siz=size(c);
if length(siz)==3
fig2=figure;
set(fig2,'numbertitle','off');
set(fig2,'name','RGB Channels');
set(fig2,'menubar','none');
hold on;
plot(c(:,1),'r'),plot(c(:,2),'g'),plot(c(:,3),'b');
hold off;
legend('r','g','b',0);
title(['from (' int2str(xi(1)) ',' int2str(yi(1)), ') to (', int2str(xi(2)) ',' int2str(yi(2)) ')']);
elseif length(siz)==2
fig2=figure;
set(fig2,'numbertitle','off');
set(fig2,'name','trace');
set(fig2,'menubar','none');
hold on;
plot(c(:,1),'k');
title(['from (' num2str(xi(1)) ',' num2str(yi(1)), ') to (', num2str(xi(2)) ',' num2str(yi(2)) ')']);
hold off;
legend('trace',0);
end
    