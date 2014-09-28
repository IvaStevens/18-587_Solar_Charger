function [ cosTI ] = coincidence_angle(day, ts, phi, gamma, B )
%coincidence_angle calculates the coincidence angle between plane of solar
%panel and the sun. Equations from www.powerfromthesun.net
% Input
%   ts = time (hours)
%   B = tilt angle (degrees)
%   gamma = aperature azimuth angle (degrees)
%   phi = observing latitude (degrees)
%   day = day of the year (Jan 1 = 1)
% Output
%   cosTI  = cosine of the angle of incidence (degrees)

% delta = sun declintion
delta = asind(sind(23.45)*sind((360/365)*(day-81)));

%Equation 3.1
% omega = hour angle (hours)
omega = 15*(ts-12);

%Equation 3.17
% a = solar altitude angle (degrees) 
a = asind(sind(delta)*sind(phi) + cosd(delta)*cosd(omega)*cosd(phi)) ;

%Equation 3.19
% A = Solar azimuth (degrees)
A0 = acosd((sind(delta)*cosd(phi)-cosd(delta)*cosd(omega)*sind(phi))/cosd(a));
if sind(omega) > 0
    A = 360-A0;
else
    A = A0;
end

cosTI = sqrt(1 - (cosd(a+B)-cosd(B)*cosd(a)*(1-cosd(A-gamma)))^2);

end

