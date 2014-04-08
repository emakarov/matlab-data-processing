cd c:\gelendzhik2004\e440\26aug\

file='2.dat';
numchan=4;
seechan=1
fpts=4096;
numcadr=32;
fs=2000;
seconds=10;

n=timeroff*fs/fpts;
a=zeros(numcadr,fpts/2);

fid=fopen(file,'r');
for t=1:n
x=fread(fid,[numchan,fpts],'float');
ax=x(seechan,:);
y=fft(ax)/fpts;
xpow=y.*conj(y);
a=[a(2:numcadr-1) xpow(1:fpts/2)];
surf(a);view(2);
end