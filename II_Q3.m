clear 

%% create the data set
Create_data;

%% create f vector from -K to +K
f_0 = [- f_th(1) 0 f_th(1)];

f_th_1 = f_th;
f_th_2 = - fliplr(f_th);
f_1 = [f_th_2 [0] f_th_1];

%% create matrix W
W_0 = exp(2 * pi * j * t * f_0);
W_1 = exp(2 * pi * j * t * f_1);

%% compute ML estimator
c_ML_0 = inv(W_0' * W_0) * W_0' * x0;
c_ML_1 = inv(W_1' * W_1) * W_1' * x1;

%% compute amplitudes and phases from ML estimator
c_ML_0_interesting = c_ML_0(2:3);
A_ML_0 = 2 * abs(c_ML_0_interesting);
p_ML_0 = angle(c_ML_0_interesting);

c_ML_1_interesting = c_ML_1(6:11);
A_ML_1 = 2 * abs(c_ML_1_interesting);
p_ML_1 = angle(c_ML_1_interesting);
