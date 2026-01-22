%experiment4_3
%用设计好的FIR滤波器对xt滤波
clear,clc,clf

load('xt.mat');
N=length(xt);

Fs=1000;T=1/Fs;
%===设置截止频率、滤波器阶数等参数
fp=120;fs=150;%模拟通带截止频率和阻带截止频率
wp=2*pi*fp*T;ws=2*pi*fs*T;%数字通带截止频率和阻带截止频率
wc=(wp+ws)/2;%理想滤波器的截止频率
M=200;%滤波器阶数（由过渡带带宽得出）
%===生成低通的布莱克曼窗的低通FIR滤波器
hn=fir1(M,wc,blackman(M+1));

%===滤波
yn=fftfilt(hn,xt,10);
Yk=fft(yn,N)

%===绘制滤波器输出信号的幅频特性图和时域波形图
t=(0:N-1)*T;
f=(0:N-1)/N/T;
subplot(211)
plot(t,abs(yn));
subplot(212)
plot(f,abs(Yk)/max(abs(Yk)))
