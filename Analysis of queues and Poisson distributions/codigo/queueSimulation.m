function [ f ] = queueSimulation( lambda, u)
%
%Função que simula uma M/M/1 queue segundo um valore de lambda e de miu

%Valor da média teórica
Media_Teorica=lambda/(u-lambda);

%Valor do tempo máximo para gerar os eventos
global_time=50;

%É gerado uma pseudo variável aleatória com uma distribuição exponensial
delta_t = @(l)( - log (1 - rand()) / l );
poisson = @(l,k)(l^k / factorial(k)) * exp(-l);

%Vector com o distribuição entre os intervalos de tempo gerado segundo
%distribuição exponensial
vector_eventosTempo = [];
vector_eventosTempo(1) = delta_t(lambda);

i=2;
while max(vector_eventosTempo)<global_time
    vector_eventosTempo(i) = vector_eventosTempo(i-1) + delta_t(lambda);
    i=i+1;
end

%Vector com a distribuição dos intervalos de tempo que cada pacote demora
%a ser processado
vector_eventosServico = [];
vector_eventosServico(1) = delta_t(u);

i=2;
while max(vector_eventosServico)<global_time
    vector_eventosServico(i) = vector_eventosServico(i-1) + delta_t(u);
    i=i+1;
    
end

vector_media=[];
queue_vector=[];
queue_count=0;
count=1;
tempo_atual=0;

%Calculo da média do valor prático, segundo o processado dos pacotes
%usando o vector de tempo e de servico, vendo os pacotes que entram e saiem
%da queue
while tempo_atual<global_time
    
    tamanho_queue=[];
    
    if min(vector_eventosTempo)>min(vector_eventosServico)
        tempo_atual=vector_eventosServico(1);
        vector_eventosServico(1)=[];
        
        if tempo_atual>count
            queue_vector(count)=queue_count;
            tamanho_queue=size(queue_vector);
            
            vector_media(count)=sum(queue_vector)/tamanho_queue(2);
            count=count+1;
        elseif queue_count >0
            queue_count= queue_count-1;
        end
    else
        tempo_atual=vector_eventosTempo(1);
        vector_eventosTempo(1)=[];
        if tempo_atual>count
           queue_vector(count)=queue_count;
           tamanho_queue=size(queue_vector);
            
           vector_media(count)=sum(queue_vector)/tamanho_queue(2);
           
           count=count+1;
        end
        queue_count=queue_count+1;
    end
end

f=[Media_Teorica, vector_media(end)];

end

