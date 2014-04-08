function [varargout]=bispectr(x,nf,nt,fs)
% [varargout]=bispectr(x,nf,nt,fs)
% This function calculates the bispectrum estimation of input signal
% in one square of bispectrum plane (F1<Fnyquist,F2<Fnyquist/2)
% with averaging in time and in frequency plane. 
% x-input vector
% nf-size of frequency window averaging square 
% nt-number of time realisations in x (time blocks)
% fs-frequency sampling of x
% the output variables are:
% y-(varagout(1))-is the bispectrum of x;
% y=bispectr(x,nf,nt,fs)
% (varagout(2),varagout(3))-frequencies for the y
% [y,f1,f2]=bispectr(x,nf,nt,fs);
% Designed by Eugene V.Makarov makarov@wl.unn.ru
% $Date: 2003/07/15 
x=x(:)';
lx=length(x)/nt;
y=0;
for q=0:nt-1
a=fft(x(1+q*lx:lx+q*lx)-mean(x(1+q*lx:lx+q*lx)) );
y=y+bsp(a,nf);
end
y=y/(nt*nf^2);
varargout{1}=y;
if nargout==2
 varargout{2}=fs*(1:lx/(4*nf))/(lx/(4*nf));
end
if nargout==3
 varargout{2}=fs*(1:lx/(4*nf))/(lx/(4*nf));
 varargout{3}=fs*(1:lx/(2*nf))/(lx/(2*nf));
end
if nargout>3
    error('check number of arguments')
end