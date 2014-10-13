function [ freq ] = note2freq( note )
%NOTE2FREQ Summary of this function goes here
%   Detailed explanation goes here
%   freq = note2freq(note)
%   outputs frequency in Hz for
%   given MIDI note number

freq = 440*2^((note-69)/12);

end

