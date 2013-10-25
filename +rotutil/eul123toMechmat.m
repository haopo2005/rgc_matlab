function E = eul123toMechmat(varargin)

% Generate the mechanization matrix (Euler angle rate matrix), using the ZYX /
% (123) Convention (i.e., Tait-Bryan Angles)
% 
% USAGE:
%   E = eul123toMechmat([x,y,z])
%   E = eul123toMechmat(xyz)
% 

if nargin == 3
  x = varargin{1};
  y = varargin{2};
  z = varargin{3};
elseif nargin == 1
  x = varargin{1}(1);
  y = varargin{1}(2);
  z = varargin{1}(3);
end

E = [...
  cos(y)*cos(z) , -sin(z) , 0 ; ...
  cos(y)*sin(z) ,  cos(z) , 0 ; ...
        -sin(y) ,       0 , 1 ];