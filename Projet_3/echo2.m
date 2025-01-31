[x,Fe]=audioread("sounds/Pa11.wav") ; % lecture du signal
u=xcorr(x); % fonction xcorr (lire le help et la tester sur un petit vecteur)

N = length(x);
y = fft(x);
a = 0.9;
% On lit sur le graphique:
xmid =(525091-521673)/2;

[M1,I1] = max(u);
for (i=521673-xmid:521673+xmid)
    u(i)=0;
end

[M2,I2] = max(u);
u(I2) = 0;

gamma = M2/M1;
p_0 = I1-I2;

alpha=(1-sqrt(1-4*gamma^2))/2/gamma;
x = filter([1],[1 zeros(1,p_0-1) alpha],x);

plot(u);

sound(x,Fe);