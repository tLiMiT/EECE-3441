% EECE3441 EMag Lab
% Tim Liming
% Prelab 2

f = 10E3; % Hz
w = 2*pi*f; % omega
lambda = 1; % lambda (will cancel out)
B = 2*pi/lambda; % beta

z = (-2*lambda:0.01:0); % z
t = 0; % time
Vp = 1; % V+
G = -0.2+0.4*1i; % gamma

% Incident voltage
Vi = real(Vp*exp(-1i*B*z+1i*w*t));

% Reflected voltage
Vr = real(Vp*G*exp(1i*B*z+1i*w*t));

figure(1);
plot(z,Vi);
title('Incident Voltage Wave');
xlabel('z');
ylabel('V');

figure(2);
plot(z,Vr);
title('Reflected Voltage Wave');
xlabel('z');
ylabel('V');

figure(3);
plot(z,Vi+Vr);
title('Total Wave');
xlabel('z');
ylabel('V');

