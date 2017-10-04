clc; clear; close all;
%% Problem 3
R = 9; % Delay of echo in number of samples
alpha = 0.7; % Attenuation of echo

%% b)
[y,Fs] = audioread('piano.wav');
%soundsc(y,Fs); % Play original sound
figure(1);
plot(linspace(0,Fs/2,length(y)),y); title(sprintf('Plot of piano.wav, Fs=%i',Fs)); xlabel('Sample,n'); ylabel('Amplitude of Piano.wav');
% Filter H(z) = 1+az^-R
b = zeros(1,(R+1)); b(1)=1; b(end)= alpha;
a = 1;
[h,t] = impz(b,a,5*R); % last argument: set number of samples as some func of R, so program scales for different R
figure(2);subplot(2,1,1); stem(t,h);title(sprintf('Impulse response of filter 1, R=%i, alpha=%f',R,alpha)); xlabel('Sample,n'); ylabel('Amplitude');
[h,w] = freqz(b,a);
subplot(2,1,2); plot(w,real(h));title(sprintf('Frequency response of filter 1, R=%i,alpha=%f',R,alpha)); xlabel('Normalised angular frequency,w'); ylabel('Magnitude');
y_filtered = filter(b,a,y);
%figure(3); plot(linspace(0,Fs/2,length(y_filtered)),y_filtered); title(sprintf('Plot of piano.wav filtered, Fs=%i',Fs)); xlabel('Sample,n'); ylabel('Amplitude of Piano.wav');
%pause(); soundsc(y_filtered,Fs); % Play sound filter 1
%% 

%%
N = 10; % Number of echos
b = zeros(1,N*R+1); b(1)=1; b(N*R+1)=-(alpha^N);
a = zeros(1,R+1); a(1)=1; a(end)=-alpha;

[h,t] = impz(b,a,10*R); % last argument: set number of samples as some func of R, so program scales for different R
figure(3);subplot(2,1,1); stem(t,h);title(sprintf('Impulse response of filter 2, R=%i, alpha=%f, N=%i',R,alpha,N)); xlabel('Sample,n'); ylabel('Amplitude');
[h,w] = freqz(b,a);
subplot(2,1,2); plot(w,real(h));title(sprintf('Frequency response of filter 2, R=%i,alpha=%f, N=%i',R,alpha,N)); xlabel('Normalised angular frequency,w'); ylabel('Magnitude');
y_filtered2 = filter(b,a,y);
%pause(); soundsc(y_filtered2,Fs); % Play sound filter 2
%%
% Result:
% R is the delay in number of samples between each echo.
% Alpha is the attenuation of the echos. Lower value-> more attenuation for
% each echo. Alpha=1 -> no attenuation.
% For filter 2 N is the number of echoes after the filter.

% More echoes gives the rom a more spacious (blured) sound.
% Filter 2 will give a more natural sound as this produces more echoes.