%experiment4_3
%用设计好的FIR滤波器对xt滤波
clear,clc,clf

%载入待滤波的加性高频噪声单频调幅信号xt
load('xt.mat');

%设计布莱克曼窗的低通FIR滤波器
Fs=1000;T=1/Fs;%采样频率、采样周期
%===设置截止频率、滤波器阶数等参数
fp=120;fs=150;%模拟通带截止频率和阻带截止频率
wp=2*pi*fp*T;ws=2*pi*fs*T;%数字通带截止频率和阻带截止频率
wc=(wp+ws)/2;%理想滤波器的截止频率
M=201;%滤波器阶数
%===生成低通的布莱克曼窗的低通FIR滤波器
hn=fir1(M-1,wc/pi,blackman(M));%返回理想滤波器截止频率为wc的M阶FIR低通滤波器的单位脉冲响应hn
Hk=fft(hn,M);

%===滤波(卷积)
yn=fftfilt(hn,xt);%用重叠相加法实现卷积的计算，hn是单位脉冲响应，默认输入序列xt的分段长度为512
N=length(yn);
Yk=fft(yn,N);

%===绘制FIR滤波器输出信号的幅频特性图和时域波形图
t=(0:N-1)*T;
f=(0:N-1)/N/T;
subplot(211)
plot(t,abs(yn));grid on
xlabel('t/s');ylabel('幅度');title('FIR滤波器输出信号的时域波形图')
subplot(212)
plot(f,abs(Yk)/max(abs(Yk)));grid on
xlabel('f/Hz');ylabel('幅度');title('FIR滤波器输出信号的幅频特性图')
