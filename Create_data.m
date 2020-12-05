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
power_mean_y_0 = (x0.' * x0) / N;
power_mean_y_1 = (x1.' * x1) / N;
%sigma_0 = 0;
%sigma_1 = 0;
sigma_0 = 0.1 * power_mean_y_0^(1/2);
sigma_1 = 0.1 * power_mean_y_1^(1/2);
noise_0 = random('Normal', 0, sigma_0, N, 1);
noise_1 = random('Normal', 0, sigma_1, N, 1);
x0 = x0 + noise_0;
x1 = x1 + noise_1;