function [c,freq] = mp(dat,G,N,M,sigma)
    % Initialisation
    res = dat;
    freq = [];
    c = zeros(2*M+1);
    
    T = norm(res)^2/sigma^2;
    tau = chisqq(0.95,N);
    
    choix_l = zeros(2*M+1);
    
    % Iterations

    while (T>tau)
        for l = 1:(2*M+1) 
            choix_l(l) = G(:,l)'*res;
        end
        [maxGres,loptv] = max(abs(choix_l));
        lopt = loptv(1);
        freq = [ freq(:) ; lopt ];
        c(lopt) = c(lopt) + choix_l(lopt)/N;
        res = res - choix_l(lopt)/N * G(:,lopt);
        
        T = norm(res)^2/sigma^2;
    end
end