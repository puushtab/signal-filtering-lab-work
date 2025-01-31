[y, Fs] = audioread('sons_projet_2/Encode.wav');
N = length(y);

y1 = y(1:2:N);
y2 = y(2:2:N);

y(2:2:N) = 0;

x = fft(y);
plot(abs(x));

sound(y, Fs*2);