clc; clear;
%% Problem 4
%% a)
Ax = 0.25; Ay = 0.25;
fx = 0.04;
fy = 0.10;
L = 500;
n = 0:1:L-1;
d = Ax * cos(2*pi*fx*n) + Ay*cos(2*pi*fy*n);
e = randn(1,L); % Noise
g = d + e;

fft_length = 2048;

% Plot discrete time signals
figure(1); subplot(3,1,1); plot(n,d); title('Signal d(n)'); xlabel('sample num'); ylabel('d(n)');
subplot(3,1,2);plot(n,e); title('Random Noise e(n)'); xlabel('sample num'); ylabel('e(n)');
subplot(3,1,3); plot(n,g); title('Signal with noise g(n)'); xlabel('sample num'); ylabel('g(n)');

% FFT - shift spectrum to get 0Hz in the middle
fft_d = fftshift(fft(d,2048));
fft_e = fftshift(fft(e,2048));
fft_g = fftshift(fft(g,2048));

% Plot spectrum
w = linspace(-1,1,2048);
figure(2); subplot(3,1,1); plot(w,abs(fft_d),'-'); title('Magnitude spectrum of signal, d(n)'); xlabel('Normalised Frequency'); ylabel('|D(f)|');
subplot(3,1,2); plot(w,abs(fft_e)); title('Magnitude spectrum of noise, e(n) '); xlabel('Normalised Frequency'); ylabel('|E(f)|');
subplot(3,1,3); plot(w,abs(fft_g)); title('Magnitude spectrum of signal with noise, g(n))'); xlabel('Normalised Frequency'); ylabel('|G(f)|');

% Why do we get a massive spike at 0Hz? (is it because we sample a infinite time signal with a descrete number of samples)

%% b)
% Plot zeroes and poles of the resonators
Hx_p = [ 0.99*exp(1i*2*pi*fx) 0.99*exp(-1i*2*pi*fx)]'; % transpose to row vector
Hy_p = [ 0.99*exp(1i*2*pi*fy) 0.99*exp(-1i*2*pi*fy)]';
z = [-1 1]';
figure(3); zplane(z, Hx_p); title('Pole-Zero plot of Hx(z)');
figure(4); zplane(z, Hy_p); title('Pole-Zero plot of Hy(z)');


% Plot magnitude response of Hx(z) and Hy(z)
figure(5); subplot(2,1,1);
[Hx, wx] = freqz(poly(z),poly(Hx_p));
subplot(2,1,1);
w = wx/2/pi; 
plot(w,abs(Hx));
title('Mangitude response, |Hx(z)|');
xlabel('Angular frequency, w');
ylabel('Magnitude, |Hx|');
subplot(2,1,2);
plot(w, angle(Hx));
title('Phase response of Hx(z)');
xlabel('Angular frequency, w');
ylabel('Phase');

figure(6);
subplot(2,1,2);
[Hy, wy] = freqz(poly(z),poly(Hy_p));
subplot(2,1,1);
w = wy/2/pi;
plot(w,abs(Hy));
title('Mangitude response, |Hy(z)|');
xlabel('Angular frequency, w');
ylabel('Magnitude, |Hy(z)|');
subplot(2,1,2);
plot(w, angle(Hy));
title('Phase response of Hy')
xlabel('Angular frequency, w')
ylabel('Phase')

%% C)
% Apply filter Hx and Hy to g(n)
w = linspace(-1,1,2048);
qx = filter(poly(z),poly(Hx_p),g);
figure(7); subplot(2,1,1);
plot(n,qx); title('Filtered signal, qx(n)'); xlabel('Sample number, n'); ylabel('qx(n)');
Qxfft = fftshift(fft(qx,fft_length));
subplot(2,1,2); plot(w,abs(Qxfft)); title('|Qx(f)|'); xlabel('Normalised Frequency'); ylabel('|Qx(f)|');

qy = filter(poly(z),poly(Hy_p),g);
figure(8); subplot(2,1,1);
plot(n,qy); title('Filtered signal, qy(n)'); xlabel('Sample number, n'); ylabel('qy(n)');
Qyfft = fftshift(fft(qy,fft_length));
subplot(2,1,2); plot(w,abs(Qyfft)); title('|Qy(f)|'); xlabel('Normalised Frequency'); ylabel('|Qy(f)|');
%%
% Result: The filters amplified the sinusoidal components they where designed to amplify and removed noise
% from the other frequencies. Hy filter removed fx=0.04 component, and Hx filter
% removed fy=0.25 component.
% The noise floor was around 15 before filter
% and is now less than 10 after filter. The peak amplitude of signal went
% from about 250 to 5300, a gain of 21.



%% d)
% Plot magnutude response of H(z)
H=Hx+Hy;
w = linspace(0,0.5,512);
figure(9); plot(w, abs(H));title('Magnitude response, |H(f)|'); xlabel('Normalised Frequency'); ylabel('|H(f)|');

% Plot zplane of H(z)
H_z(3:4) = roots(poly(Hx_p)+poly(Hy_p));
H_p =[Hx_p; Hy_p];
figure(10); zplane(H_z',H_p); title('Pole-zero plot of H(z)');
%%
%The two poles in the first quadrat is the amplification of frequency 0.04
% and 0.25. The zero in between filtes out the noise betwen the signals.
% The poles and zeroes in q2 is similar for negative frequencies.
% The two zeroes in the middle does not contribute anything.
% 

% Plot filtered signal magnitude and specturm
w = linspace(-1,1,2048);
q = filter(poly(H_z),poly(H_p),g);
figure(11); subplot(2,1,1);
plot(n,q); title('Filtered signal, q(n)'); xlabel('Sample number, n'); ylabel('q(n)');
Qfft = fftshift(fft(q,fft_length));
subplot(2,1,2); plot(w,abs(Qfft)); title('Filtered signal, |Q(f)|'); xlabel('Normalised Frequency'); ylabel('|Q(f)|');

%%
% By combining filter Hx and Hy we can reduce noise while amplifying both fx
% and fy component in the same filter.
% The filtered q(n) signal similar to the input signal without noise, g(n).

