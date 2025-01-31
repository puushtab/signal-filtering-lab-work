[x, Fs] = audioread('sounds/Mo11.wav');

yw = aryule(x, 4);
y = filter(yw, [1 0 0 0], x);
sound(y, Fs);