function varargout = calc_azel(userpos, svpos)

% CALC_AZEL finds the azimuth and elevation of each satellite given a user
% position.
% 
% THIS FUNCTION DOESN'T WORK PROPERLY. IT NEEDS REDOING.
% 
% USAGE:
%   ae = CALC_AZEL(userpos, svpos)
%   [az,el] = CALC_AZEL(userpos, svpos)
% INPTUTS:
%   userpos: 1x3 vector of ECEF (x,y,z) user position
%   svpos: Nx3 matrix of ECEF(x,y,z) sv positions
%     rows correspond the individual SV's
% OUTPUTS:
%   - All output angles are in radians
%   ae: [azi1  azi2 ... aziN]
%       [ele1  ele2 ... eleN]
%   az: 1st row of ae
%   el: 2nd row of ae
% DEPENDENCIES:
%   
% 

% TODO check size of inputs

nsv = size(svpos); nsv = nsv(1);

% outputs
az = zeros(1,nsv);
el = zeros(1,nsv);

% vectors from user to sv
svvecs = svpos - repmat(userpos, nsv,1);
% unit vector of user
user_uv = userpos/norm(userpos);

for k = 1:nsv
  sv_onto_user = dot(svpos(k,:),user_uv);
  theta = acos((sv_onto_user-norm(userpos))/norm(svvecs(k,:)));
  el(k) = pi/2 - theta;
  az(k) = 0;
end

if nargout == 1
  varargout{1} = [az;el];
elseif nargout == 2
  varargout{1} = az;
  varargout{2} = el;
else
  error('Output numbers');
end

end