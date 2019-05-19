function [ f ] = ex3( lambda,u, n )
%
% É gerado n vezes a simulação do M/M/1 queue 
% calculando a média dessas n simulações
% comparando com o valor teórico calculado

vector=queueSimulation(lambda,u);
valor_teorico=vector(1);
media_final=0;
for i=1:n
    media_final=media_final + queueSimulation(lambda,u);
end    

media_final=media_final/n;

disp('Valor Teórico');
disp(valor_teorico);

disp('Valor Experimental');
disp(media_final(2));
end

