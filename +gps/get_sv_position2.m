function [svpos,svvel,svclk,svprns]=get_sv_position2(ephem_in,psr_in)

%Shove inputs into vectors to make things easier later
eph(:,:,1)=ephem_in;
psr(:,1)=psr_in;

%IMPORTANT: Change 'semi major axis' to 'square root of semi major axis'
%because SV position calculation algorithm requires the square root and
%NovAtels give the actual value.
eph(15,:,:)=eph(15,:,:).^(1/2);


c=299792458;  %Speed of light... that's fast!

svpos=NaN(3,32);
svvel=NaN(3,32);
svclk=NaN(32,1);
j=1;

for sv=1:32
	
	%Check time of ephemeris, use latest one
% 	[toe,rcvr]=max([eph(16,sv,1),eph(16,sv,2)]);
	rcvr=1;
	toe=eph(16,sv,rcvr);

	%If ephemerides exist, toe will be a real number
	if ~isnan(toe) % && (sv~=15) % && (sv~=2) % && (sv~=30) % && (sv~=18)
		%Calculate transit time (pseudorange/speed of light)
		transitTime=psr(sv,rcvr)/c;

		%Calculate transmit time (current time - transmit time)
		transmitTime=psr(33,rcvr)/1000-transitTime;  % ms/1000 - s

		%Calculate SV position
		[svpos(:,sv),svvel(:,sv),svclk(sv,:)]=calc_sv_pos2(eph(:,sv,rcvr),transmitTime,transitTime);
		
        %Create vector containing PRN numbers with calculated positions
		svprns(j)=sv;
        %Remove sats for pdop comparison
        j=j+1;
        
    else
		%Set position to NaN if no ephemerides are available
		svpos(:,sv)=NaN;
	end

end
