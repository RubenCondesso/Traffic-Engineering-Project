function  f  = simulacaoTaxaErros(N)

addpath('./functions');

array_errorRate=[];
array_sucessRate=[];
array_falseNegativeRate=[];
array_falsePositiveRate=[];

aux=[];
for i=1:N
    
    aux=errorRate();
    
    array_errorRate(i)=aux(1);
    array_sucessRate(i)=aux(4);
    array_falseNegativeRate(i)=aux(2);
    array_falsePositiveRate(i)=aux(3);
    
end

media_errorRate=0;
media_sucessRate=0;
media_falseNegativeRate=0;
media_falsePositiveRate=0;

for i=1:N
    
    media_errorRate=media_errorRate+array_errorRate(i);
    media_sucessRate=media_sucessRate+array_sucessRate(i);
    media_falseNegativeRate=media_falseNegativeRate+array_falseNegativeRate(i);
    media_falsePositiveRate=media_falsePositiveRate+array_falsePositiveRate(i);
    
end

disp('Media da Taxa de erro: ');
disp(media_errorRate/N);

disp('Media da Taxa de sucesso: ');
disp(media_sucessRate/N);

disp('Media da Taxa de falsos negativos: ');
disp(media_falseNegativeRate/N);

disp('Taxa de falsos positivos: ');
disp(media_falsePositiveRate/N);

disp('Valores gerados da taxa de erro:');
disp(array_errorRate);

disp('Valores gerados da taxa de sucesso:');
disp(array_sucessRate);

disp('Valores gerados da taxa de falsos negativos:');
disp(array_falseNegativeRate);

disp('Valores gerados da taxa de falsos positivos:');
disp(array_falsePositiveRate);
end

