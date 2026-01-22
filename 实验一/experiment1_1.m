%experiment1_1
clear,clc,clf
A=444.128;
a=50*1.414*pi;
W=50*1.414*pi;
Tp=0.064;
M=64;

%时域采样，采样频率为1000Hz
f1=1000;%采样频率
N=Tp*f1;%采样点数
n=(0:N-1);%生成离散时间向量，即信号的横坐标
n_t=n/f1;%生产采样时间
xn=A*exp(-a*n_t).*sin(W*n_t);%对信号采样
%FFT
Xk=fft(xn,M);%对xn进行M点FFT得到DFT
k=(0:M-1);
figure(1)
subplot(211),stem(n,xn)
title('采样频率为1000Hz的xn'),xlabel('时间n'),ylabel('xn')
grid on
subplot(212),stem(k,abs(Xk))
xlabel('频率k'),ylabel('Xk')
grid on


%时域采样，采样频率为300Hz
f1=300;%采样频率
N=Tp*f1;%采样点数
n=(0:N-1);%生成离散时间向量，即信号的横坐标
n_t=n/f1;%生产采样时间
xn=A*exp(-a*n_t).*sin(W*n_t);%对信号采样
%FFT
Xk=fft(xn,M);%对xn进行M点FFT得到DFT
k=(0:M-1);
figure(2)
subplot(211),stem(n,xn)
title('采样频率为300Hz的xn'),xlabel('时间n'),ylabel('xn')
grid on
subplot(212),stem(k,abs(Xk))
xlabel('频率k'),ylabel('Xk')
grid on


%时域采样，采样频率为200Hz
f1=200;%采样频率
N=Tp*f1;%采样点数
n=(0:N-1);%生成离散时间向量，即信号的横坐标
n_t=n/f1;%生产采样时间
xn=A*exp(-a*n_t).*sin(W*n_t);%对信号采样
%FFT
Xk=fft(xn,M);%对xn进行M点FFT得到DFT
k=(0:M-1);
figure(3)
subplot(211),stem(n,xn)
title('采样频率为200Hz的xn'),xlabel('时间n'),ylabel('xn')
grid on
subplot(212),stem(k,abs(Xk))
xlabel('频率k'),ylabel('Xk')
grid on