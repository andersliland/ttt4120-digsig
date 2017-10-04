clc; clear; close all;

%%
% Problem 3
% c)
% Magnitude and phase response of the system

figure(1)
% [h,w] = freq([numerator polynomials], [denominator polynomials], [number of evaluation points])
[H1, w] = freqz([1,2,1],[1]);
subplot(2,1,1);
plot(w,abs(H1));
title('Mangitude response of H1');
xlabel('Angular frequency, w');
ylabel('Magnitude, |H1|');
subplot(2,1,2);
plot(w, angle(H1));
title('Phase response of H1')
xlabel('Angular frequency, w')
ylabel('Phase')

%%

figure(2)
[H2, w] = freqz([1], [1 0.9]);
subplot(2,1,1);
plot(w,abs(H2));
title('Mangitude response of H2')
xlabel('Angular frequency, w')
ylabel('Magnitude, |H2|')
subplot(2,1,2);
plot(w, angle(H2));
title('Phase response of H2')
xlabel('Angular frequency, w')
ylabel('Phase')

%%
% d)
% H1 attenuates high frequencies -> LOWPASS
% H2 attenuates low frequencies -> HIGHPASS




