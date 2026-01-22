%experiment2_1_3
clear,clc,clf

x3n=[4 3 2 1 1 2 3 4];
n=0:7;
X3k_8=fft(x3n,8);%对x3n进行8点的DFT
k_8=0:7;
X3k_16=fft(x3n,16);%对x3n进行16点的DFT
k_16=0:15;

figure(1)
subplot(311)
stem(n,x3n),title('倒三角序列'),xlabel('时间n'),ylabel('振幅x3n')
grid on
subplot(312)
stem(k_8,abs(X3k_8)),title('8点DFT'),xlabel('频率k'),ylabel('振幅X3k_8')
grid on
subplot(313)
stem(k_16,abs(X3k_16)),title('16点DFT'),xlabel('频率k'),ylabel('振幅X3k_16')
grid on