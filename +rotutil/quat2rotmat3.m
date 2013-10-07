function C = quat2rotmat3(varargin)

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

if nargin == 1
  x=varargin{1}(1); y=varargin{1}(2); z=varargin{1}(3); w=varargin{1}(4);
elseif nargin == 4
  x=varargin{1}; y=varargin{2}; z=varargin{3}; w=varargin{4};
else
  error('Incorrect # of input arguments');
end

% http://renderfeather.googlecode.com/hg-history/034a1900d6e8b6c92440382658d2b01fc732c5de/Doc/optimized%2520Matrix%2520quaternion%2520conversion.pdf
C = [...
  1 - 2*y^2 - 2*z^2,   2*x*y + 2*w*z,       2*x*z - 2*w*y 
  2*x*y - 2*w*z,       1 - 2*x^2 - 2*z^2,   2*y*z + 2*w*x 
  2*x*z + 2*w*y,       2*y*z - 2*w*x,       1 - 2*x^2 - 2*y^2 
];

% % Lamie-Perbal
% C = [...
%   2*x^2 + 2*y^2 - 1,  2*y*z - 2*x*w,      2*y*w + 2*x*z
%   2*y*z + 2*x*w,      2*x^2 + 2*z^2 - 1,  2*z*w - 2*x*y
%   2*y*w - 2*x*z,      2*z*w + 2*z*y,      2*x^2 + 2*w^2 - 1
% ];

end