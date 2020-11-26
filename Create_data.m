%% Load the time samples and the parameters
load data.mat

%% create the data
x0 = A_th(1) * cos(2 * pi * f_th(1) * t + phi_th(1));
x1 = A_th(1) * cos(2 * pi * f_th(1) * t + phi_th(1));
for i = 2:5
    x1 = x1 + A_th(i) * cos(2 * pi * f_th(i) * t + phi_th(i));
end

%% add the noise
s = size(t);
N = s(1);
power_mean_y = (y.' * y) / N;
sigma = 0.1 * power_mean_y^(1/2);
%sigma = 0;
noise = random('Normal', 0, sigma, N, 1);
x0 = x0 + noise;
x1 = x1 + noise;