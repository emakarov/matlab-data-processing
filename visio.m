cd c:\gelendzhik2004\e440\28aug\
file='block3.wav';

timestart=10;
timefinish=2000;
ncadr=90;
fftpts=2*1024;
fmin=5;
fmax=500;
channel=3;
scalingmax=0.02;
scalingmin=1e-4;

[x,fs]=wavread(file,5);
nstart=fs*timestart;
nfinish=fs*timefinish;
nfmin=round(fftpts*fmin/fs);
nfmax=round(fftpts*fmax/fs);
a=zeros(ncadr,fftpts/2)';
figure(2)
set(gcf,'doublebuffer','on');
for k=nstart:fftpts:nfinish
[x,fs]=wavread(file,[k k+fftpts-1]); 
ax=x(:,channel);
y=fft(ax);
powy=y.*conj(y);
a=[a(:,2:end) powy(1:fftpts/2)];
%a(nfmax,ncadr)=scalingmax;
%a(nfmax,1)=scalingmin;
surf(1:ncadr,fs*(nfmin:nfmax)/fftpts,log(a(nfmin:nfmax,1:ncadr)));
title(num2str(k/fs));
ylim([fmin fmax])
shading interp;%lighting gouraud;camlight;
view(2);pause(0.001);
end
