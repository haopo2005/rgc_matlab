function varargout = rotmat2eul123(R)
%% SOLVE_ROTATE3 has been deprecated. See rotmat2eul123
% solves a 3D rotation matrix for its 3 constituent Euler angles according to
% the Tait-Bryan ( Z-Y-X / 1-2-3 ) convention 
% 
% This assumes that the rotation matrix was formed by rotating about the
% axes in x,y,z order. It presents the two possible solutions for the
% matrix. The first solution represents a y rotation that lies in either
% the first or second quandrant. The second solution represents a y
% rotation that lies in either the third or fourth quadrant.
% 
% USAGE:
%   [x,y,z] = rotmat2eul123(R)
%   xyz = rotmat2eul123(R)
% INPUTS:
%   R: 3x3 x,y,z rotation matrix
% OUTPUTS:
%   x,y,z: radian angles
%   xyz: [x;y;z] in radians

if ~all(size(R)==[3 3])
  error('Input matrix size');
end

x = atan2(R(2,3),R(3,3));
y = -asin(R(1,3));
z = atan2(R(1,2),R(1,1));

if nargout == 1
  varargout{1} = [x;y;z];
elseif nargout == 3
  varargout{1} = x;
  varargout{2} = y;
  varargout{3} = z;
else
  error('Incorrect number of output arguments.');
end

end