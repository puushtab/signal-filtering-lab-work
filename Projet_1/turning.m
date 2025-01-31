[x1,Fe]=audioread('Erlk.wav') ;

v = 340;
d = 0.08;
Te = 1/Fe;
len = length(x1);

delta = 4*pi/len;

x3 = (1:len);

tau = d * abs(sin( delta*x3))/v;

indices = (max(1, x3 - floor(tau/Te)));

x2 = x1(indices);

y = [x1 x2];
sound(y,Fe);