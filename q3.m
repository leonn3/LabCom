% autor: woldson leonne
% questao 3

clear all; close all; clc;

N = 1000; %quantidade de pontos definido no enunciado
fs = 13*60;
Ts = 1/fs;
tts = N*Ts -Ts;
tfinal = tts/6;
tinit = -tts/6;
t = (tinit:Ts:tfinal);

% definicao do sinal dado
x = cos(20*pi*t +(pi/4)) +3*cos(40*pi*t +((2*pi)/5)) ...
    +2*cos(120*pi*t +(pi/8));

% contaminando o sinal original com ruido branco
xi = awgn(x, -5); %escolhido potencia de -5 dB

% Plotagem do sinal original e com o ruido, ambos separados
figure(1);
set (gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]); % Max. fig.
subplot(211);
plot(t,x,'k','LineWidth',2);
title('Sinal original', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)

subplot(212);
plot(t,xi,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)
title('Sinal com ruido branco gaussiano', ...
    'Interpreter','LaTex','FontSize',18);

% Aplicando a transformada discreta de fourier
%{
 Precisamos usar abs(x) para tomar a magnitude do sinal apenas, uma 
vez que temos parte real e imaginaria. 
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
fft_x_xi = fftshift(fft(xi,N));


figure();
set (gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]); % Max fig.
subplot(2,1,1)
plot(fVals,abs(fft_x),'b','color','k','LineWidth',2);
set(gca,'xtick',[-80:10:80]) %melhora precisao de leitura
title('Espectro espelhado shiftado do sinal original', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('$f [Hz]$','Interpreter','LaTex','FontSize',18)
ylabel('Valores da Transformada','Interpreter','LaTex','FontSize',18)
grid minor

subplot(2,1,2)
plot(fVals,abs(fft_x_xi),'b','color','k','LineWidth',2);
set(gca,'xtick',[-80:10:80]) %melhora precisao de leitura
title('Espectro espelhado shiftado do sinal contaminado', ...
    'Interpreter','LaTex','FontSize',18);
xlabel('$f [Hz]$','Interpreter','LaTex','FontSize',18)
ylabel('Valores da Transformada','Interpreter','LaTex','FontSize',18)
grid minor

%Como esperado, na Transformada de Fourier do sinal original percebe-se 
%as componentes espectrais se concentrando em nas frequencias de 10, 20 
% e 60 Hz, o que confere com a frequencia definida no sinal

%alem disso, percebe-se que, no espectro de frequencias, com a adicao do 
%ruido branco gassiano, todas as faixas de frequencia sofreram influencia 
%para todo o conjunto de amostras do sinal e que o mesmo esta relacionado
%com a potencia definida para o ruido.