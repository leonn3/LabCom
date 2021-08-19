% autor: woldson leonne
% questao 5

clear all; close all; clc;

% definicao do sinal x(t)
fs = 1e+3; 
fc = 180;  
t = (-.3:1/fs:.3);
x = cos(20*pi*t +(pi/4)) +3*cos(40*pi*t +((2*pi)/5)) ...
    +2*cos(120*pi*t +(pi/8)); %escolhido mesmo x(t) da questao 3

% definicao do desvio de frequencia
desv_freq = 30; %Hz

% modulacao fm
y = fmmod(x,fc,fs,desv_freq);

% demodulacao fm
z = fmdemod(y,fc,fs,desv_freq);

% plot
figure()
set (gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]); % Max fig.
subplot(2,1,1)
plot(t,x,'k','LineWidth',2); hold on;
plot(t,y,'m','LineWidth',1.2)
xlabel('tempo','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)
grid minor
legend('sinal original','sinal modulado')
title('Modulacao/Demodulacao em Frequencia', ...
    'Interpreter','LaTex','FontSize',18);

subplot(2,1,2)
plot(t,x,'k','LineWidth',2); hold on;
plot(t,z,'m','LineWidth',1.2)
xlabel('tempo','Interpreter','LaTex','FontSize',18)
ylabel('amplitude','Interpreter','LaTex','FontSize',18)
grid minor
legend('sinal original','sinal demodulado')

%{
a variacao no desvio de frequencia influencia diretamente no processo
de modulacao e demodulacao. Ao variar esse valor, escolhendo valores muito
altos ou baixos, percebe-se que aumentam os erros entre o sinal original e
o sinal demodulado.
%}


