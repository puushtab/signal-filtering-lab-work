[y, Fs] = audioread('sons_projet_2/canal.wav');
N = length(y);
x = fft(y);
plot(abs(x));

for i = 1:floor((N/4+1)-1) % On va de "0 à Fe/4" et on permute par le symétrique
    % Faire un dessin ! 
    % Convention sur les indices: X[i] <-> X[n-1]. 
    % On a N points de fréquences 0, 1/N, ..., (N-1)/N
    % L'indice de "Fe/2" est donc ici N/2 + 1
    a = x(i+1);
    b = x((N/2+1) - i); % On prend le symétrique par rapport à Fe/4
    x(i+1) = b;
    x((N/2)+1 - i) = a;
    a = x((N/2+1) + i);
    b = x(N+1 - i);
    x((N/2+1) + i) = b;
    x(N+1 - i) = a;
end
y = ifft(x);
sound(y, Fs);