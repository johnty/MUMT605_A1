f = linspace(-pi, pi, 1000);
w1 = 0.5*(1+cos(f));
close all;
subplot(3,1,1);
plot(w1);
W1 = fft(w1);
subplot(3,1,2);
plot(abs(W1));
subplot(3,1,3);
plot(phase(W1));