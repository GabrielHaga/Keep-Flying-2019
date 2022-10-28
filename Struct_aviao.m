%% Struct para 4 se��es

%% Cria struct aviao
aviao = struct;
%% Booleano de Morte
aviao.morte=0;
%% Parametros de Chute
aviao.chute='-----CHUTES-----';
numSec = 4;
%Asa
aviao.b = 0;                    %[m] Envergadura da asa
aviao.fb = zeros(1, numSec - 1);           %[m] Vetor com fra��es de envergadura
aviao.AR = 0;                   %[-] Raz�o de aspecto
aviao.i_w = 0;                  %[�] Incid�ncia na raiz
aviao.t = zeros(1, numSec);         %[-] Vetor de taper em cada se��o
aviao.l = zeros(1, numSec);         %[] Vetor enflechamento
aviao.tw = zeros(1, numSec);        %[�] Vetor de twist
aviao.d = zeros(1, numSec);         %[] Vetor de diedro em cada se��o
aviao.perfil = zeros(1, numSec + 1); %[-] Vetor de perfis em cada se��o
aviao.h_BA = 0;                 %[m] Altura do BA da asa

%Cauda
numSec = 2;
aviao.d_BF_BA_x = 0;            %[m] Dist�ncia do BF da asa ao BA da cauda em x
aviao.d_BF_BA_z = 0;            %[m] Dist�ncia do BF da asa ao BA da cauda em z
aviao.c_root_EH = 0;            %[m] Corda na raiz da EH
aviao.t_EH = zeros(1, numSec);            %[-] Vetor de taper em cada se��o da EH
aviao.fb_EH = 0;
aviao.b_EH = 0;                 %[m] Envergadura da EH
aviao.i_EH = 0;                 %[�] Incid�ncia da EH
aviao.f_prof = 0;               %[-] Fra��o de corda atu�vel da EH
aviao.perfil_EH = 0;            %[-] Perfil da EH

aviao.f_x_cg = 0;               %[-] Posi��o do CG em x/c_root

%% Geometria
aviao.geometria='-----GEOMETRIA-----';
aviao.num_secoes = 4;           %[-] N�mero de se��es da asa
aviao.MAC = 0;                  %[m] Corda M�dia Aerodin�mica
aviao.MAC_EH = 0;
aviao.S = 0;                    %[m^2] �rea da asa
aviao.c = [];      %[m] Vetor das cordas de cada se��o
aviao.c_EH = 0;
aviao.comp = 0;
aviao.b_sec = [];%[m] Vetor com as semi-envergaduras de cada se��o
aviao.b_sec_EH = [];
aviao.S_EH = 0;                 %[m^2] �rea da EH
aviao.inc_tb = 0;
aviao.flag_geom = 0;
aviao.vetor_lv = [];
aviao.vetor_zmax = [];
aviao.l_meia = 0;
aviao.l_BA = 0;
aviao.xCG = 0;
aviao.d_BA_motor = 0;
aviao.flag_geom = 0;
%% Aerodinamica
aviao.aerodinamica='-----AERODINAMICA-----';
aviao.CL_0 = 0;                 %[-] CL para alfa = 0
aviao.CL_0_solo = 0;            %[-] CL para alfa = 0 em solo
aviao.CL_alfa = 0;              %[1/�] CL_alfa
aviao.CL_alfa_solo = 0;         %[1/�] CL_alfa em solo
aviao.CL_def = 0;               %[1/�] Derivada do CL c/ rela��o a deflex�o do profundor
aviao.CL_def_solo = 0;          %[1/�] Derivada do CL c/ rela��o a deflex�o do profundor em solo
aviao.CL_max = 0;
aviao.CM_0 = 0;                 %[-] CM para alfa = 0
aviao.CM_0_solo = 0;            %[-] CM para alfa = 0 em solo
aviao.CM_alfa = 0;              %[1/�] CM_alfa em rela��o ao CG
aviao.CM_alfa_solo = 0;         %[1/�] CM_alfa em solo
aviao.CM_def = 0;               %[1/�] Derivada do CM c/ rela��o a deflex�o do profundor
aviao.CM_def_solo = 0;          %[1/�] Derivada do CM c/ rela��o a deflex�o do profundor em solo
aviao.CD_0 = 0;                 %[-] CD para alfa = 0
aviao.CD_0_solo = 0;            %[-] CD para alfa = 0 em solo
aviao.CD_alfa = 0;              %[1/�] CD_alfa
aviao.CD_alfa_solo = 0;         %[1/�] CD_alfa em solo
aviao.CD_def = 0;               %[1/�] Derivada do CD c/ rela��o a deflex�o do profundor
aviao.CD_def_solo = 0;          %[1/�] Derivada do CD c/ rela��o a deflex�o do profundor em solo
aviao.alfa_estol = 0;           %[�] Alfa de estol em voo
aviao.alfa_estol_solo = 0;      %[�] Alfa de estol em solo
aviao.def_max = 0;              %[�] Deflex�o m�xima do profundor
aviao.CARGAS_PACK = 0;
aviao.c_y = [];
aviao.y = [];

%% Estabilidade
aviao.estabilidade='-----ESTABILIDADE-----';
aviao.ME = 0;
aviao.alfa_trim = 0;            %�ngulo de ataque para trimar o avi�o sem considerar motor
aviao.alfa_trim_motor = 0;
aviao.bv = 0;                   %Envergadura da EV
aviao.cv_root = 0;              %Corda na raiz da EV
aviao.cv_ponta = 0;
aviao.S_EV = 0;
aviao.AR_EV = 0;
aviao.lv = 0;                   %Dist�ncia do CG ao CA da EV em X
aviao.zv = 0;                   %Dist�ncia do CG ao CA da EV em Z
aviao.Cl_beta = 0;              %[1/�] Derivada de momento / eixo X
aviao.Cn_beta = 0;              %[1/�] Derivada de momento / eixo Z
aviao.v_ev = 0;                 %[-] "Volume" da EV
aviao.v_eh = 0;                 %[-] "Volume" da EH
aviao.l_EH = 0;
aviao.V_cruz = 0;
aviao.T_cruz = 0;
aviao.CM_0_motor = 0;

%% Desempenho
aviao.desempenho='-----DESEMPENHO-----';
aviao.MTOW = 0;               %[kg] Massa total levantada

%% Estruturas
aviao.estruturas='-----ESTRUTURAS-----';
aviao.ix = 0;                   % Momento de in�rcia em rela��o ao eixo X do CG
aviao.iy = 0;                   % Momento de in�rcia em rela��o ao eixo Y do CG
aviao.iz = 0;                   % Momento de in�rcia em rela��o ao eixo Z do CG
aviao.ixz = 0;                  % Produto de in�rcia em rela��o ao plano XY e o CG
aviao.ixy = 0;                  % Produto de in�rcia em rela��o ao plano XY e o CG
aviao.iyz = 0;                  % Produto de in�rcia em rela��o ao plano XY e o CG
aviao.x_motor = 0;               % Posi��o X do motor
aviao.z_motor = 0;
aviao.zCG = 0;

aviao.PV = 0;                   %[kg] Peso vazio
aviao.CP = 0;                   %[kg] Carga paga
aviao.ee = 0;
aviao.pontuacao = 0;            %[kg] Pontua��o
