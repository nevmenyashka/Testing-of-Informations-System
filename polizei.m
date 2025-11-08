function dzdt = polizei(t, z)
global M K B V0 H L

% Профиль препятствия
s = V0 * t;
if s <= L
    x = H/2 * (1 - cos(2*pi*s/L));
    xdot = H/2 * (2*pi*V0/L) * sin(2*pi*s/L); % dx/dt
else
    x = 0;
    xdot = 0;
end

% Система: z(1) = y, z(2) = dy/dt
dzdt = zeros(2,1);
dzdt(1) = z(2);
dzdt(2) = -(B/M)*(z(2) - xdot) - (K/M)*(z(1) - x);
end