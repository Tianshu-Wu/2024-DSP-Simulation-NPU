%experiment4_2
%设计布莱克曼窗的低通FIR滤波器
clear,clc,clf

Fs=1000;T=1/Fs;
%===设置截止频率、滤波器阶数等参数
fp=120;fs=150;%模拟通带截止频率和阻带截止频率
wp=2*pi*fp*T;ws=2*pi*fs*T;%数字通带截止频率和阻带截止频率
wc=(wp+ws)/2;%理想滤波器的截止频率
M=201;%滤波器阶数

%===生成布莱克曼窗的低通FIR滤波器
hn=fir1(M-1,wc/pi,blackman(M));%返回理想滤波器截止频率为wc的M阶FIR低通滤波器的单位脉冲响应hn，
Hk=fft(hn,M);                  %注意wc为对pi归一化的数字角频谱，M-1是hn序列最后一项的时间坐标

%===绘图显示滤波器的频响特性曲线
wz=(0:M-1)*2*pi/M;
plot(wz/pi,20*log10(abs(Hk)/max(abs(Hk))));grid on
xlabel('w/pi');ylabel('幅度/dB');title('布莱克曼窗的低通FIR滤波器的频响特性曲线')
axis([0,1,-190,10])
