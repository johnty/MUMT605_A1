Fs = 44100; % Sample Rate in hertz
freq = 440; % Freq in hertz
time = 1; % Duration in seconds
ph = 0.0; % initial phase (in % of period)

wave = A1_func(440, 0.0, 1, Fs, 0, 0);
p = audioplayer(wave, Fs);
p.play();