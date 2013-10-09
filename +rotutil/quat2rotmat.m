function C = quat2rotmat(varargin)

% Calculates the 3x3 rotation matrix corresponding to an input quaternion
% 
% Uses the quaternion convention outlined in Trawny, 2005
%   [q1 q2 q3 q4]' = [x y z w]'
% 
% Note that there are two other possible methods for calculating this.
%
% USAGE:
%   C = quat2rotmat3(x,y,z,w)
%   C = quat2rotmat3([x,y,z,w])
% 
% INPUTS:
%   x,y,z: unit vector describing rotation axis
%   w: rotation (rad) about x,y,z rotation axis
% 
% OUTPUT:
%   C: 3x3 rotation matrix
% 
% @author Robert Cofield
% @data 2013-10-08

if nargin == 1
  x=varargin{1}(1); y=varargin{1}(2); z=varargin{1}(3); w=varargin{1}(4);
elseif nargin == 4
  x=varargin{1}; y=varargin{2}; z=varargin{3}; w=varargin{4};
else
  error('Incorrect # of input arguments');
end

C = [...
  1 - 2*y^2 - 2*z^2,   2*x*y + 2*w*z,       2*x*z - 2*w*y 
  2*x*y - 2*w*z,       1 - 2*x^2 - 2*z^2,   2*y*z + 2*w*x 
  2*x*z + 2*w*y,       2*y*z - 2*w*x,       1 - 2*x^2 - 2*y^2 
];

end