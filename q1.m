
% TEORIA:
% Transmissão de portadora suprimida por banda lateral dupla (DSB-SC):
%
% De transmissão em que:
% (a) frequências produzidas por modulação de amplitude são simetricamente 
% espaçadas acima e abaixo da frequência portadora e 
% (b) O nível da portadora é reduzido ao nível prático mais baixo, 
% idealmente completamente suprimido.
%
% Na modulação de transmissão de portadora suprimida de banda lateral 
% dupla (DSB-SC), ao contrário do AM, a portadora de onda não é 
% transmitida;
% assim, uma grande porcentagem da potência que lhe é dedicada é 
% distribuída entre as bandas laterais, o que implica um aumento da 
% cobertura em DSB-SC,
% em comparação com AM, para a mesma potência utilizada.
%
% A transmissão DSB-SC é um caso especial de transmissão de portadora 
% reduzida de banda lateral dupla.


% autor: woldson leonne
% questao 1

clear all; close all; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% entrada dos valores usuario
% Amplitude_Sinal_Mensagem = input ('Amplitude do Sinal de Mensagem = ');
% fm = input ('Frequencia do Sinal de Mensagem = ');
% Amplitude_Sinal_Portadora = input ('Amplitude da Portadora = ');
% fc = input ('Frequencia da Portadora = ');
%m = Amplitude_Sinal_Mensagem/Amplitude_Sinal_Portadora;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% entrada dos valores manuais
m = 1.2; % indice de modulacao
Amplitude_Sinal_Mensagem = 5;
fm = 2000;
Ta=1/fm;                % periodo de tempo do sinal de mensagem
t=0:Ta/999:6*Ta;        % tempo total de simulacao
% amplitude da portadora [onde, indice de modulacao e (m)=Am/Ac ]
Amplitude_Sinal_Portadora = Amplitude_Sinal_Mensagem/m; 
fc = 10*fm;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot do Sinal de Mensagem
Message_Signal = Amplitude_Sinal_Mensagem*sin (2*pi*fm*t);
subplot (3,1,1);
plot (t,Message_Signal,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal de mensagem', ...
    'Interpreter','LaTex','FontSize',18);
legend ('sinal de Mensagem');

% Plot da Portadora
Sinal_Portadora = sin (2*pi*fc*t);
subplot (3,1,2);
plot (t,Sinal_Portadora,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal da Portadora', ...
    'Interpreter','LaTex','FontSize',18);
legend ('portadora');

% Representacao do Sinal DSB-SC 
DSBSC_Sinal=Amplitude_Sinal_Portadora*m.*sin (2*pi*fm*t).*sin (2*pi*fc*t);
subplot (3,1,3);
plot (t,DSBSC_Sinal,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal DSB-SC', ...
    'Interpreter','LaTex','FontSize',18);
legend ('sinal DSB-SC');

%=-=-=-=-=-=-=-=-=-=-=-= Modulacao AM =-=-=-=-=-=-=-=-=-=-=-=-==-=-=
% define o indice de modulacao AM manualmente
%m=1.2; %1 % 0.2

% Sinal de Modulacao
Am=5;                   % amplitude do sinal de modulacao
fa=2000;                % frequencia do sinal de modulacao
Ta=1/fa;                % periodo de tempo do sinal de modulacao
ym=Am*sin(2*pi*fa*t);   % sinal de modulacao
figure()
subplot(3,1,1); 
plot(t,ym,'k','LineWidth',2), grid minor;   % plot do sinal de modulacao
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal de Modulacao AM', ...
    'Interpreter','LaTex','FontSize',18);
legend ('sinal de modulacao');

% Sinal da Portadora
Ac=Am/m; %amplitude da portadora [onde, indice de modulacao e (m)=Am/Ac ]
fc=fa*10;%frequencia da portadora
Tc=1/fc; %periodo de tempo da portadora
yc=Ac*sin(2*pi*fc*t); % sinal da portadora
subplot(3,1,2);
plot(t,yc,'k','LineWidth',2), grid minor; %plot da portadora
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal da Portadora', ...
    'Interpreter','LaTex','FontSize',18);
legend ('portadora');

% Modulacao AM
y=Ac*(1+m*sin(2*pi*fa*t)).*cos(2*pi*fc*t); 
subplot(3,1,3);
plot(t,y,'k','LineWidth',2);
xlabel('tempo(s)','Interpreter','LaTex','FontSize',12)
ylabel('amplitude','Interpreter','LaTex','FontSize',12)
title('Sinal Modulado em Amplitude', ...
    'Interpreter','LaTex','FontSize',18);
legend ('modulacao AM');
grid minor;