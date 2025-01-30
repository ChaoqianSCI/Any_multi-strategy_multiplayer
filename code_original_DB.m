T=10;step=1;

k=4;n=3;nk=nchoosek(n+k-1,k);nk_1=nchoosek(n+k-2,k-1);
% nchoosek(n+k-1,k)
kref=zeros(nk,n);
kref(1,1)=-1;
for i=1:nk
    kref(i,1)=kref(i,1)+1;
    j=1;
    while sum(kref(i,1:n-1))>k
        kref(i,j)=0;kref(i,j+1)=kref(i,j+1)+1;
        j=j+1;
    end
    kref(i,n)=k-sum(kref(i,1:n-1));
    if i<nk
        kref(i+1,:)=kref(i,:);
    end
end
k_1ref=zeros(nk_1,n);
k_1ref(1,1)=-1;
for i=1:nk_1
    k_1ref(i,1)=k_1ref(i,1)+1;
    j=1;
    while sum(k_1ref(i,1:n-1))>k-1
        k_1ref(i,j)=0;k_1ref(i,j+1)=k_1ref(i,j+1)+1;
        j=j+1;
    end
    k_1ref(i,n)=k-1-sum(k_1ref(i,1:n-1));
    if i<nk_1
        k_1ref(i+1,:)=k_1ref(i,:);
    end
end

% %traditional pgg
% a=zeros(nk,n);
% r=4;
% for i=1:nk
%     a(i,1)=r*(kref(i,1)+1)/(k+1)-1;
%     a(i,2)=r*kref(i,1)/(k+1);
% end

% pgg with peer punishment
a=zeros(nk,n);
r=3;c=1;alpha=0.05;beta=0.02;
for i=1:nk
    a(i,1)=r*(kref(i,1)+kref(i,3)+1)*c/(k+1)-c;
    a(i,2)=r*(kref(i,1)+kref(i,3))*c/(k+1)-beta*kref(i,3);
    a(i,3)=r*(kref(i,1)+kref(i,3)+1)*c/(k+1)-c-alpha*kref(i,2);
end


x=zeros(n,T/step+1);
x(:,1)=1/n;
% x(1,1)=0.5;x(2,1)=0.4;x(3,1)=0.1;
needlet=0;
for t=step:step:T
    needlet=needlet+1;
    xt=x(:,needlet);tempxt=zeros(n,1);
    q=zeros(n,n);
    for i=1:n
        for j=1:n
            deltaij=0;
            if i==j
                deltaij=1;
            end
            q(i,j)=((k-2)*xt(i,1)+deltaij)/(k-1);
        end
    end

    dx=zeros(n,1);
    for i=1:n
        pi=zeros(n,n);
        for j=1:n
            sumk0=0;
            for k0=1:nk
                for ii=1:n
                    kref0=kref(k0,:);kref0(1,ii)=kref0(1,ii)-1;kref0(1,j)=kref0(1,j)+1;
                    for f=1:nk
                        if kref0(1,:)==kref(f,:)
                            pi(ii,j)=a(f,ii);
                            break
                        end
                    end
                    sumk1=0;
                    for k1=1:nk_1
                        suml=0;
                        for l=1:n
                            sumk2=0;
                            for k2=1:nk_1
                                kref2=k_1ref(k2,:);kref2(1,l)=kref2(1,l)+1;
                                for f=1:nk
                                    if kref2(1,:)==kref(f,:)
                                        sumk2=sumk2+factorial(k-1)/prod(factorial(k_1ref(k2,:)))*prod(q(:,l)'.^k_1ref(k2,:))*a(f,ii);
                                        break
                                    end
                                end
                            end
                            suml=suml+k_1ref(k1,l)*sumk2;
                        end
                        tempsumk1=suml;
                        kref1=k_1ref(k1,:);kref1(1,j)=kref1(1,j)+1;
                        for f=1:nk
                            if kref1(1,:)==kref(f,:)
                                tempsumk1=tempsumk1+a(f,ii);
                                break
                            end
                        end
                        sumk1=sumk1+factorial(k-1)/prod(factorial(k_1ref(k1,:)))*prod(q(:,ii)'.^k_1ref(k1,:))*tempsumk1;
                    end
                    pi(ii,j)=pi(ii,j)+sumk1;
                end
                sumk0=sumk0+factorial(k)/prod(factorial(kref(k0,:)))*prod(q(:,j)'.^kref(k0,:))*kref(k0,i)/k*(pi(i,j)-sum(kref(k0,:)'.*pi(:,j)/k));
            end
            sumj=sumk0*xt(j,1);
            dx(i,1)=dx(i,1)+sumj;
        end
        tempxt(i,1)=xt(i,1)+step*dx(i,1);
    end
    x(:,needlet+1)=tempxt(:,1);
    hold on
    for i=1:n
        plot(t,x(i,needlet),'o')
    end
    pause(0.001)
end

% hold on
% for i=1:n
%     plot(step:step:T+step,x(i,:))
% end
% legend
% 
% (k+1)^2/(k+3)
