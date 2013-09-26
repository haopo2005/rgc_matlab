function idx = first_norm_gt(data, thold)

% DESCRIPTION find the first column in which the 2 norm of the rows is
% greater than some threshold
% 
% INPUT
%   data: 2xn or 3xn
%   thold: threshold
% 
% OUTPUT:
%   idx: where the the first  occurence is; 0 if none

sz = size(data);
for idx = 1:sz(2)
  mag = norm(data(:,idx),2);
  if mag > thold
    return
  end
end
idx = 0; % none found
return

end