function PlotPhaseMargin(phasemargin,units,range,color,alpha)
% Plots Range of Phase Margins
% =========================================================================
% Author: Iris Ushizima (isabino@princeton.edu)
% Date:   2 Nov, 2022
% =========================================================================
% phasemargin = critical phase margin
% units = "d" for degrees or "r" for radians
% range = "l" for a phase margin less than the critical
%         "g" for a phase margin greater than the critical
% color = RGB vector [R G B] for fill (0 to 256)
% alpha = transparency (0 < alpha < 1)
% =========================================================================
% PlotPhaseMargin(phasemargin,units,range)

r = linspace(0,1);

if range=="g"
    if units=="d"
        p = phasemargin + 180;
        phi = linspace(p,270);
        X = [r.'*cosd(p); cosd(phi.'); zeros(100,1)];
        Y = [r.'*sind(p); sind(phi.'); linspace(-1,0).'];
        fill(X,Y,color/256,'facealpha',alpha)
    elseif units=="r"
        p = phasemargin + pi;
        phi = linspace(p,3*pi/2);
        X = [r.'*cos(p); cos(phi.'); zeros(100,1)];
        Y = [r.'*sin(p); sin(phi.'); linspace(-1,0).'];
        fill(X,Y,color/256,'facealpha',alpha)
    else
        error("Invalid units for phase margin. " + ...
            "Please type d for degrees or r for radians.")
    end
elseif range=="l"
    if units=="d"
        p = phasemargin + 180;
        phi = linspace(180,p);
        X = [linspace(0,-1).'; cosd(phi.'); r.'*cosd(p)];
        Y = [zeros(100,1); sind(phi.'); r.'*sind(p)];
        fill(X,Y,color/256,'facealpha',alpha)
    elseif units=="r"
        p = phasemargin + pi;
        phi = linspace(pi,p);
        X = [linspace(0,-1).'; cos(phi.'); r.'*cos(p)];
        Y = [zeros(100,1); sin(phi.'); r.'*sin(p)];
        fill(X,Y,color/256,'facealpha',alpha)
    else
        error("Invalid units for phase margin. " + ...
            "Please type d for degrees or r for radians.")
    end
else
    error("Invalid range for phase margin. Please type g for a range" + ...
        "greater than or l for a range less than the specified phase margin.")
end