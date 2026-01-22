%experiment4_1
%信号x(t)产生,并显示信号的幅频特性曲线
%载入一个长度为N,有加性高频噪声的单频调幅信号xt,采样频率Fs=1000Hz
%载波频率fc=Fs/10=100Hz,调制正弦波频率f0=fc/10=10Hz.
load('xt.mat');
N=length(xt);
Fs=1000;T=1/Fs;Tp=N*T;
t=0:T:(N-1)*T;
fst=fft(xt,N);k=0:N-1;f=k/Tp;
subplot(2,1,1);plot(t,xt);grid;xlabel('t/s');ylabel('x(t)');
axis([0,Tp/5,min(xt),max(xt)]);title('(a) 信号加噪声波形')
subplot(2,1,2);plot(f,abs(fst)/max(abs(fst)));grid;title('(b) 信号加噪声的频谱')
axis([0,Fs/2,0,1.2]);xlabel('f/Hz');ylabel('幅度')