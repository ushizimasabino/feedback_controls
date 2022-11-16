function [w,zeta,sigma] = SecondOrderFit(varargin)
% Estimate Second-Order System Parameters from Step Response
% =========================================================================
% Author: Iris Ushizima (isabino@princeton.edu)
% Date:   16 Nov, 2022
% =========================================================================
% [w,zeta,sigma] = SecondOrderFit(data) uses linear & exponential fit to
% estimate the natural frequency, damping ratio, and real part from an
% array of step response data:
%               data(nx2) = [time amplitude]
% 
% [w,zeta,sigma] = SecondOrderFit(time, amplitude) uses linear & 
% exponential fit to estimate the natural frequency, damping ratio, and 
% real part from two column vectors with time and amplitude data
%               time(nx1)           amplitude(nx1)
%
% [w,zeta,sigma] = SecondOrderFit(timestep, data) uses linear & 
% exponential fit to estimate the natural frequency, damping ratio, and 
% real part from an array of step response data given a known time
% step/increment
%               timestep = # (s)    data(nx1)
%
% w [=] rad/s
% =========================================================================
% [w,zeta,sigma] = SecondOrderFit(varargin)

if varargin == 1
    data = varargin{1};
    t = data(:,1);
    y = data(:,2);

    [peaks, locations] = findpeaks(y);
    n = 1:1:size(locations,1);
    p = polyfit(n,locations,1);

    timestep = t(2,1) - t(1,1);
    T = p(1) * timestep;
    w = 2*pi/T;
    zeta = 
elseif isa(varargin{1},"double")
else 
end