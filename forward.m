clear all;
close all;

N = 1000;
t = linspace(0, 1, 10000);
tp = t(1:N);  %time window we're looking at 
Fs = 10000;
dF = Fs/N; % each freq bin
f = 100; % in hz
T = tp/Fs; %total duration of these samples
x = cos(tp.*f*(2*pi));
subplot(3,1,1);
plot(x);
subplot(3,1,2);
X = fft(x);
plot(real(X));
xp = ifft(X);
subplot(3,1,3);
plot(xp);