% EECE3441 EMag Lab
% Lab 4 Prelab
% Tim Liming

%% Exercise 1

f = 3*10^9;     % operating frequency (Hz)
c = 3*10^8;     % speed of light
lambda = c/f;   % wavelength

r = 20*lambda;  % distance apart
display(r);

%% Exercise 2

I0 = 1;             % current
r = 1;              % (m)
B = 2*pi/lambda;    % beta
n = 120*pi;         % eta
theta = 0:0.01:pi;  % theta

% half-wave antenna (2*l = lambda/2)
l = lambda/4;       % length
E2 = [];            % initialize

for i = 1:numel(theta)
    % Equation 1
    E2 = [E2 (1i*n*I0*exp(-1i*B*r))/(2*pi*r*sin(theta(i)))* ...
             (cos(B*l*cos(theta(i)))-cos(B*l))];
end % for

E2(1) = 0;

% plot
figure(1);
polar(theta,abs(E2));
title('Half-Wave Antenna');

% full-wave antenna (2*l = lambda)
l = lambda/2;       % length
E1 = [];            % initialize

for i = 1:numel(theta)
    % Equation 1
    E1 = [E1 (1i*n*I0*exp(-1i*B*r))/(2*pi*r*sin(theta(i)))* ...
             (cos(B*l*cos(theta(i)))-cos(B*l))];
end % for

E1(1) = 0;

% plot
figure(2);
polar(theta,abs(E1));
title('Full-Wave Antenna');
