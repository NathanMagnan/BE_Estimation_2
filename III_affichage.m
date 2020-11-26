%% Plotting results

%% Comparaison des 3 methodes cas x0
figure(1)

subplot(3,1,1)
plot(freq_grid, amp_c0_MP)
title('MP Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(3,1,2)
plot(freq_grid, amp_c0_OMP)
title('OMP Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(3,1,3)
plot(freq_grid, amp_c0_OLS)
title('OLS Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()

%% Comparaison des 3 methodes cas x1
figure(2)

subplot(3,1,1)
plot(freq_grid, amp_c1_MP)
title('MP Method for x1')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(3,1,2)
plot(freq_grid, amp_c1_OMP)
title('OMP Method for x1')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(3,1,3)
plot(freq_grid, amp_c1_OLS)
title('OLS Method for x1')
xlabel('Frequency')
ylabel('Amplitude')
grid()

%% Sur les frequences positives

d = floor(0.5*M);
u = floor(0.9*M);

%% Comparaison des 3 methodes avec valeurs reelles cas x0
figure(3)

subplot(1,3,1)
plot(freq_grid(M+1+d:M+1+u), pos_amp_c0_MP(d:u),'b',[f_th(1) f_th(1)],[0 A_th(1)],'r') 
title('MP Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(1,3,2)
plot(freq_grid(M+1+d:M+1+u), pos_amp_c0_OMP(d:u),'b',[f_th(1) f_th(1)],[0 A_th(1)],'r') 
title('OMP Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()

subplot(1,3,3)
plot(freq_grid(M+1+d:M+1+u), pos_amp_c0_OLS(d:u),'b',[f_th(1) f_th(1)],[0 A_th(1)],'r') 
title('OLS Method for x0')
xlabel('Frequency')
ylabel('Amplitude')
grid()


%% Comparaison des 3 methodes avec valeurs reelles cas x1
figure(4)
subplot(2,1,1)
plot(freq_grid(d:u), amp_c1_OLS(d:u),'r',[f_th(1) f_th(1)],[0 A_th(1)],'g',[f_th(2) f_th(2)],[0 A_th(2)],'g',[f_th(3) f_th(3)],[0 A_th(3)],'g',[f_th(4) f_th(4)],[0 A_th(4)],'g',[f_th(5) f_th(5)],[0 A_th(5)],'g') 
grid()


%% Comparaison des donnees estimees aux donnees reelles