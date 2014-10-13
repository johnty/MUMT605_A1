close all;
Fs = 44100; % Sample Rate in hertz
freq = 440; % Freq in hertz
time = 1; % Duration in seconds
ph = 0.0; % initial phase (in % of period)

%first run, with plots:
A1_func(880, 0.3, 0.1, 0.2, Fs, 1);

%make and play a "song":
W=0;
%script for generating sound and storing into W buffer
W = loadscore(140,Fs);
%play it!
p = audioplayer(W, Fs);
p.play();

