%experiment2_1_1
clear,clc,clf

x1n=[1 1 1 1];
n=0:3;
X1k_8=fft(x1n,8);%对x1n进行8点的DFT
k_8=0:7;
X1k_16=fft(x1n,16);%对x1n进行16点的DFT
k_16=0:15;

figure(1)
subplot(311)
stem(n,x1n),title('R_4(n)序列'),xlabel('时间n'),ylabel('振幅x1n')
grid on
subplot(312)
stem(k_8,abs(X1k_8)),title('8点DFT'),xlabel('频率k'),ylabel('振幅X1k_8')
grid on
subplot(313)
stem(k_16,abs(X1k_16)),title('16点DFT'),xlabel('频率k'),ylabel('振幅X1k_16')
grid on