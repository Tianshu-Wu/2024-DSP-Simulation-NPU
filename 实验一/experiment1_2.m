%experiment1_2  
clear,clc,clf
%原始三角波
N=27;
xn=14*triang(N)'%生成N点三角波,triang(N)函数生成N点归一化的三角波（列向量形式）
n=0:26;
figure(1)
stem(n,xn)
title('原始三角波'),xlabel('时间'),ylabel('xn振幅')
grid on

%32点频率采样
Xk_32=fft(xn,32);%对xn进行32点DFT相当于对其进行32点频率采样
k=0:31;
xn_32=ifft(Xk_32);
figure(2)
subplot(121),stem(k,abs(Xk_32))
title('32点频域采样后的频谱'),xlabel('频率k'),ylabel('Xk_32振幅')
subplot(122),stem(abs(xn_32))
title('32点频域采样后的时域信号'),xlabel('时间n'),ylabel('xn_32振幅')

%16点频率采样
Xk_16=Xk_32(1:2:32);%抽取Xk_32的偶数点即可得到Xk_16
k=0:15;
xn_16=ifft(Xk_16);
figure(3)
subplot(121),stem(k,abs(Xk_16))
title('16点频域采样后的频谱'),xlabel('频率k'),ylabel('Xk_32振幅')
subplot(122),stem(abs(xn_16))
title('16点频域采样后的时域信号'),xlabel('时间n'),ylabel('xn_32振幅')