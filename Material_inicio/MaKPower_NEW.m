function P = MaKPower_NEW(x,Args,BANDA)
% 
% P = MaKPower(x, Fs, Band)
%
% This function evaluates the signal power in  a given frequency band. 
%
% INPUT (all required):
%
%  x    -> 1D signal (a vector) 
%  Fs   -> sampling rate (in Hz), for example Fs = 1000
%  Band -> frequncy band (in Hz), for example Band = [2,8]
%
% OUTPUT:
% 
% P -> the power in the given frequency band
%       if x is given in Volts, then P is in V^2 
%
% Note: you can calculate the total power by providing Band = [0, inf] 
%
% EXAMPLE:
% 
% Fs = 1000;
% Tmax = 30;
% Band = [4 12];
% 
% F = 10;
% t = linspace(0,Tmax,round(Tmax*Fs)+1);
% x = 2*cos(2*pi*F*t);
% 
% BandPower = MaKPower(x, Fs, Band)
% 
%
%
% V.Makarov: July 3, 2013 (on request by S.Canals)
% vmakarov@mat.ucm.es
%
LENGTH=length(x); %x es una matriz: x(j,:) canal
if nargin ~= 3,
    error('Exactly 3 arguments are required.');
end
[m,n] = size(BANDA);
if m*n ~= 2,
    error('The band must be [Flow, Fhigh].')
end
BANDA = sort(BANDA);

    [p, f] = periodogram(x,[],[],Args.Fs); 
    iDx = find(f >= BANDA(1) & f < BANDA(2));

    if ~isempty(iDx)
        pLR = interp1(f,[0; p(2:end)],BANDA,'cubic');
        pLR(pLR < 0 ) = 0;
        P = trapz([BANDA(1); f(iDx); BANDA(2)],[pLR(1); p(iDx); pLR(2)]);
    else
        P = 0;
    end
    if length(iDx) < 2,
        disp('Warning: Not adequate frequency band');
    end

