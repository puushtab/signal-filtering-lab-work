[y, Fs] = audioread('sounds/Pa11.wav');
x = fft(y);
N = length(y);


cor = xcorr(y); % Récupération de la corrélation
plot(cor);
[m, i_m] = max(cor(523000:2*N-1)); % Récupération du maximum
i_m = i_m + 523000;

% On souhaite filtrer m pour récupérer les deux autres maximums
% f = (i_m-1)/N*Fs; %Récupère la fréquence associée
% A = [1 -2*cos(2*pi*f/Fs) 1]; %Nominateur du filtre (coupe bande)
% B = [1 -2*0.9*cos(2*pi*f/Fs) 0.9*0.9]; %Dénominateur du filtre (amplification)
% new_cor = filter(A,B,cor); %Signal filtré

plot(cor(523000:2*N-1));

alpha = 1;
A = [1];

audio = ifft(x);
sound(audio, Fs);