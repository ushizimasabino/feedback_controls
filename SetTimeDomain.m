function [w,zeta,sigma] = SetTimeDomain(Tr,Mp,Ts)
% Gives Natural Frequency, Damping Ratio and Real Part to Satisfy TD Specs
% =========================================================================
% Author: Iris Ushizima (isabino@princeton.edu)
% Date:   16 Nov, 2022
% =========================================================================
% Tr = rise time (s)
% Mp = overshoot (%)
% Ts = settling time (s)
% w = natural frequency
% zeta = damping ratio
% sigma = real part of poles
% =========================================================================
% [w,zeta,sigma] = SetTimeDomain(Tr,Mp,Ts)

zeta = sqrt(ln(Mp)^2 / ( pi^2 + ln(Mp)^2));
if zeta == 1 || zeta >= 0.9
    w = 3.3/Tr;
elseif zeta >= 0.6
    w = 2.2/Tr;
else
    w = 1.6/Tr;
end

sigma = zeta * w;

% Next Edit:
% varargin:
% Mp & Ts (calculate w)
% Mp & Tr (calculate sigma)
% Ts & Tr (calculate zeta)
% default to Mp & Ts???

% include option to display characteristic equation?

% GetTimeDomain
