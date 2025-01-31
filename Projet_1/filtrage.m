[y, Fs] = audioread('Mo11.wav');
N = length(y);
x = fft(y);
disp(Fs);
disp(N);

plot(abs(x));

for i = 1:2 %Répète 2 fois l'opération
    [m, i_m] = max(abs(x)); %Récupère l'indice du max
    f = (i_m-1)/N*Fs; %Récupère la fréquence associée
    A = [1 -2*cos(2*pi*f/Fs) 1]; %Nominateur du filtre (coupe bande)
    B = [1 -2*0.9*cos(2*pi*f/Fs) 0.9*0.9]; %Dénominateur du filtre (amplification)
    x2 = filter(A,B,ifft(x)); %Signal filtré
    x = fft(x2);
end

audio = ifft(x);
sound(audio, Fs);