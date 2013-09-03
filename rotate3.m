function R = rotate3(varargin)
%% ROTATE3 creates rotation matrices given the 3-axis rotation angles (eulerian)
% Rotate first about the x-axis, then the y-axis, and finally about the
% z-axis.
% 
% USAGE:
%   R = rotate3(x,y,z, units)
%   R = rotate3([x,y,z], units)
% 
% INPUT:
%   units: either 'deg' or 'rad'
%   x,y,z: double
%
% TODO:
%   - length checking for inputs - do 3-D arrays of output

if nargin == 2
    xyz = varargin{1}; x = xyz(1); y = xyz(2); z = xyz(3);
    units = varargin{2};
elseif nargin == 4
    x = varargin{1}; y = varargin{2}; z = varargin{3};
    units = varargin{4};
end

if strcmp(units,'deg')
    x = rad(x); y = rad(y); z = rad(z); 
elseif strcmp(units,'rad')
    %
else
    error('need "rad" or "deg" for units');
end

% len = length(y);
% if length(x) ~= len || len ~= length(z)
%     error ('need vector inputs of equal lengths');
% end
% 
% if len > 1
%     
%     Rx = zeros(3,3,len);
%     Rx(1,1,:) = ones(1,1,len);
%     Rx(2,2,:) = cos(x);
%     Rx(2,3,:) = -sin(x);
%     Rx(3,2,:) = sin(x);
%     Rx(3,3,:) = cos(x);
% 
%     Ry = zeros(3,3,len);
%     Ry(1,1,:) = cos(y);
%     Ry(1,3,:) = sin(y);
%     Ry(2,2,:) = ones(1,1,len);
%     Ry(3,1,:) = -sin(y);
%     Ry(3,3,:) = cos(y);
% 
%     Rz = zeros(3,3,len);
%     Rz(1,1,:) = cos(z);
%     Rz(1,2,:) = -sin(z);
%     Rz(2,1,:) = sin(z);
%     Rz(2,2,:) = cos(z);
%     Rz(3,3,:) = ones(1,1,len);
%     
%     warning('unfinished function');
% 
% else
    
Rx = [1 0 0; 0 cos(x) -sin(x); 0 sin(x) cos(x)];
Ry = [cos(y) 0 sin(y); 0 1 0; -sin(y) 0 cos(y)];
Rz = [cos(z) -sin(z) 0; sin(z) cos(z) 0; 0 0 1];

R = Rz*Ry*Rx;
    
% end

end