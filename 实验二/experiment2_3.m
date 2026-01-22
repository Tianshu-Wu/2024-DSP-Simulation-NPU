%experiment2_3
clear,clc,clf

%时域采样
Fs=64;
T=1/Fs;%采样周期
n=0:255;%选取256个点来表示周期信号
x8n=cos(8*pi*T*n)+cos(16*pi*T*n)+cos(20*pi*T*n);
%x8n=cos(pi/8*n)+cos(pi/4*n)+cos(5*pi/16*n)
%各分量的周期：16        8          32
%所以N=32，所以采样点数可以选取32,64,96,128,...

%频率采样
X8k_16=fft(x8n,16);%16点DFT
k_16=0:15;
X8k_32=fft(x8n,32);%16点DFT
k_32=0:31;
X8k_64=fft(x8n,64);%16点DFT
k_64=0:63;

figure(1)
stem(n,x8n),title('时间采样后的离散信号'),xlabel('时间n'),ylabel('振幅x8n')
grid on
figure(2)
subplot(311)
stem(k_16,abs(X8k_16)),title('16点DFT'),xlabel('频率k'),ylabel('振幅X8k_16')
grid on
subplot(312)
stem(k_32,abs(X8k_32)),title('32点DFT'),xlabel('频率k'),ylabel('振幅X8k_32')
grid on
subplot(313)
stem(k_64,abs(X8k_64)),title('164点DFT'),xlabel('频率k'),ylabel('振幅X8k_64')
grid on

