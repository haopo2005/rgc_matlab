function [x,y,z] = solve_rotate3(R)
%% SOLVE_ROTATE3 solves a 3D rotation matrix for its 3 constituent Euler angles
% 
% [x,y,z] = solve_rotate3(R)
% 
% INPUTS:
%   R: 3x3 rotation matrix
% 
% OUTPUTS:
% [x,y,z]: radian angles
%
%%
y = asin(R(1,3));
z = asin(R(1,2)./-cos(y));
x = asin(R(2,3)./-cos(y));

end