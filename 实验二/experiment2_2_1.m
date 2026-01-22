%experiment2_2_1
clear,clc,clf

n=0:63;%选取64个点来表示周期信号cos(pi/4*n)
x4n=cos(pi/4*n);
X4k_8=fft(x4n,8);  %由于周期信号的DTFT由离散时间傅里叶级数而来，所以是离散谱，
k_8=0:7;           %仅在2*pi/N处有值（N为周期信号的基波周期）
X4k_16=fft(x4n,16);%因此，需要将采样点数设置成整数倍周期N的长度进行频率采样
k_16=0:15;         %即将点数设置成整数倍周期N的长度进行DFT
                   %在此例中N=8，所以采样点数可以取8,16,32，...

subplot(311)
stem(n,x4n),title('cos(pi/4*n)'),xlabel('时间n'),ylabel('振幅x4n')
grid on
subplot(312)
stem(k_8,abs(X4k_8)),title('8点DFT'),xlabel('频率k'),ylabel('振幅X4k_8')
grid on
subplot(313)
stem(k_16,abs(X4k_16)),title('16点DFT'),xlabel('频率k'),ylabel('振幅X4k_16')
grid on