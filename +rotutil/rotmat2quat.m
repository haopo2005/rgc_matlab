function q = rotmat2quat(R)

% q = ROTMAT2QUAT(R) turns a rotation matrix generated using the Tait-Bryan
% (ZYX/123) convention into a quaternion
% 
% INPUTS:
% 
% OUTPUTS:
% 

eul = rotutil.rotmat2eul123(R);
if ~all(rotutil.eul123toRotmat(eul,'rad') == R)
  error('uh oh');
end
q = rotutil.eul123toQuat(eul);

end