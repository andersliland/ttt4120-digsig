clc; clear; close all;

Ax = 0.25; Ay = 0.25;
fx = 0.04;
fy = 0.10;
L = 500;
n = 0:1:L-1;
d = Ax * cos(2*pi*fx*n) + Ay*cos(2*pi*fy*n);

Fs= 2; % insert here your frequency sampling in Hz


L=length(d); 
NFFT = 2^nextpow2(L);
Y  = fft(d,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')