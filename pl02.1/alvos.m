function probSimulacao = alvos(alvos, dardos, N)
%ALVOS alvos(alvos, dardos, N)
%   Realiza uma simulação, com N experiências, para determinar a
%   probabilidade de, lançando dardos a alvos, pelo menos um alvo ser
%   atingido por 2 ou mais dardos.
map = randi(alvos, dardos, N);
casos = zeros(1, N);
for i = 1:N
    casos(i) = length(unique(map(:, i))) ~= dardos;
end

casosFav = sum(casos);
probSimulacao = casosFav/N;
end

