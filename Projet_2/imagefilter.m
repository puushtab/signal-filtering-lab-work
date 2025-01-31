% Lecture de l'image
clear B;
B=imread('fichier2.bmp','bmp');
B=255*B;

%Taille de l'image
len = size(B);

% On cherche à:
%   1. Déterminer le décalage associé à une correlation "maximale" entre 
%      chaque ligne successives (les lignes proches auront une corrélation
%      proche)
%   2. Décaler la deuxième ligne du décalage trouvé en 1.
for i = 2:len(1)
    g = xcorr(B(i-1,:), B(i,:)); % Etape 1 
    [m, i_m] = max(g); 
    B(i,:) = circshift(B(i,:), i_m); % Etape 2
end


%On cherche les colonnes pour lesquelles la corrélation est la plus basse
%et on extrait l'indice des colonnes avec le moins de corrélation
X_max = [];

for j = 2:len(2)
    g = xcorr(B(:,j-1), B(:,j));
    m = max(g);
    X_max = [X_max g(1)];
end
[min, j_min] = max(-X_max);
disp(j_min);

%Ca marche pas, la bonne valeur est 277
for i = 2:len(1)
    B(i,:) = circshift(B(i,:), -j_min);
end

image(B);
colormap("GRAY");