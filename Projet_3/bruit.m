[x1, Fs1] = audioread('sounds/x1.wav');
[x2, Fs2] = audioread('sounds/x2.wav');

N = length(x1);
rho = sum(x1.*x2)/sum(x2.*x2);

eps = x1 - rho*x2;

corr = sum(eps.*x2)/N;
disp(corr); %Corrélation très proche de 0

sound(eps, Fs*2);