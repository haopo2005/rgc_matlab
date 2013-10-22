function r = quat_cross(q,p)

% r = QUAT_CROSS(q,p) returns the quaternion cross-product of 2 quaternions
% INPUTS:
%   q,p: [qx,qy,qz,qw]'
% OUTPUTS:
%   r: [rx,ry,rz,rw]
% 

r = [...
   q(4)*p(1) + q(3)*p(2) - q(2)*p(3) + q(1)*p(4) ; ...
  -q(3)*p(1) + q(4)*p(2) + q(1)*p(3) + q(2)*p(4) ; ...
   q(2)*p(1) - q(1)*p(2) + q(4)*p(3) + q(3)*p(4) ; ...
  -q(1)*p(1) - q(2)*p(2) - q(3)*p(3) + q(4)*p(4) ...
];

end