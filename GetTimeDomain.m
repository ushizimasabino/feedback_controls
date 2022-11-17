function [Mp,Tr,Ts] = GetTimeDomain(w,zeta,varargin)
% Gives Time Domain Specifications for Natural Frequency, Damping Ratio and
% Real Part
% =========================================================================
% Author: Iris Ushizima (isabino@princeton.edu)
% Date:   16 Nov, 2022
% =========================================================================
% [Mp,Tr,Ts] = GetTimeDomain(w,zeta) will output the overshoot, rise time
% and settling time for the given natural frequency and damping ratio
% 
% [Mp,Tr,Ts] = GetTimeDomain(w,zeta,show) will output the overshoot, rise
% time and settling time for the given natural frequency and damping ratio
% and display the Time Domain Specifications
% 
% Mp = overshoot (%)
% Tr = rise time (s)
% Ts = settling time (s)
% w = natural frequency
% zeta = damping ratio
% =========================================================================

sigma = w.*zeta;

Mp = exp(-pi*zeta./sqrt(1-zeta.^2));
Ts = log(50)/sigma;
Tr = (1/w).*(2.2*zeta.^2+1.1);

if nargin<0
    fprintf("Mp = %.2f \nTs = %.2f \nTr = %.2f\n",Mp,Ts,Tr);
end