
%% well-mixed 1
k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

hold on

ang=1.0986;
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);

x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
X1=x1+x2*cos(pi/3);
Y1=x2*sin(pi/3);

h=fill([0,X1,xdata(1:9520,1)',0],[0,Y1,ydata(1:9520,1)',0],'g')
set(h,'edgealpha',0,'facealpha',0.15)

h=fill([X1,xdata(1:9520,1)',1,0.5,X1],[Y1,ydata(1:9520,1)',0,0.5*tan(pi/3),Y1],'r')
set(h,'edgealpha',0,'facealpha',0.1)



plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off


%PC for comparison
ang=1.0650
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

ne=0;
tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  
ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;

x1=0;x2=1-1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,70,'o','Markeredgecolor',0.6*[1,1,1],'Markerfacecolor',0.8*[1,1,1])

numarrow=2;
point=[1100 36800];
Xseries=[Xdata(point(1,1),1) Xdata(point(1,2),1)];
Yseries=[Ydata(point(1,1),1) Ydata(point(1,2),1)];
angleseries=[atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) pi+atan((Ydata(point(1,2),1)-Ydata(point(1,2)-1,1))/(Xdata(point(1,2),1)-Xdata(point(1,2)-1,1)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'Color',0.8*[1,1,1],'Linewidth',1)
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'Color',0.8*[1,1,1],'Linewidth',1)
end







%well-mixed
ne=0;
for ang=[1.0986 1.35 1.15 0.9]
    angle=ang*0.5*pi;
    xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end



scatter([0:0.03:0.03*28],0,80,'ok','filled')
scatter([1:-0.03:1-0.03*4],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')




numarrow=8;
point=[700 17300 550 800 600];
Xseries=[0.1 0.33 0.56 Xdata(point(1,1),1) Xdata(point(1,2),1) Xdata(point(1,3),2) Xdata(point(1,4),3) Xdata(point(1,5),4)];
Yseries=[0.1*tan(pi/3) 0.33*tan(pi/3) (1-0.56)*tan(pi/3) Ydata(point(1,1),1) Ydata(point(1,2),1) Ydata(point(1,3),2) Ydata(point(1,4),3) Ydata(point(1,5),4)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) pi+atan((Ydata(point(1,2),1)-Ydata(point(1,2)-1,1))/(Xdata(point(1,2),1)-Xdata(point(1,2)-1,1))) atan((Ydata(point(1,3),2)-Ydata(point(1,3)-1,2))/(Xdata(point(1,3),2)-Xdata(point(1,3)-1,2))) atan((Ydata(point(1,4),3)-Ydata(point(1,4)-1,3))/(Xdata(point(1,4),3)-Xdata(point(1,4)-1,3))) atan((Ydata(point(1,5),4)-Ydata(point(1,5)-1,4))/(Xdata(point(1,5),4)-Xdata(point(1,5)-1,4)))];


len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end






x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1+(r/(k+1)-1)*c/(k*beta);x2=0;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.42;x2=1-2*x1;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$E$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)







%% well-mixed 1 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

xt(1,1)=1/3;xt(3,1)=1/3;xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)

set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])



%% well-mixed 1 time evolution 2

k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

xt(1,1)=0.42;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
plot(0,xt(2,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(2,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])


%% well-mixed 2
k=4;
r=3;c=1;
alpha=0.7;beta=5;

hold on

ang=1.0222;
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);

x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
X1=x1+x2*cos(pi/3);
Y1=x2*sin(pi/3);

h=fill([0,X1,xdata(1:3500,1)',0],[0,Y1,ydata(1:3500,1)',0],'g')
set(h,'edgealpha',0,'facealpha',0.15)

h=fill([X1,xdata(1:3500,1)',1,0.5,X1],[Y1,ydata(1:3500,1)',0,0.5*tan(pi/3),Y1],'r')
set(h,'edgealpha',0,'facealpha',0.1)






plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off

ne=0;
for ang=[1.0222 1.05 0.9 0.5]
    angle=ang*0.5*pi;
    xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end



scatter([0:0.03:0.03*32],0,80,'ok','filled')
scatter([1:-0.03:1-0.03*0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')



x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1+(r/(k+1)-1)*c/(k*beta);x2=0;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')



numarrow=8;
point=[400 0.01 300 250 195];
Xseries=[0.25 0.48 0.56 0.8 Xdata(point(1,1),1) Xdata(point(1,3),2) Xdata(point(1,4),3) Xdata(point(1,5),4)];
Yseries=[0.25*tan(pi/3) 0.48*tan(pi/3) (1-0.56)*tan(pi/3) (1-0.8)*tan(pi/3) Ydata(point(1,1),1) Ydata(point(1,3),2) Ydata(point(1,4),3) Ydata(point(1,5),4)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 pi/6+pi/2 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,3),2)-Ydata(point(1,3)-1,2))/(Xdata(point(1,3),2)-Xdata(point(1,3)-1,2))) atan((Ydata(point(1,4),3)-Ydata(point(1,4)-1,3))/(Xdata(point(1,4),3)-Xdata(point(1,4)-1,3))) pi+atan((Ydata(point(1,5),4)-Ydata(point(1,5)-1,4))/(Xdata(point(1,5),4)-Xdata(point(1,5)-1,4)))];


len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end




x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.1;x2=1-2*x1;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')


text(0-0.08,0-0.01,'$E$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)










%% well-mixed 2 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=1/3;xt(3,1)=1/3;xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 10])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)

set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])



%% well-mixed 2 time evolution 2

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=0.1;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
plot(0,xt(2,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(2,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])










%% PC 1
k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

hold on

ang=1.0650
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);

x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
X1=x1+x2*cos(pi/3);
Y1=x2*sin(pi/3);

h=fill([0,X1,xdata(1:18850,1)',0],[0,Y1,ydata(1:18850,1)',0],'g')
set(h,'edgealpha',0,'facealpha',0.15)

h=fill([X1,xdata(1:18850,1)',1,0.5,X1],[Y1,ydata(1:18850,1)',0,0.5*tan(pi/3),Y1],'r')
set(h,'edgealpha',0,'facealpha',0.1)


plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off


%wellmixed for comparison
ang=1.0986
angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);xt(3,1)=1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

ne=0;
tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  
ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;

x1=0;x2=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,70,'o','Markeredgecolor',0.6*[1,1,1],'Markerfacecolor',0.8*[1,1,1])

numarrow=2;
point=[700 17300];
Xseries=[Xdata(point(1,1),1) Xdata(point(1,2),1)];
Yseries=[Ydata(point(1,1),1) Ydata(point(1,2),1)];
angleseries=[atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) pi+atan((Ydata(point(1,2),1)-Ydata(point(1,2)-1,1))/(Xdata(point(1,2),1)-Xdata(point(1,2)-1,1)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'Color',0.8*[1,1,1],'Linewidth',1)
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'Color',0.8*[1,1,1],'Linewidth',1)
end



%PC
ne=0;
for ang=[1.0650 1.35 1.15 0.9]
    angle=ang*0.5*pi;
    xt(1,1)=0.001*sin(angle);xt(3,1)=1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3)+0.001*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end



scatter([0:0.03:0.03*26],0,80,'ok','filled')
scatter([1:-0.03:1-0.03*6],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')



x1=0;x2=1-1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1+(r/(k+1)-1)*c/(k*beta-3*(alpha+beta)/(k+1));x2=0;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')



numarrow=8;
point=[1100 36800 900 1100 900];
Xseries=[0.1 0.3 0.54 Xdata(point(1,1),1) Xdata(point(1,2),1) Xdata(point(1,3),2) Xdata(point(1,4),3) Xdata(point(1,5),4)];
Yseries=[0.1*tan(pi/3) 0.3*tan(pi/3) (1-0.54)*tan(pi/3) Ydata(point(1,1),1) Ydata(point(1,2),1) Ydata(point(1,3),2) Ydata(point(1,4),3) Ydata(point(1,5),4)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) pi+atan((Ydata(point(1,2),1)-Ydata(point(1,2)-1,1))/(Xdata(point(1,2),1)-Xdata(point(1,2)-1,1))) atan((Ydata(point(1,3),2)-Ydata(point(1,3)-1,2))/(Xdata(point(1,3),2)-Xdata(point(1,3)-1,2))) atan((Ydata(point(1,4),3)-Ydata(point(1,4)-1,3))/(Xdata(point(1,4),3)-Xdata(point(1,4)-1,3))) atan((Ydata(point(1,5),4)-Ydata(point(1,5)-1,4))/(Xdata(point(1,5),4)-Xdata(point(1,5)-1,4)))];


len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end


x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.42;x2=1-2*x1;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')


text(0-0.08,0-0.01,'$E$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)





%% PC 1 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

xt(1,1)=1/3;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) PC_f_2(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])




%% PC 1 time evolution 2

k=4;
r=3;c=1;
alpha=0.7;beta=0.7;

xt(1,1)=0.42;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) PC_f_2(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
plot(0,xt(2,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(2,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])




%% PC 2
k=4;
r=3;c=1;
alpha=0.7;beta=5;

hold on

h=fill([0,0.5,1,0],[0,0.5*tan(pi/3),0,0],'g')
set(h,'edgealpha',0,'facealpha',0.15)





plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off

ne=0;
for ang=[0.95 0.9 0.7 0.1]
    angle=ang*0.5*pi;
    xt(2,1)=0.01*sin(angle);xt(3,1)=0+0.01*cos(angle);xt(1,1)=1-xt(2,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end



scatter([0:0.03:0.03*32],0,80,'ok','filled')
scatter([1:-0.03:1-0.03*0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','Markerfacecolor','w')




x1=1+(r/(k+1)-1)*c/(k*beta-3*(alpha+beta)/(k+1));x2=0;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')



numarrow=5;
point=[3065 2800 2670 3840];
Xseries=[0.25 Xdata(point(1,1),1) Xdata(point(1,2),2) Xdata(point(1,3),3) Xdata(point(1,4),4)];
Yseries=[0.25*tan(pi/3) Ydata(point(1,1),1) Ydata(point(1,2),2) Ydata(point(1,3),3) Ydata(point(1,4),4)];
angleseries=[pi/3+pi pi+atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2))) atan((Ydata(point(1,3),3)-Ydata(point(1,3)-1,3))/(Xdata(point(1,3),3)-Xdata(point(1,3)-1,3))) atan((Ydata(point(1,4),4)-Ydata(point(1,4)-1,4))/(Xdata(point(1,4),4)-Xdata(point(1,4)-1,4)))];


len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end


x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.1;x2=1-2*x1;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$E$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)




%% PC 2 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=1/3;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10];
[t,y]=ode45(@(t,y) PC_f_2(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 10])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])




%% PC 2 time evolution 2

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=0.1;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10];
[t,y]=ode45(@(t,y) PC_f_2(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 10])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

plot(0,xt(1,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(1,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
plot(0,xt(2,1),'sk','Markerfacecolor','w','Markersize',11)
text(0,xt(2,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])





%% diagram

hold on
axis off


k=4;
r=3;c=1;
alpha=0.7;

beta0WX=1/k*(-r*c/(k+1)+c);
beta0ST=(k+1)/(k^2+k-3)*(-r*c/(k+1)+c)+3*alpha/(k^2+k-3);
betaequal=2/k*(-r*c/(k+1)+c)+alpha;
limitbeta=(k+1)/3*(-r*c/(k+1)+c+k*alpha)-alpha;


h=fill([0,beta0WX,beta0WX,beta0ST,beta0ST,0,0],[0.5,0.5,0,0,-0.5,-0.5,0.5],'r')
set(h,'edgealpha',0,'facealpha',0.3)
h=fill([beta0WX,betaequal,betaequal,beta0ST,beta0ST,beta0WX,beta0WX],[0.5,0.5,-0.5,-0.5,0,0,0.5],'y')
set(h,'edgealpha',0,'facealpha',0.3)
h=fill([betaequal,5,5,limitbeta,limitbeta,betaequal,betaequal],[0.5,0.5,0,0,-0.5,-0.5,0.5],'b')
set(h,'edgealpha',0,'facealpha',0.2)
h=fill([limitbeta,5,5,limitbeta,limitbeta],[0,0,-0.5,-0.5,0],'g')
set(h,'edgealpha',0,'facealpha',0.2)


plot([0,5],[0.5,0.5],'k')
plot(0,0.5,'ok','Markerfacecolor','w')
plot(5,0.5,'ok','Markerfacecolor','w')

plot([betaequal,betaequal],[0.5,-0.5],'-k','Markerfacecolor','k')
plot(betaequal,0.5,'ok','Markerfacecolor','k')

plot([beta0WX,beta0WX],[0.5,0],'k')
plot(beta0WX,0.5,'ok','Markerfacecolor','k')


plot([-0.3,5.3],[0,0],'--k')

plot([0,5],[-0.5,-0.5],'k')
plot(5,-0.5,'ok','Markerfacecolor','w')


plot(0,-0.5,'ok','Markerfacecolor','w')
plot(limitbeta,-0.5,'ok','Markerfacecolor','k')
plot([limitbeta,limitbeta],[0,-0.5],'-k','Markerfacecolor','k')


plot(betaequal,-0.5,'ok','Markerfacecolor','k')

plot([beta0ST,beta0ST],[-0.5,0],'k')
plot(beta0ST,-0.5,'ok','Markerfacecolor','k')

% fill([4.9,5,4.9,4.9],[0.03,0,-0.03,0.03],'k')

xlim([-0.5 5.5])
ylim([-1,1])



set(gcf,'unit','centimeters','position',[1 1 25 15])







%% beta 1D figure

hold on
k=4;
r=3;c=1;
alpha=0.7;

X=[0.01:0.01:100];
plot(X,X*0,':k')
plot(X,X*0+1,':k')

dataWM=[];needle=0;
for beta=X
    needle=needle+1;
    dataWM(1,needle)=1-1/(k*(alpha+beta))*(-r*c/(k+1)+c+k*alpha);
    dataPC(1,needle)=1-1/((k-2)*(k+3))*((k+1)/(alpha+beta)*(-r*c/(k+1)+c+k*alpha)-3);
end

p1=plot(X,dataWM(1,:),'Color',[217/255,83/255,25/255],'Linewidth',1)
p2=plot(X,dataPC(1,:),'Color',[237/255,177/255,23/255],'Linewidth',3)


set(gca,'XScale','log')
box on


% beta0=2/k*(-r*c/(k+1)+c)+alpha;
% plot(beta0,0.5,'o')


h1=legend([p1,p2],'Well-mixed','Structured','Location','best','fontsize',10);
set(h1,'Interpreter','latex')

xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$x_D^{(DE)}$','Interpreter','LaTex','fontsize',12)

set(gcf,'unit','centimeters','position',[1 1 14 8])












%% 
% clear
% 
% hold on
% k=4;
% r=3;c=1;
% alpha=0.7;
% 
% X=[0.01:0.01:10];
% dataWM=[];needle=0;
% for beta=X
%     needle=needle+1;
%     dataWM(1,needle)=-(r/(k+1)-1)*c/(k*beta);
%     dataPC(1,needle)=-(r/(k+1)-1)*c/(k*beta-3*(alpha+beta)/(k+1));
% end
% 
% plot(X,dataWM(1,:))
% plot(X,dataPC(1,:))
% 
% 
% % ylim([-1,2])
% set(gca,'XScale','log')
% box on
