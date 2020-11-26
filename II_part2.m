clear 

%% create the data set
Create_data;

%% choose the parameters
m = 15000;
nu_max = 500;

%% construct the frequency grid
freq_grid = nu_max * (-m:m) / m;

%% construct matrix G
G = exp(2 * pi * j * t * freq_grid);

%% find the frequency representations of the data vectors
x_f_0 = abs(G' * x0) / N;
x_f_1 = abs(G' * x1) / N;

%% plot the time and frequency representations of the data vector x0
figure(1);
plot(t, x0);
figure(2);
plot(freq_grid(m:2 * m + 1), x_f_0(m:2 * m + 1));