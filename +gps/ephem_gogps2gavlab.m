function [out, prn, t_oc] = ephem_gogps2gavlab(in)

% EPHEM_GOGPS2GAVLAB takes in an ephemeris navigation data matrix output by
% the goGPS function RINEX_get_nav and rearranges it into the format
% expected by the GAVLab function calc_sv_pos
% 
% INPUTS:
%   in: ephemeris matrix as output by goGPS function RINEX_get_nav
% 
% OUTPUTS:
%   out: ephemeris matrix as expected by GAVLab function calc_sv_pos
%   prn: SV # (1-32) corresponds to columns of out & in

insz = size(in);
out = zeros(21,insz(2));
prn = in(1,:);
t_oc = in(21,:);

rearrange = [...
  28
  21
  2
  20
  19
  10
  11
  8
  9
  14
  15
  5
  3
  6
  4
  18
  16
  12
  7
  17
  13
];

out = in(rearrange,:);

end