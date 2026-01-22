clear,clc,clf



%原始三角波
N=27;
xn=14*triang(N)'%生成N点三角波,triang(N)函数生成N点归一化的三角波（用列向量形式）
xn(17:27)=0;


%16点频率采样
Xk_16=fft(xn,16);
k=0:15;
xn_16=ifft(Xk_16);
subplot(121),stem(k,abs(Xk_16))
title('16点频域采样后的频谱'),xlabel('频率k'),ylabel('Xk_32振幅')
subplot(122),stem(abs(xn_16))
title('16点频域采样后的时域信号'),xlabel('时间n'),ylabel('xn_32振幅')
