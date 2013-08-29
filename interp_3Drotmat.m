function Ro = interp_3Drotmat(xi, Ri, xo, method)
%% arri = interp3Darray(arr, x, xi) 
%
% Interpolates a 3x3xn array of 3x3 rotation matrices from xi to xo
% 
% INPUTS:
%   xi:
%   Ri:
%   xo:
%   method:
% 
% OUTPUTS:
%   Ro:
%
%%
leni = length(xi);
leno = length(xo);
Ro = zeros(3,3,leno);
ei = zeros(3,leni); % euler angles for input array
eo = zeros(3,leno); % euler angles for output array

% determine input euler angles
for n = 1:leni
  [x,y,z] = solve_rotate3(Ri(:,:,n));
  ei(:,n) = [x;y;z];
end

% find output euler angles
eo(1,:) = interp1(xi, ei(1,:), xo, method, 'extrap');
eo(2,:) = interp1(xi, ei(2,:), xo, method, 'extrap');
eo(3,:) = interp1(xi, ei(3,:), xo, method, 'extrap');

% create output rotation matrices
for n = 1:leno
  Ro(:,:,n) = rotate3(eo(:,n),'rad');  
end

end