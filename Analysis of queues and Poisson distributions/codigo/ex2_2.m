function [ f ] = ex2_2( lambda, nr_eventos )

%Fun��o que representa a gera��o do processo de chegada segundo 
%distribui��o de Poisson
%� feito o display do histograma, segundo um certo lambda dado, do n�mero 
%eventos que ocorreram por unidade tempo
%� feito o display do histograma que representa a distribui��o de Poisson

%� gerado uma pseudo vari�vel aleat�ria com uma distribui��o exponensial
delta_t = @(l)( - log (1 - rand) / l );
poisson = @(l,k)(l^k / factorial(k)) * exp(-l);

%vector com os valores gerados aleat�riamente segundo a distribui��o
%exponencial
vector_eventos = [];
vector_eventos(1) = delta_t(lambda);
for i=2:nr_eventos
    vector_eventos(i) = vector_eventos(i-1) + delta_t(lambda);
end

disp(vector_eventos);

figure('Name',strcat('Event generation with Lambda=', num2str(lambda)))
bar(vector_eventos)
title('Time for each event generation')
ylabel('time')
xlabel('events')

%Vector que representa o n�mero de pacotes por unidade de tempo
actual_event = 1;
vector_segundos = [];

for time_interval = 1:ceil(vector_eventos(nr_eventos))  %total time

    events = 0;
    while vector_eventos(actual_event) < time_interval
        events=events +1;
        actual_event= actual_event+1;
        if actual_event > nr_eventos
            break
        end
    end
    vector_segundos(time_interval) = events;
end

disp(vector_segundos);

figure('Name',strcat('Events by time with Lambda=', num2str(lambda)))
bar(vector_segundos)
title('Number of events by time unit')
ylabel('events')
xlabel('time')

%Vector que representa a distribui��o de pacotes por unidade de tempo
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

%vector que representa a distribui��o de Poisson conforme a distribui��o
%dos pacotes por unidade de tempo
Poisson = [];
for i = 0:max(vector_segundos)
    Poisson(i+1) = poisson(lambda,i);
end

%disp(Poisson);

x_axis = 0:max(vector_segundos);
figure('Name',strcat('Poisson distribution with Lambda=', num2str(lambda)))
hold on
plot(x_axis,Poisson,'LineWidth',1.5)  % poisson line
bar(x_axis,pacotes_periodo)  % events bars
xlim([-0.5,max(x_axis)+1])
title(strcat('Poisson distribution with lambda = ', num2str(lambda)))

f=Poisson;

end

