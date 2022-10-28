%% Struct para 4 se��es

%% Cria struct aviao
aviao = struct;
%% Booleano de Morte
aviao.morte=0;
%% Parametros de Chute
aviao.chute='-----CHUTES-----';

%Asa
aviao.b = 0;                    %[m] Envergadura da asa
aviao.fb = [0, 0, 0];           %[m] Vetor com fra��es de envergadura
aviao.AR = 0;                   %[-] Raz�o de aspecto
aviao.i_w = 0;                  %[�] Incid�ncia na raiz
aviao.t = [0, 0, 0, 0];         %[-] Vetor de taper em cada se��o
aviao.l = [0, 0, 0, 0];         %[] Vetor enflechamento
aviao.tw = [0, 0, 0, 0];        %[�] Vetor de twist
aviao.d = [0, 0, 0, 0];         %[] Vetor de diedro em cada se��o
aviao.perfil = [0, 0, 0, 0, 0]; %[-] Vetor de perfis em cada se��o
aviao.h_BA = 0;                 %[m] Altura do BA da asa

%Cauda
aviao.d_BF_BA_x = 0;            %[m] Dist�ncia do BF da asa ao BA da cauda em x
aviao.d_BF_BA_z = 0;            %[m] Dist�ncia do BF da asa ao BA da cauda em z
aviao.c_root_EH = 0;            %[m] Corda na raiz da EH
aviao.t_EH = [0, 0];            %[-] Vetor de taper em cada se��o da EH
aviao.b_EH = 0;                 %[m] Envergadura da EH
aviao.i_EH = 0;                 %[�] Incid�ncia da EH
aviao.f_prof = 0;               %[-] Fra��o de corda atu�vel da EH
aviao.perfil_EH = 0;            %[-] Perfil da EH

aviao.f_x_cg = 0;               %[-] Posi��o do CG em x/c_root

%% Geometria
aviao.geometria='-----GEOMETRIA-----';
aviao.num_secoes = 4;           %[-] N�mero de se��es da asa
aviao.MAC = 0;                  %[m] Corda M�dia Aerodin�mica
aviao.S = 0;                    %[m^2] �rea da asa
aviao.c = [0, 0, 0, 0, 0];      %[m] Vetor das cordas de cada se��o
aviao.S_EH = 0;
aviao.vetor_lv = [];
aviao.vetor_zmax = [];
aviao.b_sec = [];               %[m] Meia envergadura de cada se��o
aviao.xCG = 0;
aviao.origem_cone = [];

%% Aerodinamica
aviao.aerodinamica='-----AERODINAMICA-----';
aviao.CL_0 = 0;                 %[-] CL para alfa = 0
aviao.CL_0_solo = 0;            %[-] CL para alfa = 0 em solo
aviao.CL_alfa = 0;              %[1/rad] CL_alfa
aviao.CL_alfa_solo = 0;         %[1/rad] CL_alfa em solo
aviao.CL_def = 0;               %[1/rad] Derivada do CL c/ rela��o a deflex�o do profundor
aviao.CL_def_solo = 0;          %[1/rad] Derivada do CL c/ rela��o a deflex�o do profundor em solo
aviao.CM_0 = 0;                 %[-] CM para alfa = 0
aviao.CM_0_solo = 0;            %[-] CM para alfa = 0 em solo
aviao.CM_alfa = 0;              %[1/rad] CM_alfa em rela��o ao CG
aviao.CM_alfa_solo = 0;         %[1/rad] CM_alfa em solo
aviao.CM_def = 0;               %[1/rad] Derivada do CM c/ rela��o a deflex�o do profundor
aviao.CM_def_solo = 0;          %[1/rad] Derivada do CM c/ rela��o a deflex�o do profundor em solo
aviao.CD_0 = 0;                 %[-] CD para alfa = 0
aviao.CD_0_solo = 0;            %[-] CD para alfa = 0 em solo
aviao.CD_alfa = 0;              %[1/rad] CD_alfa
aviao.CD_alfa_solo = 0;         %[1/rad] CD_alfa em solo
aviao.CD_def = 0;               %[1/rad] Derivada do CD c/ rela��o a deflex�o do profundor
aviao.CD_def_solo = 0;          %[1/rad] Derivada do CD c/ rela��o a deflex�o do profundor em solo
aviao.alfa_estol = 0;           %[�] Alfa de estol em voo
aviao.alfa_estol_solo = 0;      %[�] Alfa de estol em solo
aviao.def_max = 0;              %[�] Deflex�o m�xima do profundor

%% Estabilidade
aviao.estabilidade='-----ESTABILIDADE-----';
aviao.alfa_trim = 0;
aviao.bv = 0;
aviao.cv_root = 0;
aviao.lv = 0;                   
aviao.Cl_beta = 0;              %[1/�] Derivada de momento / eixo X
aviao.Cn_beta = 0;              %[1/�] Derivada de momento / eixo Z
aviao.v_ev = 0;                 %[-] "Volume" da EV
aviao.v_eh = 0;                 %[-] "Volume" da EH
aviao.S_ev = 0;
aviao.CL_alfa_EV = 0;

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
aviao.xmotor = 0;               % Posi��o X do motor
aviao.zmotor = 0;

aviao.PV = 0;                   %[kg] Peso vazio
aviao.CP = 0;                   %[kg] Carga paga
aviao.Pontuacao = 0;            %[kg] Pontua��o
