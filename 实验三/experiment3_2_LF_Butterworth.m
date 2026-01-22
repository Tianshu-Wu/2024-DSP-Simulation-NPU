%experiment3_2_LF_Butterworth
%===用双线性变换法设计低通巴特沃斯数字滤波器
clear,clc,clf

Fs=3000;T=1/Fs;N=1600;
fp=280;fs=450;%低通滤波器的指标
wpz=fp*2*pi*T;wsz=fs*2*pi*T;%设计DF要求的数字指标，wpz是数字通带截止频率，wsz是数字阻带截止频率
%===设置双线性变换法的滤波器参数
wp=2/T*tan(wpz/2);ws=2/T*tan(wsz/2);%预畸变公式把数字角频率转换为模拟角频率
rp=0.1;rs=60;%通带最大衰减和阻带最小衰减(dB)
%===设计巴特沃斯低通模拟滤波器
[M,wc]=buttord(wp,ws,rp,rs,'s');%计算滤波器阶数M和3dB截止频率wc
[B,A]=butter(M,wc,'s');%计算滤波器系统函数Hs分子分母多项式系数
%===用双线性变换法转换成数字滤波器
[Bz,Az]=bilinear(B,A,Fs);%系统函数Hz的分子分母多项式系数
%===把Z域系统函数转换成频率响应
[h,wz]=freqz(Bz,Az,N);%N是在Z域单位圆上的采样点数，wz是[0,pi]区间内的N个频率等分点，h是wz对应的频率响应值
%===损耗函数曲线
plot(wz/pi,20*log10(abs(h)/max(abs(h))));grid on
xlabel('w/pi');ylabel('幅度/dB');title('低通巴特沃斯数字滤波器损耗函数曲线')
axis([0,1,-350,20])