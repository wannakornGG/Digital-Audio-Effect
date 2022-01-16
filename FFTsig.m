function  [Y]= FFTsig(in,sam)

T = 1/sam;                     % Sample time
L = length(in);                     % Length of signal
t = (0:L-1)*T;                % Time vector



NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(in,NFFT)/L;
f = sam/2*linspace(0,1,NFFT/2+1);

Y=abs(Y);

end