function [c,indf] = mp(dat,G,N,M,sigma)
    % Initialisation
    res = dat;
    indf = [];
    c = zeros(2*M+1);
    
    T = norm(res)^2/sigma^2;
    tau = chisqq(0.95,N);
    
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
        c(lopt) = c(lopt) + mopt/N;
        res = res - mopt/N * G(:,lopt);
        
        T = norm(res)^2/sigma^2;
    end
end