function Omega = eul2dcm(varargin)

% EUL2DCM returns to Direction Cosine Matrix of a set of 3 euler rotations
% 
% x-y-z orientation convention (Tait-Bryan angles, IEEE 1278.1-1995)
% http://www.sedris.org/wg8home/Documents/WG80485.pdf
% Omega_z = R_z'
% 
% USAGE:
%   R = rotate3(x,y,z, units)
%   R = rotate3([x,y,z], units)
% 
% INPUT:
%   units: either 'deg' or 'rad'
%   x,y,z: double
%
% 
% TODO:
%   - length checking for inputs - do 3-D arrays of output
%   - reevaluate this to make sure it's correct
% Author: Robert Cofield
% 

if nargin == 2
    xyz = varargin{1}; x = xyz(1); y = xyz(2); z = xyz(3);
    units = varargin{2};
elseif nargin == 4
    x = varargin{1}; y = varargin{2}; z = varargin{3};
    units = varargin{4};
end

if strcmp(units,'deg')
    x = rad2deg(x); y = rad2deg(y); z = rad2deg(z); 
elseif strcmp(units,'rad')
    %
else
    error('need "rad" or "deg" for units');
end

OmegaX = [1    0      0;...
          0  cos(x) sin(x);...
          0 -sin(x) cos(x)];

OmegaY = [cos(y) 0 -sin(y);...
          0      1     0;...
          sin(y) 0  cos(y)];

OmegaZ = [cos(z)  sin(z) 0;...
          -sin(z) cos(z) 0;
             0       0   1];

Omega = OmegaX*OmegaY*OmegaZ;

end