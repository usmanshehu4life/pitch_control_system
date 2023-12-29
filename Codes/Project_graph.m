function f = project_graph(KNs,KNc,KDs,KDc)
  figure
I=400;
G = tf(1,[I 0 0]);
t1= 0:0.1:400;
t2=0:100:172800;
K= tf([KNs, KNc],[KDs, KDc]);
W0= 7.28*10^(-5);
SqW0= W0^(2);
T= 10^(-4)*tf([1, 0],[1, 0, SqW0]);
Tdt= 10^(-4)*cos(W0*t2);
Taddk = K+T;
srs = series (Taddk,G);
trf = feedback(srs,1);
ref_in = ((5*pi)/180);
y = ((ref_in*step( trf,t1))*180)/pi;
subplot(221);
plot(t1,y);
xlabel('t in s');
ylabel('OutputAngle in degrees');
title('Output angle for step response of 5 deg');
trf2 = feedback(K,G);
y2= ((ref_in*step(trf2,t1))*180)/pi;
subplot(222);
plot(t1,y2);
xlabel('t in s');
ylabel('Tc(t)in N.m');
title('Tc(t) for step response of 5 deg');
trf3 = feedback(G,K);
sim1= lsim(trf3, Tdt, t2);
sim1Todeg=(sim1*180)/pi;
subplot(223);
plot(t2,sim1Todeg);
xlabel('t in s');
ylabel('OutputAngle in degrees');
title('Output angle for response of Td');
GAddK= series(G,-K);
trf4 = feedback(GAddK,1,1);
sim2= lsim(trf4, Tdt, t2);
subplot(224);
plot(t2,sim2);
xlabel('t in s');
ylabel('Tc(t)in N.m');
title('Tc for response of Td');
end


