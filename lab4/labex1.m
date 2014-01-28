% Lab 4 Question #1

Io = 1;
l = 8.75;               % length of antenna (cm)
r = 1;                  % distance (m)
eta = 120*pi;

lambda1 = 17.5;
lambda2 = 14;
lambda3 = 11.67;

k1 = (2*pi)/lambda1;	% wave number
k2 = (2*pi)/lambda2;	% wave number
k3 = (2*pi)/lambda3;	% wave number

theta = 0:0.01:2*pi;

for i = 1:1:length(theta)
    
    if(theta(i) == 0 || theta(i) == pi || theta(i) == 2*pi)
        E1(i) = 0;
        E2(i) = 0;    
        E3(i) = 0;
    else
        E1(i) = 1i*((eta*Io)/(2*pi*r*sin(theta(i)))) * exp(-1i*k1*r) .* ...
        (cos(k1*l*cos(theta(i))) - cos(k1*l));
    
        E2(i) = 1i*((eta*Io)./(2*pi*r*sin(theta(i)))) * exp(-1i*k2*r) .* ...
        (cos(k2*l*cos(theta(i))) - cos(k2*l));
    
        E3(i) = 1i*((eta*Io)./(2*pi*r*sin(theta(i)))) * exp(-1i*k3*r) .* ...
        (cos(k3*l*cos(theta(i))) - cos(k3*l));

    end
end

figure(1);
polar(theta, abs(E1), 'r');
    
figure(2);
polar(theta, abs(E2), 'b');

figure(3);
polar(theta, abs(E3), 'g');
    