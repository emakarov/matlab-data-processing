clc
clear
warning off
prompt  = {'Enter file name:'}%
titul='Enter filename';
def={'c:\gelendzhik2004\panasonic'};
lines=1;
answer=inputdlg(prompt,titul,lines,def);
file=answer{1};
fileinfo=aviinfo(file);
titul   =['Total number of frames in film  ' ' : ' num2str(fileinfo.NumFrames)];
ch=1;
while ch==1
 lines= 1;
 prompt  = {'Enter first frame:'};
 def={'1'};
 answer  = inputdlg(prompt,titul,lines,def);
 framestart=str2num(answer{1});
 a=aviread(file,framestart);
 x=(a.cdata);
 fig=figure;
 set(fig,'numbertitle','off');
 set(fig,'name','First frame');
 imshow(x);
 button = questdlg('want to change first frame?',...
 'Continue Operation','Yes','No','Yes');
   if strcmp(button,'Yes')
     ch=1;
   elseif strcmp(button,'No')
    ch=0;
   end
end
lines= 1;
prompt  = {'Enter first frame:','Enter last frame:'};
def={num2str(framestart),num2str(framestart+20)};
answer  = inputdlg(prompt,titul,lines,def);
framestart=str2num(answer{1});
framestop =str2num(answer{2});
if(framestop<framestart)
    errordlg('Framestart must be less than framestop or equal to it !');break;
end
a=aviread(file,framestart);
x=(a.cdata);
fig=figure;
set(fig,'numbertitle','off');
set(fig,'name','First frame---trace selection');
imshow(x);
title('use mouse to input coordinates');
ch=1;
while ch==1
[cx,cy,c,xi,yi] = improfile;
button = questdlg('want to change direction?',...
'Continue Operation','Yes','No','Yes');
if strcmp(button,'Yes')
   ch=1;
   figure(20);
elseif strcmp(button,'No')
   ch=0;
end
end
number=0;
%process of reading in .avi:
tic
x=0;
for timer=framestart:framestop
 a=aviread(file,timer);
 number=number+1;
  [xc,b]=frame2im(a);
  x=x+double(xc);
  end
end
toc
x=x/number;
c=improfile(x,xi,yi);
siz=size(c);
if length(siz)==3
fig2=figure;
set(fig2,'numbertitle','off');
set(fig2,'name','RGB Channels');
hold on;
plot(c(:,1),'r'),plot(c(:,2),'g'),plot(c(:,3),'b')
hold off
legend('r','g','b',0);
elseif length(siz)==2
fig2=figure;
set(fig2,'numbertitle','off');
set(fig2,'name','trace');
hold on;
plot(c(:,1),'k')
hold off
legend('trace',0);
end
