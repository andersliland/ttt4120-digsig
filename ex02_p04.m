clc; clear; close all;
%%
% Problem 4
% a)
% set time vector and frequency for "continous-time" sinusoid
tMax = 0.01;
t = 0:0.000001:tMax;
f = 1;
% set sampling rate
fs_4k = 4000;
fs_1k5 = 1500;
tSamp_4k = 0:1/fs_4k:tMax;
tSamp_1k5 = 0:1/fs_1k5:tMax;

% create continous and sampled signals
x_t = cos(2000*pi*f*t);
xSamp_4k = cos(2000*pi*f*tSamp_4k);
xSamp_1k5 = cos(2000*pi*f*tSamp_1k5);

figure(1);
hold on;
plot(t, x_t, 'b')
plot(tSamp_4k, xSamp_4k, 'ko')
plot(tSamp_1k5,xSamp_1k5, 'ro')
title('Time continous and sampled signal')
legend('Time-continous signal"', 'Sampled Signal, Fs=4k','Sampled signals, Fs=1500');
xlabel('time [s]')
ylabel('Amplitude')

%%
%b)
% Signal with Fs = 4000
fs = 4000; t = [0:1/fs:1-1/fs]; % 1-1/fs because the array starts at 0
x_4000 = cos(1000*2*pi*t);

% Signal with Fs = 1500
fs = 1500; t = 0:1/fs:1-1/fs;
x_1500 = cos(1000*2*pi*t);

sound(x_4000,4000);
pause(1);
sound(x_1500,1500);

% The two signals sound differently because of different sampling
% frequency. According to the sampling theorem, the sampling frequency
% must be at leas 2xoriginal frequency. If Fs is lower aliasing occurs.
% This is when the signal cannot be reconstructed and it becomes
% indistinquisable ( or aliases of one another).

minSamplingFrequency = 1000*2 % [Hz]
