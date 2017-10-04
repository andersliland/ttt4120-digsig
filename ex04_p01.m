clc; clear; close all;
%% Problem 1
%% a)
% a = 0.9
figure(1);
z = [0];
p = [0.9];
zplane(z,p);
title('Pole-Zero plot with a=0.9');
xlabel('Re');
ylabel('Im');
legend('Pole','Zero');
% With two poles at 0Hz close to the unit circle,
% and two zeros in origo
% the filter is a steep low-pass filter.

%%
% a= -0.9
figure(2);
z = [0];
p = [-0.9];
zplane(z,p);
title('Pole-Zero plot with a=-0.9');
xlabel('Re');
ylabel('Im');
legend('Pole','Zero');
% With two poles at frequency fs close to the unit circle,
% and two zeros in origo
% the filter is a steep high-pass filter.

