function q_star = quat_conj(q)

% q_star = QUAT_CONJ(q) returns the complex conjugate of a quaternion
% INPUTS:
%   q = [qx]
%       [qy]
%       [qz]
%       [qw]
% OUTPUTS
%   

q_star = [-q(1:3);q(4)];