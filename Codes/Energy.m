function energy= EnergyOf(a,b,c,d) %k = (as+b)/(cs+d)
W0= 7.28*10^(-5);%In this paragraph, constants are defined.
SqW0= W0^(2);
I=400;
t1=0:100:172800;
Ks= tf([a b],[c d]); %In this paragraph,
Tds= 10^(-4)*tf([1, 0],[1, 0, SqW0]); %individual blocks are defined.
Gs=tf(1,[I,0,0]);
TdsplusKs = Ks + Tds; %In th
OLTs = series(TdsplusKs,Gs);
CLTsGr1= feedback(OLTs,1);
ref_in=((5*pi)/180);
y1= ((ref_in*step( CLTsGr1,t1))*180)/pi;
y1Pos=abs(y1)
plot(t1,y1)
subplot(221);
xlabel('t in s');
ylabel('y1 in degrees');
title('Output angle y1 for step response of 5 deg');
xlabel('t in s');
ylabel('y1 in degrees');
title('Output angle y1Pos for step response of 5 deg');
plot(t1,y1Pos)
energy = sum(y1Pos)/(172800/100);
end


