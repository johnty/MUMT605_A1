clear all;
close all;

t = linspace(0, 1, 44100);
tp = t(1:1024);
Fs = 44100;
x = cos(tp.*440*(2*pi));
for n=1:length(x)
    if (x(n)>0.5)
        x(n) = 1.0;
    else
        x(n) = 0.0;
    end;
end
x(1:length(x)/2) = 1.0;
x(length(x)/2:length(x)) = 0.0;
subplot(3,1,1);
plot(x);
subplot(3,1,2);
X = fft(x);
plot(abs(X));
xp = ifft(X);
subplot(3,1,3);
plot(xp);