function [ f ] = ex2_3( nr_eventos, lambda1, lambda2, lambda3)
%
%Função de sobreposição do processo de Poisson, gerando 3 sequências
%independentes com valores de lambda diferentes

tmax= nr_eventos/max([lambda1 lambda2 lambda3]);
 
%tempo atribuido a cada lambda conforme o seu valor
t1=tmax*lambda1;
t2=tmax*lambda2;
t3=tmax*lambda3;
 
%É gerado uma pseudo variável aleatória com uma distribuição exponensial 
delta_t = @(l)( - log (1 - rand()) / l );
poisson = @(l,k)(l^k / factorial(k)) * exp(-l);

%vectores com os valores gerados aleatóriamente segundo a distribuição de
%exponencial, para cada T diferente
vector_eventosT1 = [];
vector_eventosT1(1) = delta_t(lambda1);
for i=2:t1
    vector_eventosT1(i) = vector_eventosT1(i-1) + delta_t(lambda1);
end

vector_eventosT2 = [];
vector_eventosT2(1) = delta_t(lambda2);
for i=2:t2
    vector_eventosT2(i) = vector_eventosT2(i-1) + delta_t(lambda2);
end

vector_eventosT3 = [];
vector_eventosT3(1) = delta_t(lambda3);
for i=2:t3
    vector_eventosT3(i) = vector_eventosT3(i-1) + delta_t(lambda3);
end

%Concatenação dos 3 vectores num só originando um vector final 
vector_eventosFinal = vector_eventosT1;
vector_eventosFinal = horzcat(vector_eventosFinal, vector_eventosT2);
vector_eventosFinal = horzcat(vector_eventosFinal, vector_eventosT3);

%Organização do vector final
vector_eventosFinal=sort(vector_eventosFinal);

disp(vector_eventosFinal);

%pacotes por segundo
actual_event = 1;
vector_segundos = [];

for time_interval = 1:ceil(vector_eventosFinal(nr_eventos))  %total time

    events = 0;
    while vector_eventosFinal(actual_event) < time_interval
        events=events +1;
        actual_event= actual_event+1;
        if actual_event > nr_eventos
            break
        end
    end
    vector_segundos(time_interval) = events;
end

%disp(vector_segundos);

lambdas=[lambda1,lambda2,lambda3];
     
figure('Name',strcat('Events by time with Lambdas=', num2str(lambdas)))
bar(vector_segundos)
title('Number of events by time unit')
ylabel('events')
xlabel('time')

%Vector que representa a distribuição de pacotes por unidade de tempo
pacotes_periodo = zeros(1,max(vector_segundos)+1);
    
tamanho_segundos=size(vector_segundos);

for time_interval = 1:tamanho_segundos(2)
    pacotes_periodo(vector_segundos(time_interval)+1) = pacotes_periodo(vector_segundos(time_interval)+1) + 1;
end
    
tamanho_periodo=size(pacotes_periodo);

% probabilidade de pacotes
probabilidade_total = pacotes_periodo;
for i = 1:tamanho_periodo(2)
    pacotes_periodo(i) = probabilidade_total(i) / sum(probabilidade_total);
end

disp(pacotes_periodo);
Poisson = [];

%vector que representa a distribuição de Poisson conforme a distribuição
%dos pacotes por unidade de tempo
%Para o vector com a distribuição de Poisson, é usado a soma dos 3 valores
%de lambda
for i = 0:max(vector_segundos)
    Poisson(i+1) = poisson(sum(lambdas),i);
end

x_axis = 0:max(vector_segundos);
figure('Name',strcat('Poisson distribution with Lambdas=', num2str(lambdas)))
hold on
plot(x_axis,Poisson,'LineWidth',1.5)  % poisson line
bar(x_axis,pacotes_periodo)  % events bars
xlim([-0.5,max(x_axis)+1])
title(strcat('Poisson distribution with lambdas = ', num2str(lambdas)))

end

