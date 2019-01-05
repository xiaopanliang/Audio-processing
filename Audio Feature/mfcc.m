function MFCC = mfcc(signal, Ncc, Nw, No)
% Compute Mel Frequency Cepstral Coefficients (MFCCs) for speech signals
%
% INPUTS:
% signal: speech signal (a vector)
% Ncc:  Number of cepstral coefficients
% Nw: Window size in samples
% No: Overlap size in samples
% Fs: Sampling frequency
% M: Number of Mel scale filters in the filterbank
% R:  [a b], lower(a) and upper(b) cut-off freqs of the filterbank
% alpha: Preemphasis filter coefficient ( H(z) = 1 - alpha*z^(-1) )
%
% OUTPUTS:
% CC: Matrix of MFCCs. Size [Ncc x Nf], where Nf = # frames obtained 
% from the speech signal using the window and overlap method. See
% sig2frames(). Ncc = # cepstral coefficients.
%
% References:
%
% [1] Young, S., Evermann, G., Gales, M., Hain, T., Kershaw, D., 
%     Liu, X., Moore, G., Odell, J., Ollason, D., Povey, D., 
%     Valtchev, V., Woodland, P., 2006. The HTK Book (for HTK 
%     Version 3.4.1). Engineering Department, Cambridge University.
%     (see also: http://htk.eng.cam.ac.uk)
% 
% [2] Huang, X., Acero, A., Hon, H., 2001. Spoken Language Processing: 
%       A guide to theory, algorithm, and system development. 
%       Prentice Hall, Upper Saddle River, NJ, USA (pp. 314-315).
% 
%
% Authors: Amit Das
% Copyright (c) 2017-2020
% 
% Author                     Date              Summary 
% amitdas@illinois.edu       09/2017           Created
%


%[Nw, No, Fs, M, R, alpha] = process_options(varargin, 'Nw', 240, 'No', 160, 'Fs', 8000, 'M', 26, 'R', [0 4000], 'alpha', 0.97);
%NFFT = ???;
for i = 1: 15
    NFFT = 2^i;
    if NFFT >= Nw
        %disp(NFFT);
        break;
    end
end


K = NFFT/2 + 1;            
                                   
% Preemphasis filtering
alpha = 0.97;
signal = filter([1 -alpha], 1, signal);

% Convert signal to frames
frames = sig2frames(signal, Nw, No);
[~, Nf] = size(frames); % Nf = number of frames

% Construct Mel filterbank
[H, f] = melfilterbank(26, NFFT/2+1, [0 11025], 22050); % H = [M x K]. Each row is a filter of K freq points in [0, Fs/2]
% plot(f, H);
% plot(f,H);
% xlabel('Frequency (Hz)');
% ylabel('Weight');
% xlabel('Frequency (Hz)');
% ylabel('Weight');
% title('Mel Filterbank');

% Compute average magnitude spectra
% X = [NFFT x Nf]. Each column is a spectrum with NFFT frequencies
X = zeros(NFFT,Nf); 
for i = 1:Nf
    frames_c = frames(:,i);
    frames_c_mag = abs(fft(frames_c,NFFT));
    X(:,i) = frames_c_mag;
end
X = X./NFFT;
X = X(1:K,:);

% Apply Mel filterbank to spectra
% Y should be of size = [M x Nf]
Y = H * X;

% Apply IDCT on log Mel filterbank energies (~ Fourier Transform of
% log spectrum) to get cepstral coefficients (CCs). CCs should be decorrelated.
CC = idct(log(max(1e-6,Y)));

% Take only first Ncc coefficients since higher order coeffs are too small.
MFCC = CC(1:Ncc,:);
MFCC = MFCC(:);


end