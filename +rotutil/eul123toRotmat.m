function R = eul123toRotmat(varargin)
%% ROTATE3 creates rotation matrices given the 3-axis rotation angles (eulerian)
% Rotate first about the x-axis, then the y-axis, and finally about the
% z-axis.
% 
% z-y-x / 1-2-3 orientation convention (Tait-Bryan angles, IEEE 1278.1-1995)
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
% Author: Robert Cofield
% 

if nargin == 2
    x = varargin{1}(1);
    y = varargin{1}(2);
    z = varargin{1}(3);
    units = varargin{2};
elseif nargin == 4
    x = varargin{1}; y = varargin{2}; z = varargin{3};
    units = varargin{4};
end

if strcmp(units,'deg')
    x = deg2rad(x);
    y = deg2rad(y);
    z = deg2rad(z); 
elseif ~strcmp(units,'rad')
    error('need "rad" or "deg" for units');
end
    
R = rotutil.R1(x) * rotutil.R2(y) * rotutil.R3(z);
    
% end

end