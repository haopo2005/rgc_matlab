function output = DAYCOUNTER(sim_date)
% DAYCOUNTER    Counts the total day sum since the beginning of the year,
%               This function uses DAYSACT which is in R2008 matlab..

    M = sim_date(1);
    D = sim_date(2);
    Y = sim_date(3);

    sim_date_num       = datenum(Y,M,D);
    sim_date_Jan_1_num = datenum(Y,1,1);

    sim_date_str       = datestr(sim_date_num);
    sim_date_Jan_1_srt = datestr(sim_date_Jan_1_num);

    output = daysact(sim_date_Jan_1_srt,sim_date_str) + 1;

end

