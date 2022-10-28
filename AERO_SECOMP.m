function coef = AERO_SECOMP (run,geom,geom_malha,geom_painel,infl)
c_root = geom_malha(1).chord; 
xCG = run.xCG;% xCG = reshape(linspace(c_root(1)*.2,c_root(1)*.4,5),1,1,[]);
B = infl.B; C = infl.gamma; W=B*C;
numel_old = 0;
CL_t = 0; CD_t = CL_t; CM_t = CL_t;
for i=1:2
    
    panels_b = sum(not(isnan(diff(geom_malha(i).X(1,:))))); panels_c = length(geom_malha(i).X(:,1))-1;
    numel_ac = numel_old + panels_b*panels_c;
    
    V_STRGH=reshape(C(numel_old+1:numel_ac),panels_b,panels_c); V_STRGH=V_STRGH';
    DELTA_V_STRGH=[V_STRGH(1,:);diff(V_STRGH)];
    dy=diff(geom_malha(i).Y(1:panels_c,:),1,2); dy(isnan(dy))=[]; dy=reshape(dy,panels_c,panels_b);
    
    L=DELTA_V_STRGH.*dy*run.rho*run.Q;
    l=DELTA_V_STRGH*run.rho*run.Q;
    CL=sum(sum(DELTA_V_STRGH.*dy/(.5*run.Q*geom.S)));
    
    w_ind=reshape(W(numel_old+1:numel_ac),panels_b,panels_c); w_ind=w_ind';
    D=abs(run.rho*w_ind.*DELTA_V_STRGH.*dy);
    d=abs(run.rho*w_ind.*DELTA_V_STRGH);
    CD=sum(sum(-w_ind.*DELTA_V_STRGH.*dy/(.5*run.Q^2*geom.S)));
    
    CVX=(geom_painel.C1X(numel_old+1:numel_ac)+geom_painel.C2X(numel_old+1:numel_ac))/2; CVX=reshape(CVX,panels_b,panels_c); CVX=repmat(CVX',1,1,length(xCG))-repmat(xCG,size(CVX,2),size(CVX,1),1);
    CVY=(geom_painel.C1Y(numel_old+1:numel_ac)+geom_painel.C2Y(numel_old+1:numel_ac))/2; CVY=reshape(CVY,panels_b,panels_c); CVY=CVY';
    CVZ=(geom_painel.C1Z(numel_old+1:numel_ac)+geom_painel.C2Z(numel_old+1:numel_ac))/2; CVZ=reshape(CVZ,panels_b,panels_c); CVZ=CVZ'-geom.offset_Z;
    CM_L=-squeeze(sum(sum((CVX.*repmat(L,1,1,length(xCG)))/(.5*run.rho*run.Q^2*geom.S*geom.MAC))));
    CM_D=sum(sum(CVZ.*D))/(.5*run.rho*run.Q^2*geom.S*geom.MAC); CM_D = 0;
    CM = CM_L+repmat(CM_D,length(xCG),1);
    
%     Cm_L=-sum((CVX.*l))./(.5*run.rho*run.Q^2*geom_malha(i).chord*geom.MAC);
%     Cm_D=sum(CVZ.*d)./(.5*run.rho*run.Q^2*geom_malha(i).chord*geom.MAC);
%     Cm = Cm_L'+Cm_D';
    
    Cl = transpose(sum( l )./(.5*run.rho*run.Q^2*geom_malha(i).chord));
    
%     CL = (run.sym+1) * CL; CD = (run.sym+1) * CD; CM = (run.sym+1) * CM;
%     if run.sym
%         L = [fliplr(L),L]; D = [fliplr(D), D]; Cl = [flipud(Cl);Cl];
%     end
    numel_old = numel_ac;
    coef(i) = struct('CL',CL,'CD',CD,'CM',CM,'L',L,'D',D,'Cl',Cl,'l',l,'CVX',CVX,'CVY',CVY);
    CL_t = CL_t + CL;
    CD_t = CD_t + CD;
    CM_t = CM_t + CM;

end
coef(i+1) = struct('CL',CL_t,'CD',CD_t,'CM',CM_t,'L',[],'D',[],'Cl',[],'l',[],'CVX',[],'CVY',[]);
end

