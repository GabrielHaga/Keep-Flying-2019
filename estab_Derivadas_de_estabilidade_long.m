function [estab] = estab_Derivadas_de_estabilidade_long (aviao, const, estab)
%% Nesse scripit est�o todas as vari�veis necess�rias para calcular as
%derivadas de estabilidade, al�m dos c�lculos da mesma;
%De acordo com a abordagem do COOK, as equa��es de movimento s�o dadas utilizando-se os eixos do corpo. 
%Os calculos dos coeficientes aerodin�micos, s�o dados em rela��o ao
%eixo do vento. Logo � necess�rio uma convers�o de um eixo pra outro.

%% Carregar valores importantes

%constantes ou par�metros importantes

%acelera��o da gravidade [m/s^2]
%g = const.g; 
%massa total do avi�o [kg]
%m = aviao.MTOW;
%Velocidade do avi�o (eixo x do vento) [m/s]
V = aviao.V_cruz;
%Densidade do ar [kg/m�]
rho = const.rho;
zmotor = aviao.zmotor;

%Informa��es geom�tricas e aerodin�micas da asa (ou avi�o)
%Area [m^2]
S = aviao.S;
%AR da asa
AR = aviao.AR;
%altura do cg [m]
zCG = aviao.zCG;
%Corda m�dia aerodin�mica [m]
mac = aviao.MAC;

%eficiencia
e = aviao.oswald;

%Coeficiente de sustenta��o para �ngulo de ataque nulo
CL0 = aviao.CL_0;
%Derivada do coeficiente de sustenta��o em rela��o ao �ngulo de ataque [1/rad]
CL_alfa = aviao.CL_alfa;

%Coeficiente de arrasto para �ngulo de ataque nulo
CD0 = aviao.CD_parasita;
%Derivada do coeficiente de sustenta��o em rela��o ao �ngulo de ataque [1/rad]
%CD_alfa = aviao.CD_alfa;

%Coeficiente de momento para �ngulo de ataque nulo
%CM0 = aviao.CM0_new;
%Derivada do coeficiente de momento em rela��o ao �ngulo de ataque [1/rad]
CM_alfa = aviao.CM_alfa;
%�ngulo de ataque de trimagem [rad]
alfa_trim = aviao.alfa_trim_motor;

%deflex�o do profundor para acondi��o analsada [�] 
delta = 0;
delta = delta/57.3;
%�ngulo de atitude de trimagem [rad]
theta = alfa_trim; %quando o �ngulo de trajet�ria, gama, � igual a zero, pois gama = theta - alfa

%Derivada do coefieciente de arrasto em rela��o � deflex�o do profundor [1/rad]
CD_N = aviao.CD_def;  %Nota: Saber se est� admensionalizado em rela��o � area da asa
%Derivada do coeficiente de sustenta��o em rela��o � deflex�o do profundor [1/rad]
CL_N = aviao.CL_def; %Idem
%Derivada do coeficiente de momento em rela��o � deflex�o do profundor [1/rad]
Cm_N = aviao.CM_def;
%Coeficiente de sustenta��o em cruzeiro
CL = CL0 + CL_alfa*alfa_trim + CL_N*delta;  %aqui � necess�rio adicionar o CL dado pela deflex�o
%Coeficiente de arrasto em cruzeiro
%CD = CD0 + CD_alfa*alfa_trim + CD_N*delta;
CD = CD0 + (CL^2)/(pi*e*AR) + CD_N*delta;
CD_alfa = 2*CL*CL_alfa/(pi*e*AR);

%Velocidades do avi�o no eixo do corpo [m/s]
Ue = V*cos(alfa_trim);
We = V*sin(alfa_trim);

%Momento de inercia do avi�o em rela��o ao eixo do corpo [kgm�]

Iy = aviao.iy;

%Dados da tra��o do motor
%T = (-0.011365*(v + vento)^2 - 0.639420*(v + vento) + 34.695)*rho; %calculo da tra��o em fun��o da velocidade
dT_dV =  (-2*0.011365*V - 0.639420)*rho;

%Derivadas das for�as X,Z e momento M em rela��o � velocidade u
%OBS: as derivadas em rela��o a V dos coeficientes CD, CL e CM foram
%aproximados pra zero. Coeficientes com calculos feitos exclusivamente pelo
%efeito da cauda foram multiplicados por 1,1 pra contabilizar o efeito da
%asa
Xu = -rho*V*S*CD + dT_dV;
Zu = -rho*V*S*CL;                  %todos esses coefs est�o na forma dimensional
Mu = 0.5*rho*V*S*mac*(0);

%Derivadas das for�as X,Z e momento M em rela��o � velocidade w
Xw = 0.5*rho*V*S*(CL - CD_alfa);
Zw = -0.5*rho*V*S*(CD + CL_alfa);
Mw = 0.5*rho*V*S*mac*(CM_alfa);

%Derivadas das for�as X,Z e momento M em rela��o � velocidade de arfagem q
v_eh = aviao.v_eh; 
CL_alfa_eh = aviao.CL_alfa_EH;
l_eh = aviao.l_EH;
eta = 0.9;       %efici�ncia da empenagem horizontal
Xq = -0.5*rho*V*S*mac*v_eh*0.1*CD_alfa*eta;        %0.5*rho*V*S*mac*(VT*CD_alfa_tail); %considerando CD_alfa da cauda como 10% do da asa
Zq = -0.5*rho*V*S*mac*v_eh*CL_alfa_eh*eta;         %0.5*rho*V*S*mac*(VT*CL_alfa_tail);
Mq = -0.5*rho*V*S*mac*v_eh*l_eh*CL_alfa_eh;

%Derivadas das for�as X,Z e momento M em rela��o � acelera��o wponto
Xw_p = 0;                                                                    %0.5*rho*S*mac*(-1.1*VT*CD_alfa_tail*eps_alfa);
Zw_p = 0;                                                                    %0.5*rho*S*mac*(-1.1*VT*CL_alfa_tail*eps_alfa);
Mw_p = 0;                                                                    %0.5*rho*S*mac^2*(-VT*CL_alfa_tail*lt*eps_alfa/mac);

%Derivadas das for�as X,Z e momento M em rela��o � deflex�o do profundor(N)
XN = -0.5*rho*V^2*S*(CD_N);
ZN = -0.5*rho*V^2*S*(CL_N);
MN = 0.5*rho*V^2*S*mac*(Cm_N);
%Derivadas das for�as X,Z e momento M em rela��o � tra��o do motor t
Xt = 1;
Zt = 0;
Mt = -(zmotor - zCG); %%%%%%%%troquei h_motor por zmotor

%Agora faremos a convers�o para o eixo do corpo
aux1 = cos(alfa_trim);
aux2 = sin(alfa_trim);
aux3 = aux1^2; %cos(alfa)^2
aux4 = aux2^2; %sin(alfa)^2
Xu = Xu*aux3 + Zw*aux4 - (Xw + Zu)*aux1*aux2;
Xw = Xw*aux3 - Zu*aux4 + (Xu - Zw)*aux1*aux2;
Zu = Zu*aux3 - Xw*aux4 + (Xu - Zw)*aux1*aux2;
Zw = Zw*aux3 + Xu*aux4 + (Xw + Zu)*aux1*aux2;
Mu = Mu*aux1 - Mw*aux2;
Mw = Mw*aux1 + Mu*aux2;
Xq = Xq*aux1 - Zq*aux2;
Zq = Zq*aux1 + Xq*aux2;
Mq = Mq*(1);
Xw_p = Xw_p*aux3 - Zw_p*aux1*aux2;
Zw_p = Zw_p*aux3 + Xw_p*aux1*aux2;
Mw_p = Mw_p*aux1;

XN = XN*aux1 - ZN*aux2;
ZN = ZN*aux1 + XN*aux2;
MN = MN*(aux3 + aux4);

estab.Xu = Xu;
estab.Zu = Zu;
estab.Mu = Mu;
estab.Xw = Xw;
estab.Zw = Zw;
estab.Mw = Mw;
estab.Xq = Xq;
estab.Zq = Zq;
estab.Mq = Mq;
estab.Xw_p = Xw_p;
estab.Zw_p = Zw_p;
estab.Mw_p = Mw_p;
estab.XN = XN;
estab.ZN = ZN;
estab.MN = MN;
estab.theta = theta;
estab.Ue = Ue;
estab.We = We;
estab.Xt = Xt;
estab.Zt = Zt;
estab.Mt = Mt;
estab.Iy = Iy;
end