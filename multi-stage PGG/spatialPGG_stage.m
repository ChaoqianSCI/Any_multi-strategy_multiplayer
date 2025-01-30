%classic

L=200;N=L*L;

%5neighbor
G=5;k=G-1;
nei=zeros(L*L,G);
needle=0;
for i=1:L
    for j=1:L
        needle=needle+1;
        needlenei=0;
        for needleI=i-1:i+1
            needleJ=j;
            needlenei=needlenei+1;
            I=needleI;
            J=needleJ;
            if needleI<1
                I=L;
            end
            if needleI>L
                I=1;
            end
            nei(needle,needlenei)=(I-1)*L+J;
        end

        needleI=i;
        needleJ=j-1;
        needlenei=needlenei+1;
        I=needleI;
        J=needleJ;
        if needleJ<1
            J=L;
        end
        if needleJ>L
            J=1;
        end
        nei(needle,needlenei)=(I-1)*L+J;

        needleI=i;
        needleJ=j+1;
        needlenei=needlenei+1;
        I=needleI;
        J=needleJ;
        if needleJ<1
            J=L;
        end
        if needleJ>L
            J=1;
        end
        nei(needle,needlenei)=(I-1)*L+J;
        temp=nei(needle,1);nei(needle,1)=nei(needle,2);nei(needle,2)=temp;
    end
end

T=10000;
c=1;r1=3;r2=3;
delta=100;


for k1=0:k
    for k2=0:k1
        for k3=0:k2
            k4=k-k1-k2-k3;
            PI(1,k1+1,k2+1,k3+1)=r2*(r1+1)/(k+1)*k1+r2*r1/(k+1)*k2+r2/(k+1)*k3+r2*(r1+1)/(k+1)-2;
            PI(2,k1+1,k2+1,k3+1)=r2*(r1+1)/(k+1)*k1+r2*r1/(k+1)*k2+r2/(k+1)*k3+r2*r1/(k+1)-1;
            PI(3,k1+1,k2+1,k3+1)=r2*(r1+1)/(k+1)*k1+r2*r1/(k+1)*k2+r2/(k+1)*k3+r2/(k+1)*k3-1;
            PI(4,k1+1,k2+1,k3+1)=r2*(r1+1)/(k+1)*k1+r2*r1/(k+1)*k2+r2/(k+1)*k3;
        end
    end
end

S=zeros(1,N);P=zeros(1,N);
for i=1:N
    S(1,i)=unidrnd(4);
end

for t=1:T
    for MCS=1:N
        i1=unidrnd(N);
        i2=nei(i1,unidrnd(G-1)+1);
        if S(1,i1)~=S(1,i2)
            for l=[i1,i2]
                P(1,l)=0;
                for j=1:G
                    ki=zeros(1,4);
                    for jj=1:G
                        ki(1,S(1,nei(nei(l,j),jj)))=ki(1,S(1,nei(nei(l,j),jj)))+1;
                    end
                    ki(1,S(1,l))=ki(1,S(1,l))-1;
                    P(1,l)=P(1,l)+PI(S(1,l),ki(1,1)+1,ki(1,2)+1);
                end
                P(1,l)=P(1,l)/G;
            end
            if unifrnd(0,1)<1/(1+exp((P(1,i1)-P(1,i2))*delta))
                S(1,i1)=S(1,i2);
            end
        end
    end

    ave=zeros(1,4);
    for i=1:N
        ave(1,S(1,i))=ave(1,S(1,i))+1;
    end
    ave=ave/N;

    subplot(1,2,1)
    for i=1:L
        for j=1:L
            B(i,j)=S(1,(i-1)*L+j);
        end
    end
    imagesc(B)

    subplot(1,2,2)
    hold on
    plot(t,ave(1,1),'og')
    plot(t,ave(1,2),'ob')
    plot(t,ave(1,3),'om')
    plot(t,ave(1,4),'or')
    pause(0.01)
end





