classdef quaternion < hgsetget

% QUATERNION Class
% 
% Conventions follow those outlined in:
%   Trawny, N. & Roumeliotis, S. I. 
%   Indirect Kalman Filter for 3D Attitude Estimation
%   University of Minnesota, 2005
% 

properties

  q1
  q2
  q3
  q4


end


%% Public Methods %%
methods

  function obj = quaternion(varargin)
  % Constructor for the QUATERNION object
  %
  % USAGE:
  %
  %   q = QUATERNION([ex,ey,ez]) produces a quaternion using euler angles about
  %   the x, y, and z axes, where [ex,ey,ez] are in radians
  % 
  
  if nargin>0
  

  end


end














end