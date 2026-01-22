%experiment3_1

N=1600; %N为信号st的长度。
Fs=3000;T=1/Fs;Tp=N*T; %采样频率Fs=10kHz，Tp为采样时间
t=0:T:(N-1)*T;k=0:N-1;w=k*2*pi/N;f=w/T/(2*pi);%w是数字角频率，f是相应的模拟频率
fc1=1000; %第1路调幅信号的载波频率fc1=1000Hz,
fm1=fc1/10; %第1路调幅信号的调制信号频率fm1=100Hz
fc2=500; %第2路调幅信号的载波频率fc2=500Hz
fm2=fc2/10; %第2路调幅信号的调制信号频率fm2=50Hz
fc3=250; %第3路调幅信号的载波频率fc3=250Hz,
fm3=fc3/10; %第3路调幅信号的调制信号频率fm3=25Hz
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t); %产生第1路调幅信号
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t); %产生第2路调幅信号
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t); %产生第3路调幅信号
st=xt1+xt2+xt3; %三路调幅信号相加
fxt=fft(st,N); %计算信号st的频谱
%====以下为绘图部分，绘制st的时域波形和幅频特性曲线
subplot(3,1,1)
plot(t,st);grid;xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title('(a) s(t)的波形')
subplot(3,1,2)
stem(w,abs(fxt)/max(abs(fxt)),'.');grid;title('(b) s(t)的频谱（数字角频率）')
axis([0,pi,0,1.2]);
xlabel('w/rad');ylabel('幅度')
subplot(3,1,3)
stem(f,abs(fxt)/max(abs(fxt)),'.');grid;title('(c) s(t)的频谱（模拟频率）')
axis([0,1600,0,1.2]);
xlabel('f/Hz');ylabel('幅度')