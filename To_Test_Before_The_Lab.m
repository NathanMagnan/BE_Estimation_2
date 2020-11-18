% Compilation du programme C/Matlab
% mex min_L2_L1_0.c

% Création de données artificielles
N = 256;
t = sort(rand(N,1));
sigma = .1;

K = 1000;
fmax=40;
freq = (-K:K)/K*fmax;
W = exp(2*j*pi*t*freq);

x = zeros(2*K+1,1);
for k = [128, 232, 512, 818]
    x(K+1+k) = randn + i*randn;
    x(K+1-k) = conj(x(K+1+k));
end
indx = find(abs(x));
y = real(W*x) + sigma*randn(N,1);
    
lambda_max = max(abs(W'*y));
lambda = .01* lambda_max;

itmax = 10000;
% Appel du programme avec tous les arguments de sortie
  [X0, J0, NZ0] = min_L2_L1_0(y,W,lambda,itmax); 
  indX0 = find(abs(X0)>1e-6);
