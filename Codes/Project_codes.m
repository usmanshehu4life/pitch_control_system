K = tf([0.1 0.01],[1 0]);
I = 400;
G = tf(1,[I 0 0]);

W0= 7.28*10^(-5);
SqW0= W0^(2);
Tds= 10^(-4)*tf([1, 0],[1, 0, SqW0]);
SqW0= W0^(2);
Taddk = K+Tds;
srs = series (Taddk,G);
trf = feedback(srs,1)
poles = pole(trf);













