function q = eul123toQuat(eul)

% Tait-Bryan Euler Angles to unit quaternion
% INPUTS:
%   eul: [x;y;z] in radians
% OUTPUTS:
%   q: [qx;qy;qz;qw]

x = eul(1);
y = eul(2);
z = eul(3);

qx = sin(x/2)*cos(y/2)*cos(z/2) - cos(x/2)*sin(y/2)*sin(z/2);
qy = cos(x/2)*sin(y/2)*cos(z/2) + sin(x/2)*cos(y/2)*sin(z/2);
qz = cos(x/2)*cos(y/2)*sin(z/2) - sin(x/2)*sin(y/2)*cos(z/2);
qw = cos(x/2)*cos(y/2)*cos(z/2) + sin(x/2)*sin(y/2)*sin(z/2);

q = [qx; qy; qz; qw];