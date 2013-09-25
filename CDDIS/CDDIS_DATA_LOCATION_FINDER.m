function output = CDDIS_DATA_LOCATION_FINDER(sim_date)
%CDDIS_DATA_LOCATION_FINDER     Finds 3 locations to download data from, 
%                               The locations are depenedent on the date,
%                               since there will be different sites
%                               collecting data each day.

    M        = sim_date(1);
    D        = sim_date(2);
    Y        = sim_date(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---o---CDDIS DATA CENTERS---o---o---o---o---o---o---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if Y == 1992
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1993
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1994
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1995
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1996
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1997
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1998
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 1999
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2000
        monu(1,:)       = 'bjfs';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2001
        monu(1,:)       = 'bjfs';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2002
        monu(1,:)       = 'bjfs';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2003
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2004
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2005
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2006   
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2007
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2008
        monu(1,:)       = 'artu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';                               
    elseif Y == 2009
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2010
        monu(1,:)       = 'novm';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'pre1';
    elseif Y == 2011
        monu(1,:)       = 'brmu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'nrl1';
    elseif Y == 2012
        monu(1,:)       = 'brmu';
        monu(2,:)       = 'mdo1';
        monu(3,:)       = 'nrl1';
    end
    output(1:3,:) = monu;
    
end
   