% EECE3441 EMag Lab
% Lab 5 Prelab
% Tim Liming

%% Exercise 3

n1 = 1.33;  % water
n2 = 1.00;  % air
theta_t = pi/2;	% radians  (90 degrees)

theta_c = asin((n2/n1)*sin(theta_t));
display(theta_c);

deg = theta_c*(180/pi);
display(deg);

%% Exercise 4

n = 2.0;	% index of refraction
theta_i = (0:0.0001:(pi/2));	% vector of incident angles

for i=1:numel(theta_i)
    r_T(i) = (cos(theta_i(i))-sqrt(n^2-sin(theta_i(i))^2)) ...
            / (cos(theta_i(i))+sqrt(n^2-sin(theta_i(i))^2));
    r_ll(i) = (-n^2*cos(theta_i(i))+sqrt(n^2-sin(theta_i(i))^2)) ...
            / (n^2*cos(theta_i(i))+sqrt(n^2-sin(theta_i(i))^2));
end % for

R_T = abs(r_T).^2;
R_ll = abs(r_ll).^2;

% plots
figure(1);
plot(theta_i,R_T);
title('s-polarized power');
xlabel('theta incident');
ylabel('R_T');

figure(2);
plot(theta_i,R_ll);
title('p-polarized power');
xlabel('theta incident');
ylabel('R_l_l');

%% Exercise 6

for i=1:numel(R_ll)
    if R_ll(i) == min(R_ll);
        ang = theta_i(i);
    end % if
end % for

display(ang);

% Brewster angle
theta_B = atan(n);
display(theta_B);

%% Exercise 7

nt = 2-0.1*1i;	% index of refraction
nt2 = 2-1.0*1i;
theta_i = (0:0.0001:(pi/2));	% vector of incident angles

for i=1:numel(theta_i)
    r_Tc(i) = (cos(theta_i(i))-sqrt(nt^2-sin(theta_i(i))^2)) ...
            / (cos(theta_i(i))+sqrt(nt^2-sin(theta_i(i))^2));
    r_llc(i) = (-nt^2*cos(theta_i(i))+sqrt(nt^2-sin(theta_i(i))^2)) ...
            / (nt^2*cos(theta_i(i))+sqrt(nt^2-sin(theta_i(i))^2));
    
    r_Tc2(i) = (cos(theta_i(i))-sqrt(nt2^2-sin(theta_i(i))^2)) ...
            / (cos(theta_i(i))+sqrt(nt2^2-sin(theta_i(i))^2));
    r_llc2(i) = (-nt2^2*cos(theta_i(i))+sqrt(nt2^2-sin(theta_i(i))^2)) ...
            / (nt2^2*cos(theta_i(i))+sqrt(nt2^2-sin(theta_i(i))^2));
end % for

R_Tc = abs(r_Tc).^2;
R_llc = abs(r_llc).^2;

R_Tc2 = abs(r_Tc2).^2;
R_llc2 = abs(r_llc2).^2;

% plots
figure(3);
plot(theta_i,R_Tc);
hold on;
plot(theta_i,R_Tc2,'-r');
title('s-polarized power');
xlabel('theta incident');
ylabel('R_T');
legend('nt = 2-0.1j','nt = 2-1j','Location','NorthWest');

figure(4);
plot(theta_i,R_llc);
hold on;
plot(theta_i,R_llc2,'-r');
title('p-polarized power');
xlabel('theta incident');
ylabel('R_l_l');
legend('nt = 2-0.1j','nt = 2-1j','Location','NorthWest');

%% Exercise 9

n = sqrt(11.7);   % sqrt(E/E0)

% Brewster angle
theta_B2 = atan(n);
display(theta_B2);
