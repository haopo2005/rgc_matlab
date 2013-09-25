function day = datevec2doy(mydate)
% Takes a date vector and returns the day of year, known incorrectly in the
% Geophysical community as the julian calender day, i.e. 12/31/2005
% is returned as day 365, day 06/22/2010 is returned as 173, etc... The
% function is vectorized. This function needs etime.m (R2009a and later).
% 
% USAGES
% julday = datevec2doy(mydate)
% 
% INPUT
% mydate:   Either a 6xN or Nx6 array of date vectors, as output by
%           functions like datevec.
% 
% OUTPUT
% julday:   An Nx1 array of julian days.
% 
% -----------------------------------------------------------------------
% EXAMPLE
% %Take the current day and add normally distributed random days to the
% %date.
% 
% tadd          = randn(1,12);
% mydate        = datevec(now)';
% mydate        = repmat(mydate,1,12);
% mydate(2,:)   = mydate(2,:) + tadd;
% day           = datevec2doy(mydate);
% -----------------------------------------------------------------------
% Latest Edit: 24.June.2010
% Joshua D Carmichael
% josh.carmichael@gmail.com
%-----------------------------------------------------------------------
% Copyright (c) 2010, Joshua Carmichael
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
% 

[M,N]   = size(mydate);
ind     = [M,N]==[6,6];

if( nnz(ind) < 1 )
    
    error('MATLAB:datevec2doy', 'Input is not in date vector format');
    
end;

if(ind(1))
    
    mydate = mydate';
    
end;

doy         = mydate;
doy(:,2:3)  = 1;
doy(:,4:6)  = 0;

if(length(mydate) <= 6)
    
    day         = 1+floor(etime(mydate,doy)./(3600*24));
    
elseif(length(mydate) > 6)
    
    A       = mat2cell(doy,ones(size(doy,1),1),6);
    B       = mat2cell(mydate,ones(size(doy,1),1),6);
    dt      = cellfun(@etime,B,A);
    day     = 1+floor((dt)./(3600*24));
    
else
    
    error('Matlab:etime','Not a date format');
    
end;

return