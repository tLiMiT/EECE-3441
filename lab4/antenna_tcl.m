% EECE3441 EMag Lab
% Lab 4 Prelab
% Tim Liming

%% antenna_tcl.m

run setup_rot.m

m = 116;            % number of data points
ang_step = 0.625;   % degrees of rotation per step

run cw.m

% initialize arrays
V = [];
Ang = [];

% gather data
for n = 1:m
    V(n) = readcell(1);
    
    for j = 1:5
        run onerot.m
    end % for

    Ang(n) = j*(n-1)*ang_step;
    pause(1);
end % for

% plot
figure(1);
polar(Ang*(pi/180),V);
title('Voltage vs. Angle');


