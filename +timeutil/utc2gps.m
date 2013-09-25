function date1 = utc2gps(date0)
%UTC2GPS Convert UTC(GMT) time tags to GPS time accounting for leap seconds
%   UTC2GPS(date) corrects an array of UTC dates(in any matlab format) for
%   leap seconds and returns an array of GPS datenums where:
%   GPS = UTC + steptime
%   Currently step times are through Jan 1 2009, but need to be added below
%   as they are instuted. All input dates must be later than the start of
%   GPS time on Jan 6 1980 00:00:00
%
%	See also GPS2UTC.
% 
%   Copyright 2008 Ian M. Howat, ihowat@gmail.com
%   $Version: 1.0 $  $Date: 23-Aug-2008 13:56:44 $
% 
% Copyright (c) 2009, Ian Howat
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

%% ADD NEW LEAP DATES HERE:
stepdates = {...
    'Jan 6 1980';...
    'Jul 1 1981';...
    'Jul 1 1982';...
    'Jul 1 1983';...
    'Jul 1 1985';...
    'Jan 1 1988';...
    'Jan 1 1990';...
    'Jan 1 1991';...
    'Jul 1 1992';...
    'Jul 1 1993';...
    'Jul 1 1994';...
    'Jan 1 1996';...
    'Jul 1 1997';...
    'Jan 1 1999';...
    'Jan 1 2006';...
    'Jan 1 2009';...
    'Jun 30 2012'};

%% Convert Steps to datenums and make step offsets
stepdates = datenum(stepdates)'; %step date coversion
steptime = (0:length(stepdates)-1)'./86400; %corresponding step time (sec)

%% Arg Checking
if ~isnumeric(date0) %make sure date0 are datenums, if not try converting
    date0 = datenum(date0); %will error if not a proper format
end

if ~isempty(find(date0 < stepdates(1)))%date0 must all be after GPS start date
    error('Input dates must be after 00:00:00 on Jan 6th 1980') 
end

%% Array Sizing
sz = size(date0);
date0 = date0(:);

date0 = repmat(date0,[1 size(stepdates,2)]);
stepdates = repmat(stepdates,[size(date0,1) 1]);

%% Conversion
date1 = date0(:,1)   + steptime(sum((date0 - stepdates) >= 0,2));

%% Reshape Output Array
date1 = reshape(date1,sz);



