clc
global M K B V0 H L
M = 980;
K = 20000;
B = 7300;
z10 = 0;
z20 = 0;
accel = zeros(1000);
i = 1;
V0 = 20;
H = 0.05;
L = 0.8;
%L/V0-время движения по неровности
tmax = 2*L/V0;
z0 = [z10; z20];
dt = [0 tmax];
dt = 0:tmax/500:tmax;
ii = 0;
aa = zeros(1000,1);
opt = odeset('RelTol', 1e-8);
[t z] = ode45(@polizei, dt, z0, opt);
subplot(2,2,1)
plot(t,z(:,1))
title('displacement')
grid on
subplot(2,2,2)
plot(t,z(:,2))
title('velocity')
grid on
subplot(2,2,3)
plot(t,aa(1:size(t)))
grid on
% построение графика ускорения
[p n] = size(z);
i=1
accel = zeros(1,p);
i=1;
a = ones(p);
tt = 0
zf = zeros(2,1);
zf = z0
while i < p
a = polizei(tt, zf);
accel(i) = a(2);
i = i+1;
tt = tt + tmax/p;
zf=[z(i,1); z(i,2)];
end