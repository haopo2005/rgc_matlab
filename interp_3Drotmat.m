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

leni = length(xi);
leno = length(xo);
Ro = zeros(3,3,leno);
ei = zeros(3,leni); % euler angles for input array
eo = zeros(3,leno); % euler angles for output array

% determine input euler angles
for n = 1:leni
  [x,y,z] = solve_rotate3(Ri(:,:,n)); % will return 2 solution sets
  % use the euler angle solution which has the smallest change between
  % epochs
  if n==1
    x = x(1); y = y(1); z = z(1); % this could probably be done better
  else
    [m, eul_idx] = min(abs( (z+2*pi)-(ei(3,n-1)+2*pi) ));
    x=x(eul_idx); y=y(eul_idx); z=z(eul_idx);
  end
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