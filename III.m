clear 

%% create the data set
Create_data;

%% choose the parameters
M = 5000;
nu_max = 50;

%% construct the frequency grid
freq_grid = nu_max * (-M:M) / M;

%% construct matrix G
G = exp(2 * pi * 1i * t * freq_grid);


%% Matching Pursuit (MP)

[c0_MP,ind0_MP] = mp(x0,G,N,M,sigma);
freq0_MP = freq_grid(ind0_MP);

[c1_MP,ind1_MP] = mp(x1,G,N,M,sigma);
freq1_MP = freq_grid(ind1_MP);


%% Orthogonal Matching Pursuit (OMP)

[c0_OMP,ind0_OMP] = omp(x0,G,N,M,sigma);
freq0_OMP = freq_grid(ind0_OMP);

[c1_OMP,ind1_OMP] = omp(x1,G,N,M,sigma);
freq1f_OMP = freq_grid(ind1_OMP);


%% Orthogonal Least Square (OLS)
% Parameters
tau = chisqq(0.95,N);
test = sigma^2 *tau; 

[c0_OLS,ind0_OLS] = ols(G,x0,Inf,test);
freq0_OLS = freq_grid(ind0_OLS);

[c1_OLS,ind1_OLS] = ols(G,x1,Inf,test);
freq1_OLS = freq_grid(ind1_OLS);

%% Amplitudes

amp_c0_MP = abs(c0_MP);
amp_c1_MP = abs(c1_MP);

amp_c0_OMP = abs(c0_OMP);
amp_c1_OMP = abs(c1_OMP);

amp_c0_OLS = abs(c0_OLS);
amp_c1_OLS = abs(c1_OLS);


%% Amplitudes frequences ramenees aux valeurs positives

pos_amp_c0_MP = zeros(M+1); pos_amp_c0_MP(1) = amp_c0_MP(M+1);
pos_amp_c1_MP = zeros(M+1); pos_amp_c1_MP(1) = amp_c1_MP(M+1);

pos_amp_c0_OMP = zeros(M+1); pos_amp_c0_OMP(1) = amp_c0_OMP(M+1);
pos_amp_c1_OMP = zeros(M+1); pos_amp_c1_OMP(1) = amp_c1_OMP(M+1);

pos_amp_c0_OLS = zeros(M+1); pos_amp_c0_OLS(1) = amp_c0_OLS(M+1);
pos_amp_c1_OLS = zeros(M+1); pos_amp_c1_OLS(1) = amp_c1_OLS(M+1);

for k = 1:M
    pos_amp_c0_MP(k) = amp_c0_MP(M+1+k)+amp_c0_MP(M+1-k);
    pos_amp_c1_MP(k) = amp_c1_MP(M+1+k)+amp_c1_MP(M+1-k);
    
    pos_amp_c0_OMP(k) = amp_c0_OMP(M+1+k)+amp_c0_OMP(M+1-k);
    pos_amp_c1_OMP(k) = amp_c1_OMP(M+1+k)+amp_c1_OMP(M+1-k);
    
    pos_amp_c0_OLS(k) = amp_c0_OLS(M+1+k)+amp_c0_OLS(M+1-k);
    pos_amp_c1_OLS(k) = amp_c1_OLS(M+1+k)+amp_c1_OLS(M+1-k);
end