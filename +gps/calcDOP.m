function [HDOP, VDOP, PDOP, TDOP, GDOP] = calcDOP(H)

% 
% 
% INPUTS:
%   H: Geometry Matrix
% 


H_tilde = inv(H'*H);

HDOP = sqrt(H_tilde(1,1) + H_tilde(2,2));
VDOP = sqrt(H_tilde(3,3));
PDOP = sqrt(H_tilde(1,1) + H_tilde(2,2) + H_tilde(3,3));
TDOP = sqrt(H_tilde(4,4));
GDOP = sqrt(trace(H_tilde));

end