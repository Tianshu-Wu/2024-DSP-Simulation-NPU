%experiment3_sikaoti1

N=2000; %N为信号st的长度。
Fs=10000;T=1/Fs;Tp=N*T; %采样频率Fs=3000Hz，Tp为采样时间
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
fxt=fft(st,N);
%===绘制st的时域波形和幅频特性曲线
subplot(3,1,1)
plot(t,st);grid;xlabel('t/s');ylabel('s(t)');
axis([0,Tp/8,min(st),max(st)]);title('(a) s(t)的波形')
subplot(3,1,2)
stem(w,abs(fxt)/max(abs(fxt)),'.');grid;title('(b) s(t)的频谱（数字角频率）N=2000')
axis([0,pi,0,1.2]);
xlabel('w/rad');ylabel('幅度')
subplot(3,1,3)
stem(f,abs(fxt)/max(abs(fxt)),'.');grid;title('(c) s(t)的频谱（模拟频率）N=2000')
axis([0,1600,0,1.2]);
xlabel('f/Hz');ylabel('幅度')