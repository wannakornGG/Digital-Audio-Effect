fs =16000;
base = input('Enter the length: ','s' ); % #����õ���ӴѺ�ͧ���ҧascii �� �ӡ���Ѵ���§ 10 ��Ѻ �� :
base = base - 48;                        % length �ͧ input   
D_t = zeros(1,base);                      
T=1/fs;
N=(1:(3*fs));
t=N/fs;
for i=1:base
    disp('Next');
  y = wavrecord(3*fs,fs,'double'); %�Ѵ���§DTMF
    D=filter2(y); %��ͧ��ҹfilter
    D_t(1,i) = D;
end

m=sprintf('The number is %s',D_t); %�ʴ�output �繵���Ţ

msgbox(m);%˹�ҵ�ҧ�ʴ�����Ţ