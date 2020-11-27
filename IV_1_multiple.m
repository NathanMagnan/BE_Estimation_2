clear 

%% create the data set
Create_data;

%% choose the parameters
nu_max = 100;
m = 3 * nu_max * 10;

%% construct the frequency grid
freq_grid = nu_max * (-m:m) / m;

%% construct matrix G
G = exp(2 * pi * j * t * freq_grid);

%% choose parameters
lambda = 0.5;
n_it_max = 10^2;

%% solver and residuals
c1 = min_L2_L1_0(x1, G, lambda, n_it_max);
r1 = x1 - G * c1;
r1_f = abs(G' * r1) / N;

%% frequency representation of the residuals
figure(1)
plot(freq_grid, r1_f);
yline(lambda / N);
xlim([0 100]);
ylim([10^(-4) 1]);
set(gca, 'YScale', 'log');
title("frequency representation of the residuals : multiple frequency signal");
xlabel("frequency f");
ylabel("residuals r");

%% Estimated spectrum
figure(2)
plot(freq_grid, abs(c1));
xlim([25 45]);
title("Estimated spectrum : multiple frequency signal");
xlabel("frequency f");
ylabel("estimated spectrum c");