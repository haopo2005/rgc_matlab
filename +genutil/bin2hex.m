function hex = bin2hex(bin)
% hex = bin2hex(bin)
% 
% BIN2HEX turns binary data (0 or 1) into dexadecimal
% 
% INPUTS:
%   bin: [1 x n] vector of zeros and/or ones
% 
% OUTPUTS:
%   hex: [1 x n/8 string of hexadecimal bytes
% 
% USAGE:
%   h = bin2hex(ones(1,8)) --> 'FF'
% 
hex = dec2hex(bin2dec(num2str(bin)));
end