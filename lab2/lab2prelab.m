% EECE3441 EMag Lab
% Lab 2 Prelab
% Tim Liming

%% Question 1

C = 9E-12;  % 9 pF
Z0 = 50;    % 50 Ohm
f1 = 0.3E6; % 0.3 MHz
f2 = 3E9;   % 3 GHz
w1 = 2*pi*f1;
w2 = 2*pi*f2;

Zc1 = 1/(1i*w1*C);
Zc2 = 1/(1i*w2*C);

ZL1 = Zc1/Z0 % @0.3 GHz
ZL2 = Zc2/Z0 % @3 GHz

%% Question 2

R = 50;     % 50 Ohm
C = 9E-12;  % 9 pF
f = 1E9;    % 1 GHz
w = 2*pi*f;
Zc = 1i*w*C;
ZL = (1/50)-(1/Zc)-(1/50);

L = ZL/(1i*w) % H

%% Question 3

f = 0.3E9;  % 0.3 GHz

% Show the following loads on a Smith Chart:
% A - Short Circuit
dataA = z2gamma(0+1i*0);
% B - Matched Load (Z=50)
dataB = z2gamma(50+1i*0);
% C - Open Circuit
dataC = z2gamma(Inf+1i*0);
% D - 7.5 Ohm Resistor
dataD = z2gamma(7.5+1i*0);
% E - 50uH Inductor
dataE = z2gamma(0+1i*2*pi*f*50E-6);
% F - mag: 0.5 & ang: +120 deg
dataF = z2gamma(21.4+1i*24.7);

% Plot
smithchart(dataA);
hold on
smithchart(dataB);
hold on
smithchart(dataC);
hold on
smithchart(dataD);
hold on
smithchart(dataE);
hold on
smithchart(dataF);
% legend('A','B','C','D','E','F','Location', 'NorthEastOutside');

%% Question 4

c = 3E10; % speed of light (cm)
fa = 3E9; % 3 GHz
lambda1 = c/fa;
Er = 2.5/8.85E-12;
lambda2 = lambda1/sqrt(Er);
elec_length = 20/(lambda2) % cm
