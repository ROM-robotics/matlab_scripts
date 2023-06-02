%%%% PID %%%%
clear; clc;
num = [1];
denominator_ = [1 3 1];

% create transfer function
Gp = tf(num, denominator_);
H = [1];

M = feedback(Gp,H);
step(M);

%%
Kp = 32
Ki = 15
Kd = 11

Gc = pid(Kp,Ki,Kd);

Mc = feedback(Gc*Gp,H);
step(Mc);
%%%% ------------------------------------------------------------------------%%%%