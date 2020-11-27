function [c,indf] = omp(dat,G,N,M,sigma)
    % Initialisation
    res = dat;
    indf = [];
    c = zeros(2*M+1);
    
    T = norm(res)^2/sigma^2;
    tau = chisqq(0.95,N);
    
    choix_l = zeros(2*M+1);
    
    % Iterations

    while (T>tau)
        mopt = G(:,1)'*res;
        abmopt = abs(mopt);
        lopt = 1;
        for l = 2:(2*M+1) 
            mnew = G(:,l)'*res;
            abmnew = abs(mnew);
            if (abmnew>abmopt)
                mopt = mnew;
                abmopt = abmnew;
                lopt=l;
            end
        end
        indf = unique([ indf(:) ; lopt ]);
        c(indf) = (G(:,indf)'*G(:,indf)) \ (G(:,indf)'*dat);
        res = dat - G(:,indf)*c(indf);
        
        T = norm(res)^2/sigma^2;
    end
end