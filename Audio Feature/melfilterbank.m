function [H, f, c] = melfilterbank(M, K, R, fs)
% MELFILTERBANK Mel filterbank.
%
%   [H,F,C]=MELFILTERBANK(M,K,R,FS,H2W,W2H) returns matrix of M triangular filters
%   (one per row), each K coefficients long along with a K coefficient long
%   frequency vector F and M+2 coefficient long cutoff frequency vector C. 
%   The triangular filters are between limits given in R (Hz) and are
%   uniformly spaced on a warped scale defined by forward (hz2mel) and backward
%   (mel2hz) warping functions.
%
%   Inputs
%           M is the number of filters, i.e., number of rows of H
%
%           K is the length of frequency response of each filter 
%             i.e., number of columns of H
%
%           R is a two element vector that specifies frequency limits (Hz), 
%             i.e., R = [ low_frequency high_frequency ];
%
%           FS is the sampling frequency (Hz)%
%
%   Outputs
%           H is a M by K triangular filterbank matrix (one filter per row)
%
%           F is a frequency vector (Hz) of 1xK dimension
%
%           C is a vector of filter cutoff frequencies (Hz), 
%             note that C(2:end) also represents filter center frequencies,
%             and the dimension of C is 1x(M+2)
%
%   Example
%           fs = 8000;               % sampling frequency (Hz)
%           nfft = 2^nextpow2(fs);   % fft size (number of frequency bins)
%           K = nfft/2+1;            % length of each filter
%           M = 26;                  % number of filters
%           R = [0 fs/2];            % lower and upper cutoff freqs for filterbank
%
%           % Design mel filterbank of M filters each K coefficients long,
%           % filters are uniformly spaced on the mel scale between [0, Fs/2] Hz
%           [ H, f ] = melfilterbank(M, K, [0 fs/2], fs);
%           plot(f, H);
%           xlabel('Frequency (Hz)'); ylabel('Weight'); set( gca, 'box', 'off' );
%
%   Reference
%           [1] Huang, X., Acero, A., Hon, H., 2001. Spoken Language Processing: 
%               A guide to theory, algorithm, and system development. 
%               Prentice Hall, Upper Saddle River, NJ, USA (pp. 314-315).
%
% Author                     Date              Summary 
% Kamil Wojcicki             06/2011           Created
% amitdas@illinois.edu       09/2017           Modified to compute Mel Filters
%											   a) Mel scale based on natural log					
%                                              b) Use eqn 6.141 instead of 6.142 in [1]
%

if( nargin~= 4 ), help melfilterbank; return; end; % very lite input validation

f_min = 0;          % filter coefficients start at this frequency (Hz)
f_max = 0.5*fs;     % filter coefficients end at this frequency (Hz)
f = linspace(f_min, f_max, K); % frequency range (Hz), size 1xK

f_low = R(1);       % lower cutoff frequency (Hz) for the filterbank
f_high = R(2);      % upper cutoff frequency (Hz) for the filterbank

h2w = @hz2mel; % hertz to warped handle
w2h = @mel2hz; % warped to hertz handle

% filter cutoff frequencies (Hz) for all filters, size 1x(M+2)
c = linspace(h2w(f_low), h2w(f_high), M + 2); % create M+2 filters spaced linearly between min Mel and max Mel
c = w2h(c); % convert the filter cut-offs in Mel back to Hz

% implements Eq. (6.140) given in [1] (for a given set of warping functions)
H = zeros(M, K);  % init all filter coeffs to zeros
for m = 1:M
    for k = 1:K
        if f(k)>=c(m) &&  f(k)<=c(m+1)
            H(m,k) = (f(k)-c(m)) / (c(m+1)-c(m));
        elseif f(k)>=c(m+1) &&  f(k)<=c(m+2)
            H(m,k) = (c(m+2)-f(k)) / (c(m+2)-c(m+1));
        end
    end
end

end

function f = mel2hz(z)
%   Convert 'mel scale' frequencies into Hz.
% f = 700*(10.^(z/1125)-1);
f = 700*(exp(z/1125)-1);
end

function z = hz2mel(f)
%  Convert frequencies f (in Hz) to mel 'scale'.
% z = 1125 * log10(1+f/700);
z = 1125 * log(1+f/700);
end