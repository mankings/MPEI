%%Ex 3

[users,Set] = createSet("u.data");

signatures = minHash(Set);

threshold = 0.4;
minHashSimilars(users,signatures,threshold);

%%Nao faco a minima o que, mas alguma coisa esta mal neste algoritmo
%%Passei horas a tentar encontrar o bug, o professor da pratica ja viu o codigo,
%%a partida, deveria estar tudo bem, mas no calculo das similaridades dao me sempre os mesmos
%%valores

%%Se porventura alguem conseguir perceber qual o erro, agradecia saber o que esta a correr mal