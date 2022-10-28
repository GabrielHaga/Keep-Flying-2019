%% Cria struct constantes
const = struct;
%% Estabelece as constantes
const.D_tp = 0.11;              %[m] Diametro da roda do trem de pouso
const.D_bq = 0.11;              %[m] Diametro da roda da bequilha
const.rho = 1.1170;             %[kg/m^3] Massa especifica do Ar
const.visc = 1.846 * 1e-5;      %[Pa*s] Viscosidade dinamica do ar
const.pista = 60;               %[m] Comprimento da pista
const.mi = 0.1;                 %[-] Coeficiente de atrito da pista
const.gama_limite = 3;          %[�] Angulo de subida m�nimo
const.massa_minima = 7;         %[kg] MTOW minimo aceito
const.g = 9.8;                  %[m/s^2] Aceleracao da gravidade
const.e_rodas = 8e-3;           %[m] Espessura das rodinhas do trem de pouso e bequilha
const.d_motor = .2;				%[m] Distancia em x fixa do eixo do motor ate o BA (com folga)
const.n_max = 2.5;              %[-] Fator de carga maximo

const.x_motor = 0.16;           %[m] Distancia (em x) que o motor ocupa
const.D_helice = 13*0.0254;     %[m] Diametro da helice
const.dist_helice_chao = 0.03;  %[m] Minima distancia da helice ao chão

const.d_carga = 7870*0.7;       %[kg/m^3] Densidade da carga
const.y_max_comp = 0.7;         %[m] Tamanho m�ximo em Y do compartimento de carga
const.z_min_comp = 0.05;        %[m] Tamanho m�nimo em Z do compartimento de carga

%% Massas e Inercia %%
const.D_rodinhas = 0.11;
const.dens_balsa=73.5;   %164.4736842;                                      %densidade da balsa [kg/m^3]
const.dens_divinycell=60;  %51.87260089;                                    %densidade do divinycell   [kg/m^3]
const.dens_carbono=1600;  %1021.390742;                                     %densidade do carbono   [kg/m^3]
const.dens_aluminio=2810;                                                   %densidade do aluminio  [kg/m^3]
const.dens_ent=0.026858304;                                                 %densidade do material usado na entelagem [kg/m^2]                    (EM �REA)
const.dens_tubinho=1564.2051;                                               %densidade do tubinho de carbono  [kg/m^3]
const.E_balsa1=2.04;   %3.4;                                                %E da balsa no sentido da fibra (GPa)
const.E_balsa2=0.028;                                                       %E da balsa normal � fibra (GPa)
const.E_divinycell=0.075;                                                   %E do divinycell (GPa)
const.E_carbono1= 51.1;  %70;                                               %E do carbono no sentido da fibra (GPa)
const.E_carbono2=51.1;   %70;                                               %E do carbono no sentido normal � fibra (GPa)
const.E_aluminio=71.1;                                                      %E do alum�nio (GPa)
const.G_balsa1=1200;                                                        %G da balsa no sentido da fibra (MPa)
const.G_balsa2=10;                                                          %G da balsa normal � fibra (MPa)
const.G_divinycell=20;                                                      %G do divinycell (MPa)
const.G_carbono1=5000;                                                      %G do carbono no sentido da fibra (MPa)
const.G_carbono2=5000;                                                      %G do carbono normal � fibra (MPa)
const.G_aluminio=26900;                                                     %G do alum�nio (MPa) 
const.comp_balsa1=12.6;                                                     %sigma_comp da balsa no sentido da fibra (MPa)
const.comp_balsa2=0.7;                                                      %sigma_comp da balsa normal � fibra (MPa)
const.comp_divinycell=0.9;                                                  %sigma_comp do divinycell (MPa)
const.comp_carbono1=400;   %570;                                            %sigma_comp do carbono no sentido da fibra (MPa)
const.comp_carbono2=400;   %570;                                            %sigma_comp do carbono normal � fibra (MPa)
const.comp_aluminio=572;                                                    %sigma_comp do aluminio (MPa)
const.tra_balsa1=14.3;                                                      %sigma_tra da balsa no sentido da fibra (MPa)
const.tra_balsa2=0.8;                                                       %sigma_tra da balsa normal � fibra (MPa)
const.tra_divinycell=1.8;                                                   %sigma_tra do divinycell (MPa)
const.tra_carbono1=450;   %600;                                             %sigma_tra do carbono no sentido da fibra (MPa)
const.tra_carbono2=450;   %600;                                             %sigma_tra do carbono normal � fibra (MPa)
const.tra_aluminio=572;                                                     %sigma_tra do aluminio (MPa)
const.tau_balsa1=3.1;                                                       %tau da balsa no sentido da fibra (MPa)
const.tau_balsa2=3.1;                                                       %tau da balsa normal � fibra (MPa)
const.tau_divinycell=0.76;                                                  %tau do divinycell (MPa)
const.tau_carbono1=60;                                                      %tau do carbono no sentido da fibra (MPa)
const.tau_carbono2=60;                                                      %tau do carbono normal � fibra (MPa)
const.tau_aluminio=331;                                                     %tau do aluminio (MPa)
%const.m_servo=;                                                             %massa do servo (kg)
const.m_helice=0.0538;                                                      %massa da h�lice (kg)
const.m_tanque=0.0305;                                                      %massa do tanque (kg)
const.m_carga = 18;             %[kg] Massa fixa de carga
const.m_lastro = 6;             %[kg] Massa fixa de lastro
const.m_motor = 731e-3;         %[kg] Massa do motor OS 61
const.m_tanque = 30e-3;         %[kg] Massa do tanque de combustivel
const.m_helice = 50e-3;         %[kg] Massa da helice