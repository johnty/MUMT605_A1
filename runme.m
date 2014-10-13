close all;
Fs = 44100; % Sample Rate in hertz
freq = 440; % Freq in hertz
time = 1; % Duration in seconds
ph = 0.0; % initial phase (in % of period)

%first run, with plots:
A1_func(440, 0.3, 0.2, 0.2, Fs/2, 1);

%make and play a "song":
W=0;

%script for generating sound and storing into W buffer
loadscore;

p = audioplayer(W, Fs);
p.play();

