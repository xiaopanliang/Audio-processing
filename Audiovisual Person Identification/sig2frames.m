function frames = sig2frames(signal, Nw, No)
% Convert a speech signal to frames using the window and overlap method
% Default window used is a Hamming window.
%
% INPUTS:
% signal: speech signal (a vector)
% Nw: window size in number of samples
% No: overlap size in number of samples
% 
% OUTPUTS:
% frames: Matrix of frames [Nw x Nf]. Each column is a frame of length Nw samples.
% There are Nf such frames. Nf is computed from signal, Nw, and No.
%
% 

signal = signal(:);
len = length(signal);
Nf  = floor( (len - No)/(Nw - No) );
frames = zeros(Nw, Nf);

%win = @hamming;
w = hamming(Nw);
for i = 1:Nf
    start_sample = Nw * (i - 1) - No * (i - 1) + 1 ;
    end_sample =   Nw * i - No * (i - 1) ;
    frames(:, i) = (signal(start_sample : end_sample,1)).* w;
end

end
