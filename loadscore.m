function [wave] = loadscore(tempo, Fs)
% loadscore generates a song (see "score" table below)
% at tempo bpm (quarter note)
% and Fs playback sample rate

%length of various notes in current tempo:
t_quarter = 60/tempo;
t_eighth = t_quarter/2;
t_half = t_quarter*2;

% here's a short score
score = [   note2freq(48) t_quarter;
            0             t_eighth;
            note2freq(50) t_eighth;
            note2freq(52) t_eighth;
            0             t_eighth;
            note2freq(52) t_eighth;
            0             t_eighth;
            note2freq(50) t_eighth;
            note2freq(48) t_eighth;
            note2freq(50) t_eighth;
            note2freq(52) t_eighth;
            note2freq(48) t_quarter;
            note2freq(43) t_quarter;
            
            note2freq(48) t_quarter;
            0             t_eighth;
            note2freq(50) t_eighth;
            note2freq(52) t_eighth;
            0             t_eighth;
            note2freq(52) t_eighth;
            0             t_eighth;
            note2freq(50) t_eighth;
            note2freq(48) t_eighth;
            note2freq(50) t_eighth;
            note2freq(52) t_eighth;
            note2freq(48) t_half;
        ];
score_size = size(score);
wave = 0;
for k=1:score_size(1)
    note = A1_func(score(k,1), 0.5, 0.0, score(k,2), Fs, 0);
    wave = [wave note];
end