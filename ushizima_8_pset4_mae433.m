%% MAE433           PSET #4             USHIZIMA, I.

% 8D (3.6d)

clc
clear
close all

% Constants
ki = 56;
kp = 6.5;
K = 2;
tau = 2;

% Transfer Functions
s = tf("s");
PI = kp + (ki/s); % tf for controller
P = K/(1+tau*s); % tf for plant

% FWD GAIN / 1 + LOOP GAIN
H = PI*P/(1+PI*P); % tf for closed loop system
Sig = tf(1,1); % tf of signal, for reference

subplot(2,1,1)
step(H) % plot step response
hold on
step(Sig) % plot signal (for reference)
grid minor
title('Step Response: k_{p} = 6.5, k_{i} = 56');

subplot(2,1,2) % TRY AGAIN, ACCOUNTING FOR EXTRA OVERSHOOT DUE TO ZERO

ki = 130;
kp = 20;
PI = kp + (ki/s); % NEW tf for controller
H = PI*P/(1+PI*P); % tf for closed loop system
Sig = tf(1,1); % tf of signal, for reference

step(H) % plot step response
hold on
step(Sig) % plot signal (for reference)
ylim([0 1.5])
grid minor
title('Step Response: k_{p} = 20, k_{i} = 130');
