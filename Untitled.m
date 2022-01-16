fs =16000;
base = input('Enter the length: ','s' ); % #ตัวแปรตามลำดับของตารางascii เช่น ทำการอัดเสียง 10 ครับ ใช้ :
base = base - 48;                        % length ของ input   
D_t = zeros(1,base);                      
T=1/fs;
N=(1:(3*fs));
t=N/fs;
for i=1:base
    disp('Next');
  y = wavrecord(3*fs,fs,'double'); %อัดเสียงDTMF
    D=filter2(y); %กรองผ่านfilter
    D_t(1,i) = D;
end

m=sprintf('The number is %s',D_t); %แสดงoutput เป็นตัวเลข

msgbox(m);%หน้าต่างแสดงตัวเลข