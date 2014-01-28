% EECE3441 EMag Lab
% Tim Liming
% Prelab 3

f = 10E3; % Hz (arbitrary frequency)
w = 2*pi*f; % omega
lambda = 1; % lambda (will cancel out)
B = 2*pi/lambda; % beta
z = (-2*lambda:0.01:0); % z
delta_t = 1/20; % time step
Vp = 1; % V+
Zn = 0.5+0.5*1i; % normalized impedance
G = (Zn-1)/(Zn+1); % gamma

for t = (0:delta_t:1)
    % Incident voltage
    Vi = real(Vp*exp(-1i*B*z+1i*w*t));

    % Reflected voltage
    Vr = real(Vp*G*exp(1i*B*z+1i*w*t));
    
%     figure(1);
%     hold on;
%     plot(z,Vi);
%     title('Incident Voltage Wave');
%     xlabel('z');
%     ylabel('V');
% 
%     figure(2);
%     hold on;
%     plot(z,Vr);
%     title('Reflected Voltage Wave');
%     xlabel('z');
%     ylabel('V');

    figure(3);
    hold on;
    plot(z,Vi+Vr);
    title('Total Wave');
    xlabel('z');
    ylabel('V');

end % for