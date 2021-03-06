function enu = wgslla2enu(lat, lon, alt, reflat, reflon, refalt)
% WGSLLA2ENU returns a 3 x 1 vector enu representing the East, North, and Up
% coordinates (in meters) of a point with coordinates represented
% by latitude lat (degrees), longitude lon (degrees), and altitude
% alt (meters above the ellipsoid) in an ENU coordinate system
% located at latitude reflat (degrees), longitude reflon (degrees)
% and altitude above the WGS84 ellipsoid refalt (meters)
% 
% USAGE:
%   enu = wgslla2enu(lat, lon, alt, reflat, reflon, refalt)
%
% Note: requires the functions wgslla2xyz.m and wgsxyz2enu.m
% to be in the same directory
% 

xyz = coordutil.wgslla2xyz(lat, lon, alt);
enu = coordutil.wgsxyz2enu(xyz, reflat, reflon, refalt);

end