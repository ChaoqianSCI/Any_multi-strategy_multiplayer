% k=4;
% 
% hold on
% % plot([0.1:0.01:6],(k+1)./[0.1:0.01:6],'k')
% % plot([0:0.01:6],k+1+[0:0.01:6]*0,'k')
% 
% plot([0.1:0.01:6],(k+1)^2/(k+3)./[0.1:0.01:6],'k--')
% plot([0:0.01:6],(k+1)^2/(k+3)+[0:0.01:6]*0,'k--')
% 
% xlim([0 6])
% ylim([0 6])
% 
% xlabel('$r_1$','Interpreter','LaTex','fontsize',14)
% ylabel('$r_2$','Interpreter','LaTex','fontsize',14)
% 
% box on
% set(gcf,'unit','centimeters','position',[1 1 10 9])







% figure('Name','ternary demo1_1','Units','normalized','Position',[.05,.2,.42,.56])
% 
% % 初始化三元相图(Init ternary plot)
% STA1=STernary();
% 
% 
% % 设置标签文本(Set Label string)
% set(STA1,'A_Label','String','D')
% set(STA1,'B_Label','String','P')
% set(STA1,'C_Label','String','C')
% 
% 
% % % 绘制散点图(Draw scatter plot)
% % A=rand(1,20);
% % B=rand(1,20);
% % C=rand(1,20);
% % STA1.SScatter(A,B,C,40,'filled','CData',[0,0,0]);
% % legend()
% 
% 
% STA1.SScatter(0,0,100,100,'filled','CData',[0,0,0]);
% STA1.SScatter(0,100,0,100,'CData',[0,0,0],'Markerfacecolor','w');
% 
% STA1.SScatter(20,30,50,100,'filled','CData',[0,0,0]);
% STA1.SPlot([0,100,50],[2,50,60],[3,80,50],'Linewidth',4)
% 
% % 设置A轴颜色和粗细(Set A_Axis's 'Color' and 'LineWidth')
% set(STA1,'A_Axis','Color','k')
% % 设置A轴主网格颜色和粗细(Set A_Grid's 'Color' and 'LineWidth')
% set(STA1,'A_Grid','Color','w')
% % 设置A轴次网格颜色线形
% set(STA1,'A_MinorGrid','Color','w')
% % 设置A轴主刻度颜色
% set(STA1,'A_Tick','Color','w')
% % 设置A轴次刻度颜色
% set(STA1,'A_MinorTick','w')
% % % 设置A轴刻度标签字体和颜色
% % set(STA1,'A_TickLabel','Color',[0,0,.8],'FontSize',16)
% % % 设置A轴标签字体和颜色及位置以及文本内容
% % set(STA1,'A_Label','Color',[0,0,.8],'FontSize',18,'Position',[.88,.6],'String',{'Ternary plot';'by Slandarer'})
% % 






hold on
plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off




xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'k')



scatter([0:0.03:0.03*28],0,80,'ok','filled')
scatter([1:-0.03:1-0.03*4],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')


k_value=4;
r_value=3;c_value=1;
alpha_value=0.7;beta_value=0.7;
x1=0;x2=1-1/(k_value*(alpha_value+beta_value))*(-r_value*c_value/(k_value+1)+c_value+k_value*alpha_value);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1+(r_value/(k_value+1)-1)*c_value/(k_value*beta_value);x2=0;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')






% h=fill([0,1/4,1,0],[0,1/4*tan(pi/3),0,0],'r')
% set(h,'edgealpha',0,'facealpha',0.3)

text(0-0.08,0-0.01,'$P$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)













%% phase diagram peer punishment at r=2.0
hold on
box on


xlim([0 2.5])
ylim([0 1])
k=4;c=1;r=2;


alpha=[0:0.01:1];



% plot((k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha,alpha,'Color',0.95*[1,1,1],'Linewidth',3)
% plot((k+1)/(k^2+k-3)*(-r*c/(k+1)+c)+3*alpha/(k^2+k-3),alpha,'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot(BR20DE1(:,2),BR20DE1(:,1),'Color',[237,32,36]/255,'Linewidth',1)
% plot(BR20DE2(:,2),BR20DE2(:,1),'Color',[237,32,36]/255,'Linewidth',1)
% plot(BR2DCEd(:,2),BR2DCEd(:,1),'Color',[57,83,164]/255,'Linewidth',1)
% plot(BR2DCEu(:,2),BR2DCEu(:,1),'Color','k','Linewidth',1)






plot(BR20DE1(:,2),BR20DE1(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(BR20DE2(:,2),BR20DE2(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(BR2DCEd(:,2),BR2DCEd(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(BR2DCEu(:,2),BR2DCEu(:,1),'Color',0.95*[1,1,1],'Linewidth',3)

plot((k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha,alpha,'Color',[57,83,164]/255,'Linewidth',1)
plot((k+1)/(k^2+k-3)*(-r*c/(k+1)+c)+3*alpha/(k^2+k-3),alpha,'Color',[237,32,36]/255,'Linewidth',1)




xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])




%% phase diagram peer punishment at r=3.5
hold on
box on


xlim([0 0.4])
ylim([0 0.5])
k=4;c=1;r=3.5;



plot((k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha,alpha,'Color',0.95*[1,1,1],'Linewidth',3)
plot((k+1)/(k^2+k-3)*(-r*c/(k+1)+c)+3*alpha/(k^2+k-3),alpha,'Color',0.95*[1,1,1],'Linewidth',3)

plot(BR35DE1(:,2),BR35DE1(:,1),'Color',[237,32,36]/255,'Linewidth',1)
plot(BR35DE2(:,2),BR35DE2(:,1),'Color',[57,83,164]/255,'Linewidth',1)
plot(BR35DE3(:,2),BR35DE3(:,1),'Color',[237,32,36]/255,'Linewidth',1)




% plot(BR35DE1(:,2),BR35DE1(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(BR35DE2(:,2),BR35DE2(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(BR35DE3(:,2),BR35DE3(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot((k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha,alpha,'Color',[57,83,164]/255,'Linewidth',1)
% plot((k+1)/(k^2+k-3)*(-r*c/(k+1)+c)+3*alpha/(k^2+k-3),alpha,'Color',[237,32,36]/255,'Linewidth',1)


xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])




%% phase diagram pool punishment at r=2.0
hold on
box on

xlim([0 3])
ylim([0 1])
k=4;c=1;r=2;



alpha=[0:0.01:1];

plot((k+1)/2*(-r*c/(k+1)+c+alpha),alpha,'Color',0.95*[1,1,1],'Linewidth',3)
plot((k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha),alpha,'Color',0.95*[1,1,1],'Linewidth',3)

plot(r2DO1(:,2),r2DO1(:,1),'Color','k','Linewidth',1)
plot(r2DO2(:,2),r2DO2(:,1),'Color','k','Linewidth',1)
plot(r2DO3(:,2),r2DO3(:,1),'Color','k','Linewidth',1)
plot(r2Osec(:,2),r2Osec(:,1),'Color','k','Linewidth',1)
plot(r2D1(:,2),r2D1(:,1),'Color',[237,32,36]/255,'Linewidth',1)
plot(r2D2(:,2),r2D2(:,1),'Color',[237,32,36]/255,'Linewidth',1)
plot(r2Ofir(:,2),r2Ofir(:,1),'Color',[57,83,164]/255,'Linewidth',1)



% plot(r2D1(:,2),r2D1(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2D2(:,2),r2D2(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2DO1(:,2),r2DO1(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2DO2(:,2),r2DO2(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2DO3(:,2),r2DO3(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2Ofir(:,2),r2Ofir(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r2Osec(:,2),r2Osec(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% 
% 
% plot((k+1)/2*(-r*c/(k+1)+c+alpha),alpha,'Color',[57,83,164]/255,'Linewidth',1)
% plot((k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha),alpha,'Color',[237,32,36]/255,'Linewidth',1)



xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])




%% phase diagram pool punishment at r=3.5
hold on
box on

xlim([0 3])
ylim([0 1])
k=4;c=1;r=3.5;



alpha=[0:0.01:1];

% plot((k+1)/2*(-r*c/(k+1)+c+alpha),alpha,'Color',0.95*[1,1,1],'Linewidth',3)
% plot((k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha),alpha,'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot(r35CDOirreg(:,2),r35CDOirreg(:,1),'Color','k','Linewidth',1)
% plot(r35CDOirreg2(:,2),r35CDOirreg2(:,1),'Color','k','Linewidth',1)
% plot(r35CDOreg(:,2),r35CDOreg(:,1),'Color',[57,83,164]/255,'Linewidth',1)
% plot(strata(:,2),strata(:,1),'Color',[237,32,36]/255,'Linewidth',1)
% plot(stratb(:,2),stratb(:,1),'Color','k','Linewidth',1)
% plot(stratc(:,2),stratc(:,1),'Color',[57,83,164]/255,'Linewidth',1)




plot(r35CDOirreg(:,2),r35CDOirreg(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(r35CDOirreg2(:,2),r35CDOirreg2(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(r35CDOreg(:,2),r35CDOreg(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(strata(:,2),strata(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(stratb(:,2),stratb(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
plot(stratc(:,2),stratc(:,1),'Color',0.95*[1,1,1],'Linewidth',3)

plot((k+1)/2*(-r*c/(k+1)+c+alpha),alpha,'Color',[57,83,164]/255,'Linewidth',1)
plot((k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha),alpha,'Color',[237,32,36]/255,'Linewidth',1)




xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])




%% phase diagram peer reward at r=2.0
hold on
box on


xlim([0 1.5])
ylim([0 0.2])
k=4;c=1;r=2;


alpha=[0:0.01:0.2];



plot(k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha,alpha,'Color',0.95*[1,1,1],'Linewidth',3)

plot(r20line1(:,2),r20line1(:,1),'Color',[237,32,36]/255,'Linewidth',1)
plot(r20line2(:,2),r20line2(:,1),'Color','k','Linewidth',1)
plot(r20line3(:,2),r20line3(:,1),'Color',[57,83,164]/255,'Linewidth',1)
plot(r20line4(:,2),r20line4(:,1),'Color','k','Linewidth',1)





% plot(r20line1(:,2),r20line1(:,1),'Color',0.95*[1,1,1],'Linewidth',1)
% plot(r20line2(:,2),r20line2(:,1),'Color',0.95*[1,1,1],'Linewidth',1)
% plot(r20line3(:,2),r20line3(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(r20line4(:,2),r20line4(:,1),'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot(k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha,alpha,'Color',[237,32,36]/255,'Linewidth',1)




xlabel('$\gamma$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])



%% phase diagram peer reward at r=3.5
hold on
box on


xlim([0 1.5])
ylim([0 0.2])
k=4;c=1;r=3.5;


alpha=[0:0.01:0.2];



% plot(k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha,alpha,'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot(r35line1(:,1),r35line1(:,2),'Color',[237,32,36]/255,'Linewidth',1)
% plot(r35line2(:,1),r35line2(:,2),'Color',[57,83,164]/255,'Linewidth',1)
% plot(r35line3(:,1),r35line3(:,2),'Color','k','Linewidth',1)






plot(r35line1(:,1),r35line1(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
plot(r35line2(:,1),r35line2(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
plot(r35line3(:,1),r35line3(:,2),'Color',0.95*[1,1,1],'Linewidth',3)

plot(k*(k+1)/(k*(k+1)-3)*(-r*c/(k+1)+c)+alpha,alpha,'Color',[237,32,36]/255,'Linewidth',1)




xlabel('$\gamma$','Interpreter','LaTex','fontsize',12)
ylabel('$\alpha$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])



%% phase diagram multi-stage
hold on
box on

axis equal
xlim([1 6])
ylim([1 6])
k=4;c=1;


r1=[1:0.01:6];



plot(r1,(k+1)./r1,'Color',0.95*[1,1,1],'Linewidth',3)
plot(r1,k+1+r1*0,'Color',0.95*[1,1,1],'Linewidth',3)

plot(CCdown(:,1),CCdown(:,2),'Color',[57,83,164]/255,'Linewidth',1)
plot(CDdown(:,1),CDdown(:,2),'Color','k','Linewidth',1)
plot(CDup(:,1),CDup(:,2),'Color','k','Linewidth',1)
plot(CDCCleft(:,1),CDCCleft(:,2),'Color','k','Linewidth',1)
plot(DDup(:,1),DDup(:,2),'Color',[237,32,36]/255,'Linewidth',1)
plot(DDCCs(:,1),DDCCs(:,2),'Color','k','Linewidth',1)
plot(DDCCf1(:,1),DDCCf1(:,2),'Color','k','Linewidth',1)
plot(DDCCf2(:,1),DDCCf2(:,2),'Color','k','Linewidth',1)
plot(DDCCf2(:,1),DDCCf2(:,2),'Color','k','Linewidth',1)
plot(DDCD(:,1),DDCD(:,2),'Color','k','Linewidth',1)



% plot(CCdown(:,1),CCdown(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(CDdown(:,1),CDdown(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(CDup(:,1),CDup(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(CDCCleft(:,1),CDCCleft(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDup(:,1),DDup(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDCCs(:,1),DDCCs(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDCCf1(:,1),DDCCf1(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDCCf2(:,1),DDCCf2(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDCCf2(:,1),DDCCf2(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% plot(DDCD(:,1),DDCD(:,2),'Color',0.95*[1,1,1],'Linewidth',3)
% 
% plot(r1,(k+1)./r1,'Color',[237,32,36]/255,'Linewidth',1)
% plot(r1,k+1+r1*0,'Color',[57,83,164]/255,'Linewidth',1)




xlabel('$r_1$','Interpreter','LaTex','fontsize',12)
ylabel('$r_2$','Interpreter','LaTex','fontsize',12)
set(gcf,'unit','centimeters','position',[1 1 11 8])
