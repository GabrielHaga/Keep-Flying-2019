%% Cria struct mortes
mortes = struct;
%% Motivos das Mortes
% Geometria
mortes.geometria = 0;

%Aerodin�mica
mortes.Reynolds = 0;
mortes.estol_ponta = 0;

%Estabilidade est�tica
mortes.ME = 0;
mortes.alfa_trim = 0;
mortes.def_trim_prof = 0;
mortes.Cl_Beta = 0;
mortes.Cn_Beta = 0;
%Desempenho

%Estruturas
mortes.xmotor = 0;

%Estabilidade din�mica
%Por ora din�mica n�o mata
mortes.roll = 0;
mortes.espiral = 0;
mortes.dutch_roll = 0;
mortes.fugoide = 0;
mortes.curto_periodo = 0;