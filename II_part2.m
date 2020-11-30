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

%% find the frequency representations of the data vectors
x_f_0 = abs(G' * x0) / N;
x_f_1 = abs(G' * x1) / N;

%% plot the time and frequency representations of the data vector x0
% figure(1);
% plot(t, x0);
% ylim([-1 1]);
% title("time representation of single-frequency non-noisy signal");
% xlabel("time t");
% ylabel("signal x_0");
% 
% figure(2);
% xline(f_th(1), 'k');
% plot(freq_grid(m:2 * m + 1), x_f_0(m:2 * m + 1));
% xlim([26 36]);
% title("frequency representation of single-frequency noisy signal");
% xlabel("frequency f");
% ylabel("signal x^{\^}_0");

%% plot the time and frequency representations of the data vector x1
figure(1);
plot(t, x1);
ylim([-3 3]);
title("time representation of 5-frequency noisy signal");
xlabel("time t");
ylabel("signal x_0");

figure(2);
xline(f_th(1), 'k');
plot(freq_grid(m:2 * m + 1), x_f_1(m:2 * m + 1));
xlim([0 100]);
title("frequency representation of 5-frequency noisy signal");
xlabel("frequency f");
ylabel("signal x^{\^}_0");

%% Plot the spectral window
% Win = abs(G' * ones(N, 1) / N);
% 
% figure(2);
% xline(f_th(1), 'k');
% plot(freq_grid, Win);
% xlim([-10 10]);
% title("Spectral window in the irregular sampling case");
% xlabel("frequency f");
% ylabel("signal");