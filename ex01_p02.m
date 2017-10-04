clear; clc; close all;
%%
%Problem 2
%%
%b)
duration = 4;

Fs = 1000; % sampling frequency
f = 0.3*Fs; % normalised frequency
samples = 0:1/Fs:duration; % array of samples, from 0 to duration with interval of 1/Fs = sampling period.
signal = sin(2*pi*f*samples);
disp('Playing with Fs = 1000')
soundsc(signal, Fs);
% low pitch sound
pause(5) % wait 5 sec

Fs = 3000;
f = 0.3*Fs;
samples = 0:1/Fs:duration;
signal = sin(2*pi*f*samples);
disp('Playing with Fs = 3000')
soundsc(signal, Fs);
% sound with increased frequency
pause(5)

Fs = 12000;
f = 0.3*Fs;
samples = 0:1/Fs:duration;
signal = sin(2*pi*f*samples);
disp('Playing with Fs = 120000')
soundsc(signal, Fs); 
% even more increased frequency
%%
%d)
Fs = 8000;

f = 0.3*Fs; % normalised frequency
samples = 0:1/Fs:duration;
signal = sin(2*pi*f*samples);
disp('Playing with F1 = 1000')
soundsc(signal, Fs);

pause(5)

f = 0.3*Fs;
samples = 0:1/Fs:duration;
signal = sin(2*pi*f*samples);
disp('Playing with Fs = 3000')
soundsc(signal, Fs);
pause(5)

f = 0.3*Fs;
samples = 0:1/Fs:duration;
signal = sin(2*pi*f*samples);
disp('Playing with Fs = 6000')
soundsc(signal, Fs); 





    

