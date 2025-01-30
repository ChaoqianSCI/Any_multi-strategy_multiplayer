hold on

r1=0.5;r2=36;
K=0.1;

N=1000;T=100;k=4;


S=zeros(1,1000);
for i=1:N
    S(1,i)=unidrnd(4);
end

for t=1:T
    for MCS=1:N
        i=unidrnd(N);
        j=unidrnd(N);
        while i==j
            j=unidrnd(N);
        end
        if S(1,i)~=S(1,j)
            pi_i=0;
            for round=1:k+1
                k_i=randperm(N,k);
                while ismember(i,k_i)==1
                    k_i=randperm(N,k);
                end
                n=zeros(1,4);
                n(1,S(1,i))=n(1,S(1,i))+1;
                for l=1:k
                    n(1,S(1,k_i(1,l)))=n(1,S(1,k_i(1,l)))+1;
                end
                pi_i=pi_i+r2*(r1*(n(1,2)+n(1,1))+n(1,3)+n(1,1))/(k+1);
                if S(1,i)==1
                    pi_i=pi_i-10;
                elseif S(1,i)==2 || S(1,i)==3
                    pi_i=pi_i-5;
                end
            end
            pi_i=pi_i/(k+1);

            pi_j=0;
            for round=1:k+1
                k_j=randperm(N,k);
                while ismember(j,k_j)==1
                    k_j=randperm(N,k);
                end
                n=zeros(1,4);
                n(1,S(1,j))=n(1,S(1,j))+1;
                for l=1:k
                    n(1,S(1,k_j(1,l)))=n(1,S(1,k_j(1,l)))+1;
                end
                pi_j=pi_j+r2*(r1*(n(1,2)+n(1,1))+n(1,3)+n(1,1))/(k+1);
                if S(1,j)==1
                    pi_j=pi_j-10;
                elseif S(1,j)==2 || S(1,j)==3
                    pi_j=pi_j-5;
                end
            end
            pi_j=pi_j/(k+1);

            if unifrnd(0,1)<1/(1+exp(-(pi_j-pi_i)/K))
                S(1,i)=S(1,j);
            end
        end
    end
    aveS=zeros(1,4);
    for i=1:N
        for s=1:4
            if S(1,i)==s
                aveS(1,s)=aveS(1,s)+1;
                break
            end
        end
    end
    aveS=aveS/N;
    plot(t,aveS(1,1),'or')
    plot(t,aveS(1,2),'og')
    plot(t,aveS(1,3),'om')
    plot(t,aveS(1,4),'ob')
end