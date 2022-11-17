function [w,zeta,sigma] = SetTimeDomain(Mp,Tr,Ts,varargin)
% Gives Natural Frequency, Damping Ratio and Real Part to Satisfy TD Specs
% =========================================================================
% Author: Iris Ushizima (isabino@princeton.edu)
% Date:   16 Nov, 2022
% =========================================================================
% Write x to indicate unspecified parameter
% 
% If all parameters are specified, SetTimeDomain will set Mp & Tr only by
% default
% 
% Mp = overshoot (%)
% Tr = rise time (s)
% Ts = settling time (s)
% w = natural frequency
% zeta = damping ratio
% sigma = real part of poles
% =========================================================================
% [w,zeta,sigma] = SetTimeDomain(Tr,Mp,Ts)
% [w,zeta,sigma] = SetTimeDomain(Tr,Mp,Ts,show)

% Default to Mp & Tr
bool = isa(Mp,"double") && isa(Tr,"double") && isa(Ts,"double");
default = bool;
if default
    Ts = "x";
end

if isa(Mp,"double")
    zeta = sqrt(log(Mp)^2 / ( pi^2 + ln(Mp)^2));
else
    sigma = log(50)/Ts;
    zeta = -0.01;
    test = 2;
    while abs(test)>0.01 % gets within about 1% precision
        zeta = zeta+0.001;
        w = (2.2*zeta^2 + 1.1)/Tr;
        test = sigma-w*zeta;
    end
end

% Mp & Tr given
if isa(Ts,"char")
    w = (2.2*zeta^2 + 1.1)/Tr;
    sigma = zeta * w;
% Mp & Ts given
elseif isa(Tr,"char")
    sigma = log(50)/Ts;
    w = sigma/zeta;
end

if nargin<0
    fprintf("s^2 + %.2f s + %.2f\n",sigma,w^2);
end
