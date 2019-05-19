function [ f ] = ex3( lambda,u, n )
%
% � gerado n vezes a simula��o do M/M/1 queue 
% calculando a m�dia dessas n simula��es
% comparando com o valor te�rico calculado

vector=queueSimulation(lambda,u);
valor_teorico=vector(1);
media_final=0;
for i=1:n
    media_final=media_final + queueSimulation(lambda,u);
end    

media_final=media_final/n;

disp('Valor Te�rico');
disp(valor_teorico);

disp('Valor Experimental');
disp(media_final(2));
end

