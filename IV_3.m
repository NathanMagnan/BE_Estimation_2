clear 

%% create the data set
Create_data;

%% create f vector from -K to +K
f_1 = [-36.6 -35.5 -34.6 -33.2 -32.3 -31.2 -29.2 0 29.2 31.2 32.3 33.2 34.6 35.5 36.6];

%% create matrix W
W_1 = exp(2 * pi * j * t * f_1);

%% compute ML estimator
c_ML_1 = inv(W_1' * W_1) * W_1' * x1;

%% compute amplitudes and phases from ML estimator

c_ML_1_interesting = c_ML_1(8:15);
A_ML_1 = 2 * abs(c_ML_1_interesting);
p_ML_1 = angle(c_ML_1_interesting);