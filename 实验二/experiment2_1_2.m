%experiment2_1_2
clear,clc,clf

x2n=[1 2 3 4 4 3 2 1];
n=0:7;
X2k_8=fft(x2n,8);
k_8=0:7;
X2k_16=fft(x2n,16);
k_16=0:15;

figure(1)
subplot(311)
stem(n,x2n),title('三角序列'),xlabel('时间n'),ylabel('振幅x2n')
grid on
subplot(312)
stem(k_8,abs(X2k_8)),title('8点DFT'),xlabel('频率k'),ylabel('振幅X2k_8')
grid on
subplot(313)
stem(k_16,abs(X2k_16)),title('16点DFT'),xlabel('频率k'),ylabel('振幅X2k_16')
grid on