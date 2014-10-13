function [wave] = A1_func(f, d_cycle, ph, time, sample_rate, doPlot)
close all;


F_gen = f;
Fs = sample_rate;
phase = ph;
Dur = time;
r = d_cycle;
% handle the case where we input 0 frequency
if (F_gen == 0)
    wave = zeros(1,Fs*Dur);
    return;
end

screen_size = get(0, 'screensize'); %for plots
A = 1.0; %assume max amplitude
freq = 1;
N = 500;
T = r/(freq);
%T = 0.5;
f = linspace(-N/2,N/2,N);
Sk = N*A*exp(-1i*pi.*f*T).*sin(pi*f*T)./(pi*f);

w = ones(1, length(Sk));

%played around with windowing the spectrum
% to reduce higher frequencies - didn't
% seem to be necessary...
%w = sinc(k);
%w(1:length(w)/4) = 0;
%w(3*length(w)/4:length(w)) = 0;
Sk_ = Sk.*w;
x = ifft(Sk_);
x_wt = abs(x); %the generated "wave table", as first part of question

%second part of question: generate time series samples given:
% 1.) fundamental frequency
% 2.) phase (relative as a portion of period)
% 3.) total wave duration
% 4.) (implictly required:) Sample Rate of playback

% we want to generate a wave of freq F_gen, at playback rate Fs
% Np is the period of the wave necessary in number of samples:
Np = floor(Fs/F_gen);
%so we take the generated wavetable, and interpolate it to
% a new table of size Np:
t1 = linspace(0,1,length(x_wt)); %t1 for interploation
t2 = linspace(0,1,Np); %t2 for interpolation
x_freq_correct = interp1(t1,x_wt, t2); %resultant freq corrected wavetable

% finally, we want to repeat the wave over total duration of Dur seconds
% with initial phase input

% we'll shift the wavetable by the input phase, and wrapping it around:
% if we delay by P samples, the new table should be [ x[(Np-P):Np] x[1:P] ]
wrap_index = (Np - round(phase*Np));
if (phase ~= 0)
    wt_with_phase = [ x_freq_correct(wrap_index:length(x_freq_correct)) x_freq_correct(1:wrap_index) ];
else
    wt_with_phase = x_freq_correct;
end


num_copies = floor(Dur*Fs/Np);
x_wave_out = 0;
for k=1:num_copies
    x_wave_out= [x_wave_out wt_with_phase]; % number of "complete" chunks
end
before_len = length(x_wave_out)
% add remainder (if any) of final chunk to fill exact number of samples
% dictated by total Duration and Sample Rate:
extra = mod(Dur*Fs, Np)
if (extra ~= 0) % add final bit to end...
    x_wave_out = [x_wave_out wt_with_phase(1:extra-1)];
end
expected_len = Dur*Fs
actual_len = length(x_wave_out)


%plots

%plot the spectrum
if (doPlot == 1)
    figure('Position', [25 screen_size(4)/2-100 screen_size(3)/2 screen_size(4)/2]);
    subplot(4,1,1);
    plot(real(Sk));
    title('real part of spectrum');
    subplot(4,1,2);
    plot(imag(Sk));
    title('imag part of spectrum');
    subplot(4,1,3);
    plot(abs(Sk));
    title('mag of spectrum');
    subplot(4,1,4);
    plot(abs(x));
    title('ifft of spectrum');
    %FIGURE 2: Wavetable
    figure('Position', [screen_size(3)/2 screen_size(4)/2-100 screen_size(3)/2 screen_size(4)/2]);
    subplot(3,1,1);
    plot(x_wt);
    title('generated wavetable from spectrum');
    subplot(3,1,2);
    plot(x_freq_correct);
    title('generated wavetable with correct frequency for given Fs');   
    subplot(3,1,3);
    plot(wt_with_phase);
    title('generated wavetable with phase shift');
    %FIGURE 3: Output Samples
    figure('Position', [25 125 screen_size(3) screen_size(4)/2]);
    title_str = ['Plot of ' num2str(Dur) 's at ' num2str(Fs) ' sample rate'];
    plot(x_wave_out);
    title(title_str);
end

wave = x_wave_out;