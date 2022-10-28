function [ Z ] = PerfilSecao( perfil_center_1,perfil_center_2,Mc)
%Acha o eixo Z de acordo com o perfil e a corda ao longo da se��o
%Mc � a matriz com as cordas ao longo da se��o
%% Ajusta os vetores
pc1 = perfil_center_1(:);
pc2 = perfil_center_2(:);
%% Acha o tamanho das matrizes
%lx = size(Mx,2);
lc = size(Mc,2); % n�mero de colunas de Mc
comp_c = size(Mc,1); % n�mero de linhas de Mc

%% Acha os pontos Z da se��o
% a = linspace(perfil_center_1,perfil_center_2,lc);
% M_perfis = repmat(a,1,comp_c);
vi = repmat(pc1,1,lc); %Vetoriza��o dos linspaces
vf = repmat(pc2,1,lc);
a = repmat(linspace(0,1,lc),comp_c,1);
M_perfis = vi + (vf-vi).*a;

Z = Mc.*M_perfis;


end

