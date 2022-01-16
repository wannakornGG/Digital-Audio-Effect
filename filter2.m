function      [NUM] = filter2(in)

Fs = 16000;  % Sampling Frequency

N    = 201;      % Order
flag = 'scale';  % Sampling Flag
bw = 7;

% Create the window vector for the design algorithm.
win = blackman(N+1);

%Filter  F LOW
Fc1  = 697-bw;      
Fc2  = 697+bw;
bL1  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fl1 697

Fc1  = 770-bw;      
Fc2  = 770+bw;      
bL2  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fl2 770

Fc1  = 852-bw;      
Fc2  = 852+bw;
bL3  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fl3 852


Fc1  = 941-bw;      
Fc2  = 941+bw;
bL4  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fl4 941


%Filter  F High

Fc1  = 1209-bw;      
Fc2  = 1209+bw;
bH1  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fh1 1209

Fc1  = 1336-bw;      
Fc2  = 1336+bw;
bH2  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fh2 1336

Fc1  = 1477-bw;      
Fc2  = 1477+bw;
bH3  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);    %fh1 1477

L1=filter(bL1,1,in);
L2=filter(bL2,1,in);
L3=filter(bL3,1,in);
L4=filter(bL4,1,in);

H1=filter(bH1,1,in);
H2=filter(bH2,1,in);
H3=filter(bH3,1,in);


for i=1:4
tex=sprintf('g=FFTsig(L%d,Fs);',i);
eval(tex);
[p q]=max(g);
freq = (q*Fs)/length(g);
low(i,:)=[p freq];
end
[a b]=max(low(:,1));
lowf=low(b,2);


for j=1:3
tex=sprintf('g=FFTsig(H%d,Fs);',j);
eval(tex);
[p q]=max(g);
freq = (q*Fs)/length(g);
hi(j,:)=[p freq];
end
[a b]=max(hi(:,1));
hif=hi(b,2);




b=20;
a=40;
if((lowf<697+b)&&(hif<1209+b)&&(hif>1209-b))
    NUM = '1';
elseif((lowf<697+b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '2';
elseif((lowf<697+b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '3';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '4';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '5';
elseif((lowf<770+b)&&(lowf>770-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '6';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '7';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '8';
elseif((lowf<852+b)&&(lowf>852-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '9';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1336+a)&&(hif>1336-a))
    NUM = '0';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1209+a)&&(hif>1209-a))
    NUM = '*';
elseif((lowf<941+b)&&(lowf>941-b)&&(hif<1477+a)&&(hif>1477-a))
    NUM = '#';
else
    NUM = '_';
end

NUM=uint8(NUM);
    



end


