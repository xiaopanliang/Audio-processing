function CC = cepstrum(signal, Ncc, Nw, No)
% signal: speech signal (a vector)
% Nw: window size in samples
% No: overlap size in samples
% Ncc:  Number of cepstral coefficients = 12
% CC = matrix of cepstral coeffs of size [Ncc x Nf], where Nf = num frames

% NFFT must meet the following conditions:
% a) NFFT is a number that is nearest to and >= Nw. 
% b) NFFT must also be a power of 2 (e.g. 2^1, 2^2, 2^3, 2^4 etc) 
%NFFT = ??? ;  
for i = 1: 15
    NFFT = 2^i;
    if NFFT >= Nw
       % disp(NFFT);
        break;
    end
end
alpha = 0.97;

% Preemphasis filtering
signal = filter([1 -alpha], 1, signal);

% Convert signal to frames
frames = sig2frames(signal, Nw, No);
[~, Nf] = size(frames); % Nf = number of frames

% Compute real cepstrum from magnitude spectra = real part of inverse Fourier transform
% of the log magnitude spectrum
%CC = ??? ; % [NFFT x Nf]
CC_1 = zeros(NFFT,Nf);
for i = 1:Nf
    frames_c = frames(:,i);
    frames_c_fft = fft(frames_c,NFFT);
    frames_c_logmag = log(abs(frames_c_fft));
    frames_c_cc = real(ifft(frames_c_logmag));
    CC_1(:,i) = frames_c_cc;
end

% Take only first Ncc coefficients since higher order coeffs are too small.
%CC = ??? ; % [Ncc x Nf]
CC = CC_1(1:Ncc,:);
CC = CC(:);
end