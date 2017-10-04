clc; clear; close all;

%%
% Problem 1
% a)
w = -pi:pi/1000:pi;
X_w = 2 + cos(w);
figure(1);
plot(w,X_w);
title('Spectrum of X(w)');
xlabel('Angular frequency, w');
ylabel('X(w)');

%%
% b)
M = 10;
Y_w = sin(w*(M+(1/2))) ./ sin(w/2);
figure(2);
plot(w, Y_w);
title('Spectrum of Y(w) for M = 10');
xlabel('Angular frequency, w');
ylabel('Y(w)');

%%
% c)
% The signals x(n) and y(n) have real value spectrums because
% the are even functions


