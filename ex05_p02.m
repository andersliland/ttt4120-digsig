clc; clear; close all;
%% Problem 2
%% a)
s = load('signals.mat');
x_n = s.x;
y_n = s.y;

t = 0:1:256-1; % -1 to plot from 0
figure(1); subplot(2,1,1);
stem(t,x_n,'MarkerSize',1);title('Radar signal sent,x(n)'); xlabel('Sample, n'); ylabel('x(n)'); axis([0 256 0 4])
subplot(2,1,2);
stem(t,y_n,'MarkerSize',1); title('Radar echo received, y(n)');xlabel('Sample, n');ylabel('y(n)');axis([0 256 -2 2])
% Not possible to spot from y(n) if an object is hit or not

%% b)

r_yx = xcorr(y_n,x_n);
t = linspace(-300, 300, length(r_yx));
figure(2); stem(t,r_yx,'MarkerSize',1);title('Crosscorrelation, r_{yx}'); xlabel('l'); ylabel('r_{yx}');
dim = [.72 .85 .05 .05];annotation('rectangle',dim,'Color','red');
%% c)
% By folding x(n), eg. x(-n) and convolving with y(n) we get the
% crosscorrelation r_yx
x_folded = fliplr(x_n);
t = linspace(0,-256,256);
figure(3);stem(t,x_folded,'MarkerSize',1);title('Folded x(n) = x(-n)'); xlabel('Sample, n'); ylabel('x(-n)'); axis([-256 0 0 4])

r_yx2 = conv(x_folded,y_n);
t = linspace(-300, 300, length(r_yx));
figure(4); stem(t,r_yx2,'MarkerSize',1);title('Crosscorrelation by folding and convolution, r_{yx}'); xlabel('l'); ylabel('r_{yx}');
dim = [.72 .85 .05 .05];annotation('rectangle',dim,'Color','red');

%%
% This figure is similar to the first one.

%% d)
[D_val, D_index] = max(r_yx);
D_index = D_index - ceil((length(r_yx)/2)) % Calculate l of D
% The highest peak is at l = 150, with a value of 18.35. If we have F_s the
% time delay can be calculated.

% Is this value more reliable than that of the direct comparrison of the
% signals x(n) and y(n)?
% 
