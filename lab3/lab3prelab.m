% EECE3441 EMag Lab
% Lab 3 Prelab
% Tim Liming

%% Exercise 2

% Variables	
d = 0.1;        % meters
C = 0.5*10^-12;	% Farads
Z0 = 50;        % ohms
Eeff = 5.0;     % epsilon effective
c = 3*10^8;     % speed of light

for f = (0.3:10:3000)*10^6      % Hz
 
    w = 2*pi*f;                 % omega
    B = (w/c)*sqrt(Eeff)*1i;	% Beta
    
    % Reflection Coefficient (Equation (4))
    rL = (1/(1i*w*C))/((1/(1i*w*C))+2*Z0); 
    
    % Load Impedance (Equation (4))
    ZL = Z0*((1+(rL*exp((-2*B*d))))/(1-rL*exp((-2*B*d))));
    
    % Equation (7)
    Vo_Vi = ((1i*w*C*ZL)/(1+(1i*w*C*ZL))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d);
        
    dB = pow2db(abs(Vo_Vi));    % Convert to dB
    
    % Plot
    figure(1);
    plot(f, dB);
    hold on;
    ylim([-25 5]);
    xlabel('Frequency (MHz)');
    ylabel('|V0/Vi| (dB)');
    
end % for

%% Exercise 3

% Variables	
d = 0.1;        % meters
C = 0.5*10^-12;	% Farads
Z0 = 50;        % ohms
Eeff = 5.0;     % epsilon effective
c = 3*10^8;     % speed of light

for f = (0.3:10:3000)*10^6      % Hz
 
    w = 2*pi*f;                 % omega
    B = (w/c)*sqrt(Eeff)*1i;	% Beta
    
    % Reflection Coefficient (Equation (4))
    rL = (1/(1i*w*C))/((1/(1i*w*C))+2*Z0); 
    
    % Load Impedance (Equation (4))
    ZL = Z0*((1+(rL*exp((-2*B*d))))/(1-rL*exp((-2*B*d))));
    
    % correction for reflected wave
    rL1 = (ZL+(1/(1i*w*C))-Z0)/(ZL+(1/(1i*w*C))+Z0);
    
    % Equation (7)
    Vo_Vi = ((1i*w*C*ZL)/(1+(1i*w*C*ZL))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d) * (1+rL1);
        
    dB = pow2db(abs(Vo_Vi));    % Convert to dB
    
    % Plot
    figure(2);
    plot(f, dB);
    hold on;
    ylim([-25 5]);
    xlabel('Frequency (MHz)');
    ylabel('|V0/Vi| (dB)');
    
end % for

%% Exercise 4

% Variables	
d = 0.1;        % meters
C = 0.2*10^-12;	% Farads
C2 = 0.7*10^-12; % Farads
Z0 = 50;        % ohms
Eeff = 5.0;     % epsilon effective
c = 3*10^8;     % speed of light

for f = (0.3:10:3000)*10^6       % Hz
 
    w = 2*pi*f;                 % omega
    B = (w/c)*sqrt(Eeff)*1i;	% Beta
    
    % Reflection Coefficient (Equation (4))
    rL = (1/(1i*w*C))/((1/(1i*w*C))+2*Z0);
    rL2 = (1/(1i*w*C2))/((1/(1i*w*C2))+2*Z0);
    
    % Load Impedance (Equation (4))
    ZL = Z0*((1+(rL*exp((-2*B*d))))/(1-rL*exp((-2*B*d))));
    ZL2 = Z0*((1+(rL2*exp((-2*B*d))))/(1-rL2*exp((-2*B*d))));
    
    % correction for reflected wave
    rL1 = (ZL+(1/(1i*w*C))-Z0)/(ZL+(1/(1i*w*C))+Z0);
    rL12 = (ZL2+(1/(1i*w*C2))-Z0)/(ZL2+(1/(1i*w*C2))+Z0);
    
    % Equation (7)
    Vo_Vi = ((1i*w*C*ZL)/(1+(1i*w*C*ZL))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d) * (1+rL1);
    Vo_Vi2 = ((1i*w*C2*ZL2)/(1+(1i*w*C2*ZL2))) * ...
            ((1+rL2)/(1+rL2*exp(-2*B*d))) * ...
            ((1i*w*C2*Z0)/(1+(1i*w*C2*Z0))) * ...
            exp(-1*B*d) * (1+rL12);
        
    dB = pow2db(abs(Vo_Vi));    % Convert to dB
    dB2 = pow2db(abs(Vo_Vi2));  % Convert to dB
    
    % Plot
    figure(3);
    plot(f, dB);
    hold on;
    plot(f, dB2);
    ylim([-25 5]);
    xlabel('Frequency (MHz)');
    ylabel('|V0/Vi| (dB)');
    
end % for

%% Exercise 5

% Variables	
d = 0.1;        % meters
C = 0.1*10^-12;	% Farads
Z0 = 50;        % ohms
Eeff = 5.0*(1-0.01*1i);     % epsilon effective
Eeff2 = 5.0*(1-0.03*1i);
Eeff3 = 5.0*(1-0.05*1i);
c = 3*10^8;     % speed of light

for f = (0.3:10:3000)*10^6      % Hz
 
    w = 2*pi*f;                 % omega
    B = (w/c)*sqrt(Eeff)*1i;	% Beta
    B2 = (w/c)*sqrt(Eeff2)*1i;
    B3 = (w/c)*sqrt(Eeff3)*1i;
    
    % Reflection Coefficient (Equation (4))
    rL = (1/(1i*w*C))/((1/(1i*w*C))+2*Z0); 
    
    % Load Impedance (Equation (4))
    ZL = Z0*((1+(rL*exp((-2*B*d))))/(1-rL*exp((-2*B*d))));
    ZL2 = Z0*((1+(rL*exp((-2*B2*d))))/(1-rL*exp((-2*B2*d))));
    ZL3 = Z0*((1+(rL*exp((-2*B3*d))))/(1-rL*exp((-2*B3*d))));
    
    % correction for reflected wave
    rL1 = (ZL+(1/(1i*w*C))-Z0)/(ZL+(1/(1i*w*C))+Z0);
    rL12 = (ZL2+(1/(1i*w*C))-Z0)/(ZL2+(1/(1i*w*C))+Z0);
    rL13 = (ZL3+(1/(1i*w*C))-Z0)/(ZL3+(1/(1i*w*C))+Z0);
    
    % Equation (7)
    Vo_Vi = ((1i*w*C*ZL)/(1+(1i*w*C*ZL))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d) * (1+rL1);
    Vo_Vi2 = ((1i*w*C*ZL2)/(1+(1i*w*C*ZL2))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d) * (1+rL12);
    Vo_Vi3 = ((1i*w*C*ZL3)/(1+(1i*w*C*ZL3))) * ...
            ((1+rL)/(1+rL*exp(-2*B*d))) * ...
            ((1i*w*C*Z0)/(1+(1i*w*C*Z0))) * ...
            exp(-1*B*d) * (1+rL13);
        
    dB = pow2db(abs(Vo_Vi));    % Convert to dB
    dB2 = pow2db(abs(Vo_Vi2));
    dB3 = pow2db(abs(Vo_Vi3));
    
    % Plot
    figure(4);
    plot(f, dB);
    hold on;
    plot(f, dB2);
    hold on;
    plot(f, dB3);
    xlabel('Frequency (MHz)');
    ylabel('|V0/Vi| (dB)');
    
end % for
