function probSimulacao = probCalc(k, n, N, p)
%probCalc(k, n, N, p)
%Calcula a probabilidade de k acontecimentos favoráveis em n tentativas.
%Repete a experiência N vezes.
%p é a probabilidade de um acontecimento favorável numa tentativa.

lancamentos = rand(n, N) > p;
sucessos = sum(lancamentos) == k;
probSimulacao = sum(sucessos)/N;
end