% autor: woldson leonne
% questao 2

clear all; close all; clc;

% definicao do sinal senoidal generico
f = 20;               %Hz
A = 1;                %V
IA=1/(f*60);          %intervalo de amostragem
fs = 1/IA;            %frequencia de amostragem
t=(-2/f:IA:2/f);      %tempo 
x = A*sin(2*pi*f*t);  %definicao do sinal original
N = length(t);        %tamanho das amostras para simulacao 

% sinal com perturbacao (ruido 60Hz + ruido branco)
f_xi = 60;                           %frequencia do ruido
xi = awgn(0.5*sin(2*pi*f_xi*t), 10); %escolhido potencia de 10 dB

% adicao do ruido ao sinal original 
x_xi = x + xi;

% Plotagem do sinal original e do ruido, ambos separados
figure(1);
set (gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]); % Max. fig.
subplot(211);
plot(t,x,'k','LineWidth',2);
title('Sinal original', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)

subplot(212);
plot(t,x_xi,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)
title('Sinal com ruido de 60 Hz', ...
    'Interpreter','LaTex','FontSize',18);

% Aplicando a transformada discreta de fourier
%{
 Precisamos usar abs(x) para tomar a magnitude do sinal apenas, uma vez que
temos parte real e imaginária. 
o que nos interessa sao as componentes espectrais do sinal, para isso 
precisamos "transformar" o eixo x em valores de frequencia, podemos 
comecar normalizando o vetor de amostras, e em seguida utilizamos 
a funcao fftshift(x) para mover o zero em frequencia para o centro 
do array
 %}
nVals=0:N-1;
nVals = nVals/N; %normalizacao

fVals = fs*(-N/2:N/2-1)/N;
fft_x = fftshift(fft(x,N));
fft_x_xi = fftshift(fft(x_xi,N));


figure();
set (gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]); % Max fig.
subplot(2,1,1)
plot(fVals,abs(fft_x),'b','color','k','LineWidth',2);
set(gca,'xtick',[-80:20:80]) %melhora precisao de leitura
title('Espectro espelhado shiftado do sinal original', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('$f [Hz]$','Interpreter','LaTex','FontSize',18)
ylabel('Valores da Transformada','Interpreter','LaTex','FontSize',18)
grid minor

subplot(2,1,2)
plot(fVals,abs(fft_x_xi),'b','color','k','LineWidth',2);
set(gca,'xtick',[-80:20:80]) %melhora precisao de leitura
title('Espectro espelhado shiftado do sinal contaminado', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('$f [Hz]$','Interpreter','LaTex','FontSize',18)
ylabel('Valores da Transformada','Interpreter','LaTex','FontSize',18)
grid minor

%Como esperado, na Transformada de Fourier do sinal contaminado percebe-se 
%as componentes espectrais se concentrando em +20Hz e -20Hz, e tambem +60Hz
%e -60Hz, que e referente ao ruido, o qual poderia ser atenuado ao utilizar
%filtros digitais, como um passa baixas ou notch.

%alem disso, percebe-se que, no espectro de frequencias, com a adicao do 
%ruido branco, todas as faixas de frequencia sofreram influencia do mesmo
%para todo o conjunto de amostras do sinal e que o mesmo esta relacionado
%com a potencia definida para o ruido.