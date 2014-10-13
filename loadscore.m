t_eighth = 0.2;
t_quarter = t_eighth*2;
t_half = t_quarter*2;

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

for k=1:score_size(1)
    note = A1_func(score(k,1), 0.5, 0.0, score(k,2), Fs, 0);
    W = [W note];
end