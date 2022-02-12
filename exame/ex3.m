     f1 = "Jogue com o homem, não com as probabilidades.";
     f2 = "Jogue com as mulheres e também com as probabilidades";
     f3 = "Se você desconhece até as probabilidades, isso é incerteza.";
     f4 = "As probabilidades, a ciência, homens e mulheres estão contra mim.";

     n_hash = 5;
     n_frases = 4;
     shingleSize = 3;
     frases = {f1, f2, f3, f4};
     sigs = inf(n_frases, n_hash);
 
     for k = 1:n_frases
         frase = frases{k};
         len = length(frase);
         for j = 1:(len - shingleSize + 1)
             key = lower(char(frase(j:(j+shingleSize-1)))); 
             h = zeros(1, n_hash);
             for i = 1:n_hash
                 h(i) = hf1(key, i);
             end
             sigs(k, :) = min([sigs(k, :); h]);
         end
     end