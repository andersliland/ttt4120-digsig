clc; clear; close all;
%%
% *Problem 5*
%%
% *b)*
% Plot y2(n) with filters in original order
y1_n = [1 3 6 5 3];
n = 0:10; 
h2_n = (0.9).^n;
y2_n = conv(y1_n, h2_n);
n = 0:length(y2_n)-1;
figure;
stem(n,y2_n);
xlabel('n');
ylabel('y2(n)');
title('Problem 5 b) y2(n) = y1(n) * h2(n)');

%% 
% *c)*
% Plot y1(n) and y2(n) with the filter order interchanged.
% y1(n) will be different, but y2(n) will remain the same, because the
% order of filtering does not matter for a LTI system.
x_n = [1 2 3];
y2_n = conv(x_n, h2_n);
n = 0:length(y2_n)-1;
figure;
stem(n, y2_n);
xlabel('n');
ylabel('y2(n)');
title('Problem 5  d) y2(n) = x(n) * h2(n)');