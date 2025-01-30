%% well-mixed 1
k=4;
r=3;c=1;
alpha=0.7;beta=1.2;

hold on


plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off


%PC for comparison
ang=0.001;
angle=ang*0.5*pi;
xt(1,1)=0.01*sin(angle);xt(3,1)=1-(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k))+0.01*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

ne=0;
tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  
ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;

x1=0;x2=(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k));
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,70,'o','Markeredgecolor',0.6*[1,1,1],'Markerfacecolor',0.8*[1,1,1])

ang=0.3;angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);
xt31=0.55;
xt(3,1)=xt31;xt(2,1)=1-xt(1,1)-xt(3,1);
tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  

ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;


numarrow=2;
point=[1110 600];
Xseries=[Xdata(point(1,1),1) Xdata(point(1,2),2)];
Yseries=[Ydata(point(1,1),1) Ydata(point(1,2),2)];
angleseries=[atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2)))];

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
for ang=[0.001]
    angle=ang*0.5*pi;
    xt(1,1)=0.01*sin(angle);xt(3,1)=1-(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k)+0.01*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end

ang=0.3;angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);
for xt31=[0.44 0.7]
    xt(3,1)=xt31;xt(2,1)=1-xt(1,1)-xt(3,1);
    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end


numarrow=7;
point=[1730 1000 1000];
Xseries=[0.08 0.4 0.85 0.5 Xdata(point(1,1),1) Xdata(point(1,2),2) Xdata(point(1,3),3)];
Yseries=[0.08*tan(pi/3) 0.4*tan(pi/3) (1-0.85)*tan(pi/3) 0 Ydata(point(1,1),1) Ydata(point(1,2),2) Ydata(point(1,3),3)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 0 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2))) atan((Ydata(point(1,3),3)-Ydata(point(1,3)-1,3))/(Xdata(point(1,3),3)-Xdata(point(1,3)-1,3)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end




scatter([0,0],0,80,'ok','Markerfacecolor','w')
scatter([1,0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')


x1=0;x2=(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0;x2=0.46;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$O$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)



%% well-mixed 1 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=1.2;

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
alpha=0.7;beta=1.2;

xt(1,1)=0;xt(3,1)=1-0.46;xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:100];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 100])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

for i=[1,3,2]
    plot(0,xt(i,1),'sk','Markerfacecolor','w','Markersize',11)
    text(0,xt(i,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
end

set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])




%% well-mixed 2
k=4;
r=3;c=1;
alpha=0.7;beta=5;

hold on


plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off





%well-mixed
ne=0;
xt11=[1/3,0.07,0.6,0.2];
xt31=[1/3,0.07,0.2,0.6];
for i=1:4
    xt(1,1)=xt11(1,i);xt(3,1)=xt31(1,i);xt(2,1)=1-xt(1,1)-xt(3,1);
    tspan=[0:0.01:10000];
    options=odeset('events',@events2);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end

for ang=[0.001]
    angle=ang*0.5*pi;
    xt(1,1)=1*sin(angle);xt(3,1)=1-(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k)+0.01*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end

numarrow=9;
point=[40 200 40 40 260];
Xseries=[1/4 0.49 0.75 0.5 Xdata(point(1,1),1) Xdata(point(1,2),2) Xdata(point(1,3),3) Xdata(point(1,4),4) Xdata(point(1,5),5)];
Yseries=[1/4*tan(pi/3) 0.49*tan(pi/3) (1-0.75)*tan(pi/3) 0 Ydata(point(1,1),1) Ydata(point(1,2),2) Ydata(point(1,3),3) Ydata(point(1,4),4) Ydata(point(1,5),5)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 0 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2))) atan((Ydata(point(1,3),3)-Ydata(point(1,3)-1,3))/(Xdata(point(1,3),3)-Xdata(point(1,3)-1,3))) atan((Ydata(point(1,4),4)-Ydata(point(1,4)-1,4))/(Xdata(point(1,4),4)-Xdata(point(1,4)-1,4))) pi+atan((Ydata(point(1,5),5)-Ydata(point(1,5)-1,5))/(Xdata(point(1,5),5)-Xdata(point(1,5)-1,5)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end




scatter([0,0],0,80,'ok','Markerfacecolor','w')
scatter([1,0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')


x1=0;x2=(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.07;x2=0.86;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$O$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)


%% well-mixed 2 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=1/3;xt(3,1)=1/3;xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:100];
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 100])
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

xt(1,1)=0.07;xt(3,1)=0.07;xt(2,1)=1-xt(1,1)-xt(3,1);

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
alpha=0.7;beta=1.2;

hold on


plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off



%well-mixed for comparison
ne=0;
ang=0.001;
angle=ang*0.5*pi;
xt(1,1)=0.01*sin(angle);xt(3,1)=1-(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k)+0.01*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  
ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;

ang=0.3;angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);
xt31=0.44;
xt(3,1)=xt31;xt(2,1)=1-xt(1,1)-xt(3,1);
tspan=[0:0.01:10000];
options=odeset('events',@events1);
[t,y]=ode45(@(t,y) wellmixed_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

xdata=y(:,1)+y(:,2)*cos(pi/3);
ydata=y(:,2)*sin(pi/3);
plot(xdata,ydata,'Color',0.8*[1,1,1],'Linewidth',1)  

ne=ne+1;
Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;



x1=0;x2=(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k);
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,70,'o','Markeredgecolor',0.6*[1,1,1],'Markerfacecolor',0.8*[1,1,1])

numarrow=2;
point=[1730 1000];
Xseries=[Xdata(point(1,1),1) Xdata(point(1,2),2)];
Yseries=[Ydata(point(1,1),1) Ydata(point(1,2),2)];
angleseries=[atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2)))];

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
for ang=[0.001]
    angle=ang*0.5*pi;
    xt(1,1)=0.01*sin(angle);xt(3,1)=1-(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k))+0.01*cos(angle);xt(2,1)=1-xt(1,1)-xt(3,1);


    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end


ang=0.3;angle=ang*0.5*pi;
xt(1,1)=0.001*sin(angle);
for xt31=[0.55 0.8]
    xt(3,1)=xt31;xt(2,1)=1-xt(1,1)-xt(3,1);
    tspan=[0:0.01:10000];
    options=odeset('events',@events1);
    [t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end


numarrow=7;
point=[1110 600 800];
Xseries=[0.04 0.35 0.82 0.5 Xdata(point(1,1),1) Xdata(point(1,2),2) Xdata(point(1,3),3)];
Yseries=[0.04*tan(pi/3) 0.35*tan(pi/3) (1-0.82)*tan(pi/3) 0 Ydata(point(1,1),1) Ydata(point(1,2),2) Ydata(point(1,3),3)];
angleseries=[pi/3+pi pi/3 pi/6+pi/2 0 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2))) atan((Ydata(point(1,3),3)-Ydata(point(1,3)-1,3))/(Xdata(point(1,3),3)-Xdata(point(1,3)-1,3)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end





scatter([0,0],0,80,'ok','Markerfacecolor','w')
scatter([1,0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','filled')


x1=0;x2=(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k));
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
scatter(xdata,ydata,80,'ok','Markerfacecolor','w')

x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0;x2=0.46;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$O$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)



%% PC 1 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=1.2;

xt(1,1)=1/3;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

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



%% PC 1 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=1.2;

xt(1,1)=0;xt(3,1)=1-0.46;xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:50];
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 


xlim([0 50])
ylim([0 1])
box on
xlabel('time','Interpreter','Latex','FontSize',12)

for i=[1,3,2]
    plot(0,xt(i,1),'sk','Markerfacecolor','w','Markersize',11)
    text(0,xt(i,1),'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',8)
end


set(gcf,'unit','centimeters','position',[1 1 5.5 4.5])







%% PC 2
k=4;
r=3;c=1;
alpha=0.7;beta=5;

hold on


plot([0,1],[0,0],'k')
plot([0,1/2],[0,1/2*tan(pi/3)],'k')
plot([1/2,1],[1/2*tan(pi/3),0],'k')

axis equal
axis off




%PC

ne=0;
xt11=[1/3,0.07,0.6,0.2];
xt31=[1/3,0.07,0.2,0.6];
for i=1:4
    xt(1,1)=xt11(1,i);xt(3,1)=xt31(1,i);xt(2,1)=1-xt(1,1)-xt(3,1);
    tspan=[0:0.01:2000];
    options=odeset('events',@events2);
    [t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1),options);

    xdata=y(:,1)+y(:,2)*cos(pi/3);
    ydata=y(:,2)*sin(pi/3);
    plot(xdata,ydata,'k')   

    ne=ne+1;
    Xdata(1:length(xdata),ne)=xdata;Ydata(1:length(ydata),ne)=ydata;
end


numarrow=9;
point=[40 60 40 40 2770 1670];
Xseries=[1/4 0.75 0.5 Xdata(point(1,1),1) Xdata(point(1,2),2) Xdata(point(1,3),3) Xdata(point(1,4),4) Xdata(point(1,5),1) Xdata(point(1,6),3)];
Yseries=[1/4*tan(pi/3) (1-0.75)*tan(pi/3) 0 Ydata(point(1,1),1) Ydata(point(1,2),2) Ydata(point(1,3),3) Ydata(point(1,4),4) Ydata(point(1,5),1) Ydata(point(1,6),3)];
angleseries=[pi/3+pi pi/3+pi/3 0 atan((Ydata(point(1,1),1)-Ydata(point(1,1)-1,1))/(Xdata(point(1,1),1)-Xdata(point(1,1)-1,1))) pi+atan((Ydata(point(1,2),2)-Ydata(point(1,2)-1,2))/(Xdata(point(1,2),2)-Xdata(point(1,2)-1,2))) atan((Ydata(point(1,3),3)-Ydata(point(1,3)-1,3))/(Xdata(point(1,3),3)-Xdata(point(1,3)-1,3))) atan((Ydata(point(1,4),4)-Ydata(point(1,4)-1,4))/(Xdata(point(1,4),4)-Xdata(point(1,4)-1,4))) pi+atan((Ydata(point(1,5),1)-Ydata(point(1,5)-1,1))/(Xdata(point(1,5),1)-Xdata(point(1,5)-1,1))) pi+atan((Ydata(point(1,6),3)-Ydata(point(1,6)-1,3))/(Xdata(point(1,6),3)-Xdata(point(1,6)-1,3)))];

len=0.03;
for needle=1:numarrow
    X=Xseries(1,needle);
    Y=Yseries(1,needle);
    angle=angleseries(1,needle);
    plot([X,X+len*sin(angle-pi/3)],[Y,Y-len*cos(angle-pi/3)],'k')
    plot([X,X+len*sin(angle-pi/3-pi/3)],[Y,Y-len*cos(angle-pi/3-pi/3)],'k')
end




scatter([0,0],0,80,'ok','Markerfacecolor','w')
scatter([1,0],0,80,'ok','Markerfacecolor','w')
scatter(1/2,1/2*tan(pi/3),80,'ok','Markerfacecolor','w')



x1=1/3;x2=1/3;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'A','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')
x1=0.07;x2=0.86;
xdata=x1+x2*cos(pi/3);
ydata=x2*sin(pi/3);
plot(xdata,ydata,'sk','Markerfacecolor','w','Markersize',15)
text(xdata,ydata,'B','Interpreter','latex','HorizontalAlignment','center','VerticalAlignment','middle')

text(0-0.08,0-0.01,'$O$','Interpreter','Latex','FontSize',19)
text(1+0.03,0-0.01,'$C$','Interpreter','Latex','FontSize',19)
text(0.5+0.03,0.5*tan(pi/3),'$D$','Interpreter','Latex','FontSize',19)




%% PC 2 time evolution 1

k=4;
r=3;c=1;
alpha=0.7;beta=5;

xt(1,1)=1/3;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:200];
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 200])
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

xt(1,1)=0.07;xt(3,1)=xt(1,1);xt(2,1)=1-xt(1,1)-xt(3,1);

tspan=[0:0.01:500];
[t,y]=ode45(@(t,y) PC_f(t,y,k,r,c,alpha,beta),tspan,xt(:,1));

hold on
plot(tspan,y(:,1),'g')   
plot(tspan,y(:,2),'r') 
plot(tspan,y(:,3),'b') 

xlim([0 200])
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

beta0WX=1.1;
beta0ST=(k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha);
betaequal=((k+1)^(1/k)*(k-1)^(1-1/k)-k+2)^k/(1-((k+1)^(1/k)*(k-1)^(1-1/k)-k+2)^k)*(r*c/(k+1)-c-alpha);
limitbeta=(k+1)/2*(-r*c/(k+1)+c+alpha);


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


% %pool
% (k+1)/2*(-r*c/(k+1)+c+alpha)



set(gcf,'unit','centimeters','position',[1 1 25 15])

%% beta 1D figure

hold on
k=4;
r=3;c=1;
alpha=0.7;

X=[1:0.01:10];
X1=[1.1:0.01:10];
X2=[(k+1)*(k-1)^(k-1)/(1-(k+1)*(k-1)^(k-1))*(r*c/(k+1)-c-alpha),1.11:0.01:10]
plot(X,X*0,':k')
plot(X,X*0+1,':k')

dataWM=[];needle=0;
for beta=X1
    needle=needle+1;
    dataWM(1,needle)=(1+1/beta*(r*c/(k+1)-c-alpha))^(1/k);
    dataPC(1,needle)=(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k));
end
dataPC=[];needle=0;
for beta=X2
    needle=needle+1;
    dataPC(1,needle)=(k-1)/(k-2)*(-1/(k-1)+((k+1)/(k-1)*(1+1/beta*(r*c/(k+1)-c-alpha)))^(1/k));
end

p1=plot(X1,dataWM(1,:),'Color',[217/255,83/255,25/255],'Linewidth',1)
p2=plot(X2,dataPC(1,:),'Color',[237/255,177/255,23/255],'Linewidth',3)


set(gca,'XScale','log')
box on


% beta0=((k+1)^(1/k)*(k-1)^(1-1/k)-k+2)^k/(1-((k+1)^(1/k)*(k-1)^(1-1/k)-k+2)^k)*(r*c/(k+1)-c-alpha);
% plot(beta0,0.5,'o')
% beta1=(k+1)/2*(-r*c/(k+1)+c+alpha);
% plot(beta1,0.5,'o')


ylim([-0.5 1.5])

h1=legend([p1,p2],'Well-mixed','Structured','Location','best','fontsize',10);
set(h1,'Interpreter','latex')

xlabel('$\beta$','Interpreter','LaTex','fontsize',12)
ylabel('$x_D^{(DO)}$','Interpreter','LaTex','fontsize',12)

set(gcf,'unit','centimeters','position',[1 1 14 8])



