function [aviao] =  estab_Analise_dinamica_longitudinal (aviao, const, estab)
% Este programa utiliza o m�todo proposto em COOK que atrav�s de um sistema
% escrito na forma de espa�o de estados obt�m as fun��es de transfer�ncia
% das vari�veis que caracterizam o modo longitudinal: (obs: e = equil�brio)
% u - Varia��o da velocidade de equi. Ue paralela ao eixo x do eixo do corpo;
% w - Varia��o da velocidade " We paralela ao eixo z do eixo do corpo;
% q - velocidade de arfagem do avi�o;
% theta - varia��o do �ngulo de atitude do avi�o theta_e;
% alfa - varia��o do �ngulo de ataque de equil�brio (trim) do avi�o(alfa_e);
% gama - �ngulo de trajet�ria do avi�o, que em cruzeiro � nulo.

%Os coeficientes das matrizes est�o na forma concisa (explicada no Cook na
%sess�o 4.4.2) e resumidas no ap�ndice 2.

% Um sistema descrito no formato de espa�os de estados � descrito da
% seguinte maneira: x'(t) = Ax(t) + Bu(t) e y(t) = Cx(t) + Du(t)
%Sendo x(t) as vari�veis de estado; x'(t) suas derivadas; y(t) a sa�da do
%sistema; e u(t) a entrada do sistema.
%Em nosso caso x(t) = [u w q theta] x'(t) = [u' w' q' theta']
%u(t) = [N T] e y(t) = x(t)
% As matrizes A, B, C e D est�o detalhadas no cap�tulo 5 do COOK

%m�os a obra
g = const.g;
m = aviao.MTOW;
V = aviao.V_cruz;

%primeiramente, vamos definir os coeficientes;

%Derivadas_de_estabilidade; %Esse script calcula todos as derivadas de
%estabilidade

%Coeficientes na forma concisa:     obs:formulas com ok j� foram revisadas     
Iy = estab.Iy;
xu = estab.Xu/m + estab.Xw_p*estab.Zu/(m^2 - m*estab.Zw_p);         %ok
zu = estab.Zu/(m - estab.Zw_p);                         %ok
mu = estab.Mu/Iy + estab.Zu*estab.Mw_p/(Iy*(m - estab.Zw_p));       %ok 
xw = estab.Xw/m + estab.Xw_p*estab.Zw/(m^2 - m*estab.Zw_p);         %ok
zw = estab.Zw/(m - estab.Zw_p);                         %ok
mw = estab.Mw/Iy + estab.Zw*estab.Mw_p/(Iy*(m - estab.Zw_p));       %ok 
xq = (estab.Xq - m*estab.We)/m + (estab.Zq + m*estab.Ue)*estab.Xw_p/(m^2 -m*estab.Zw_p); %ok
zq = (estab.Zq + m*estab.Ue)/(m - estab.Zw_p);                %ok
mq = estab.Mq/Iy + (estab.Zq + m*estab.Ue)*estab.Mw_p/(Iy*(m - estab.Zw_p));%ok
theta = estab.theta;
xtheta = -g*cos(theta) - estab.Xw_p*g*sin(theta)/(m - estab.Zw_p); %ok
ztheta = -m*g*sin(theta)/(m - estab.Zw_p);        %ok 
mtheta = -estab.Mw_p*m*g*sin(theta)/(Iy*(m - estab.Zw_p));%ok
%derivadas de controle
xN = estab.XN/m + estab.Xw_p*estab.ZN/(m^2 - m*estab.Zw_p);         %ok
zN = estab.ZN/(m - estab.Zw_p);                         %ok
mN = estab.MN/Iy + estab.Mw_p*estab.ZN/(Iy*(m - estab.Zw_p));       %ok
xt = 0;%Xt/m + Xw_p*Zt/(m^2 - m*Zw_p);         %ok
zt = 0;%Zt/(m - Zw_p);                         %ok
mt = 0;%Mt/m + Mw_p*Zt/(Iy*(m - Zw_p));        %ok

%Defini��o da matriz A

A = [xu xw xq xtheta;
     zu zw zq ztheta;
     mu mw mq mtheta;
     0  0  1  0     ];
%Defini��o da matriz B
B = [xN xt;
     zN zt;
     mN mt;
     0  0 ];
% A matriz C, quando queremos apenas avaliar u w q e theta � a matriz
% identidade, uma vez que y(t) = x(t). Por�m, iremos aumentar a matriz C,
% pois tamb�m vamos analisar as vari�veis �ngulo de ataque e �ngulo de
% trajet�ria. Fazendo alfa = w/V e gama =  theta - alfa = theta - w/V
  
C = [1  0   0 0;
     0  1   0 0;
     0  0   1 0;
     0  0   0 1;
     0  1/V 0 0;
     0 -1/V 0 1];
   
%Defini��o da matriz D
D = zeros(6,2);

%Defini��o do denominador da fun��o de transfer�ncia que � comum a todas as
%variaveis

[~,den] = ss2tf(A,B,C,D,1); %determina o numerador e o denominador das fun��es de trans, em rela��o �
%entrada do profundor.

%Calculo dos amortecimentos, frequ�ncias naturais e constante de tempo
%Delta_s = [a b c d e];

[omega_n, zeta] = damp(tf(1,den));

Wn_curtoperiodo = omega_n(1);
    for i = 1:length(omega_n)
        if(omega_n(i) <= Wn_curtoperiodo)
           Wn_curtoperiodo = omega_n(i);
           Zeta_curtoperiodo = zeta(i);
           tau_curtoperiodo = 1./(zeta(i).*omega_n(i));
        else
           Wn_fugoide = omega_n(i);
           Zeta_fugoide = zeta(i);
           tau_fugoide = 1./(zeta(i).*omega_n(i));
        end
    end
    
    if (Wn_fugoide > Wn_curtoperiodo)
        tmp1 = Wn_fugoide;
        tmp2 = Zeta_fugoide;
        tmp3 = tau_fugoide;
%         Wn_fugoide = Wn_curtoperiodo;
%         Zeta_fugoide = Zeta_curtoperiodo;
        tau_fugoide = tau_curtoperiodo;
        Wn_curtoperiodo = tmp1;
        Zeta_curtoperiodo = tmp2;
        tau_curtoperiodo = tmp3;
    end
    
    Wn_fugoide = sqrt(-g*zu/Ue);
    Zeta_fugoide = -xu/(2*Wn_fugoide);

aviao.Zeta_curtoperiodo = Zeta_curtoperiodo;
aviao.Zeta_fugoide = Zeta_fugoide;
aviao.Wn_curtoperiodo = Wn_curtoperiodo;
aviao.Wn_fugoide = Wn_fugoide;
aviao.tau_curtoperiodo = tau_curtoperiodo;
aviao.tau_fugoide = tau_fugoide;
end

% %Analise no simulink
% %primeiro, temos que definir todas as fun��es de tranfer�ncia.
% %Vamos obter a matriz fun��o de transfer�ncia, ou seja, na primeira posi��o
% %teremos a fun��o de transfer�ncia U(s)/N(s), na posi��o 2x1 teremos 
% %w(s)/N(s) e assim por diante
% tempo = 0; %instante onde aparece o degrau
% t = 20;
% N = 1/57.3;      %amplitude da deflex�o do profundor
% K = 57.3;    %constante que passa de rad pra graus na sa�da dos blocos
% 
% 
% num1 = num(1,:);
% num2 = num(2,:);
% num3 = num(3,:);
% num4 = num(4,:);
% num5 = num(5,:);
% num6 = num(6,:);
% 
% sim('simulacao')
% 
% subplot(2,1,1)
% plot (tout,u,tout,w)
% grid on
% xlabel('tempo [s]')
% ylabel('velocidades u e w [m/s]')
% legend ('varia��o da velocidade longitudinal','varia��o da velocidade vertical')
% 
% subplot(2,1,2)
% plot(tout,theta,tout,alfa,tout,gama)
% xlabel ('tempo [s]')
% ylabel ('�ngulos de atitude, ataque e subida [�]')
% legend ('\theta', '\alpha', '\gamma')
% grid on
% 
% figure (2)
% plot(tout,q)
% grid on
% xlabel ('tempo [s]')
% ylabel ('arfagem q [�/s]')