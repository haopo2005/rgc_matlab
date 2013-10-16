function eul = quat2eul123(q)

% INPUTS:
%   q: [qx;qy;qz;qw]
% OUTPUTS:
%   eul: [x;y;z]
% Uses Tait-Bryan ( ZYX / 123 ) convention
% 

q1 = q(1); % x
q2 = q(2); % y
q3 = q(3); % z
q4 = q(4); % w

eul = [...
  atan2( 2*q2*q3+2*q4*q1 , q3^2-q2^2-q1^2+q4^2) ; ... % x
  -asin( 2*q1*q3 - 2*q4*q2 ) ; ...                    % y
  atan2( 2*q1*q2+2*q4*q3 , q1^2+q4^2-q3^2-q2^2 ) ] ;  % z