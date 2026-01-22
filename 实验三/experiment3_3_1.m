%experiment3_3_1
%用低通滤波器选出原信号st中以250Hz为载频，50Hz为带宽的分量
clear,clc,clf

%===原始信号st
N=3000; %N为信号st的长度，注意此处频率分辨率Fs/N应当是st六个频率分量的整数倍，来防止频谱泄露
Fs=3000;T=1/Fs;Tp=N*T; %采样频率Fs=3000Hz，Tp为采样时间
t=0:T:(N-1)*T;k=0:N-1;w=k*2*pi/N;f=w/T/(2*pi);%w是数字角频率，f是相应的模拟频率
fc1=1000; 
fm1=fc1/10; 
fc2=500; 
fm2=fc2/10; 
fc3=250; 
fm3=fc3/10; 
xt1=cos(2*pi*fm1*t).*cos(2*pi*fc1*t); 
xt2=cos(2*pi*fm2*t).*cos(2*pi*fc2*t); 
xt3=cos(2*pi*fm3*t).*cos(2*pi*fc3*t); 
st=xt1+xt2+xt3; %三路调幅信号相加

%===低通巴特沃斯数字滤波器
fp=280;fs=450;%低通滤波器的指标(Hz)
wpz=fp*2*pi*T;wsz=fs*2*pi*T;%设计DF要求的数字指标，wpz是数字通带截止频率，wsz是数字阻带截止频率
%===设置双线性变换法的滤波器参数
wp=2/T*tan(wpz/2);ws=2/T*tan(wsz/2);%预畸变公式把数字角频率转换为模拟角频率
rp=0.1;rs=60;%通带最大衰减和阻带最小衰减(dB)
%===设计巴特沃斯低通模拟滤波器
[M,wc]=buttord(wp,ws,rp,rs,'s');%计算滤波器阶数M和3dB截止频率wc
[B,A]=butter(M,wc,'s');%计算滤波器系统函数Hs分子分母多项式系数
%===用双线性变换法转换成数字滤波器
[Bz,Az]=bilinear(B,A,Fs);%系统函数Hz的分子分母多项式系数

%===滤波
yt=filter(Bz,Az,st);%st为时域信号
yw=fft(yt,N);

subplot(211)
plot(t,yt);grid on
xlabel('t/s');ylabel('幅度');title('原信号st通过低通滤波器的结果时域')
axis([0,Tp/8,min(st),max(st)])
subplot(212)
stem(f,abs(yw)/max(abs(yw)),'.');grid on
xlabel('f/Hz');ylabel('幅度');title('原信号st通过低通滤波器的结果频域')
axis([0,1200,0,1.2])