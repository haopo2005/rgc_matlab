function output = CDDIS_FTP_DOWNLOAD(sim_date)
% CDDIS_FTP_DOWNLOAD    Downloads three zipped files from the CDDIS via FTP 
%                       that contain ephemeris data for the given date.
%
%                       Uses the followind Function Files
%                       CDDIS_DATA_LOCATION_FINDER
%                       CDDIS_INFO
%                       DAYCOUNTER

  % Date Input
    M        = sim_date(1);
    D        = sim_date(2);
    Y_comp_n = sim_date(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---o---CDDIS DATA CENTERS---o---o---o---o---o---o---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    monu      = CDDIS_DATA_LOCATION_FINDER(sim_date);
    monu_info = CDDIS_INFO(monu);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---Determining File Names---o---o---o---o---o---o---
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Determining Filenames...........\n\n')

% Formating Date Numbers

%     sim_date_str = datestr(DATENUM(Y_comp_n,M,D),22);
    sim_date_str = datestr(datenum(Y_comp_n,M,D),22);
    
    if Y_comp_n >= 2000
        Y = Y_comp_n - 2000;    
    else
        Y = Y_comp_n - 1900;
    end

    Day_count = DAYCOUNTER([M,D,Y_comp_n]);

    M         = num2str(M);  
    D         = num2str(D);
    Y_comp    = num2str(Y_comp_n);
    Y         = num2str(Y);

  % /ddd formating
    if Day_count < 10
        dd = num2str([0]);
        dd = strcat(dd,dd);
    elseif Day_count < 100 && Day_count >= 10
        dd = num2str([0]);
    elseif Day_count >= 100
        dd = '';
    end

    Day_count = num2str(Day_count);
    Day_count = strcat(dd,Day_count);

  % yyt format
    if Y_comp_n >= 2000 && Y_comp_n < 2010
        yy = num2str([0]);
    elseif Y_comp_n >= 2010
        yy = '';
    elseif Y_comp_n < 2000
        yy = '';
    end

    yy = strcat(yy,Y);

    date_str = strcat(Y_comp,'/',Day_count,'/',yy,'n/');
    
% monu ftp name creator

    [num_monu,cols] = size(monu);

  % Monu Filenames
    monu_filename(1,:) = strcat(monu(1,:),Day_count,'0.',yy,'n');
    monu_filename(2,:) = strcat(monu(2,:),Day_count,'0.',yy,'n');
    monu_filename(3,:) = strcat(monu(3,:),Day_count,'0.',yy,'n');

  % Main url
    website = '/pub/gps/data/daily/';

    for k = 1:num_monu  
        ftp_monu(k,:) = strcat(website,date_str,monu_filename(k,:),'.Z'); % /daily  	/yyyy  	/ddd  	/yyt  	monuddd#.yyt.Z
    end
    
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---FTP---o---o---o---o---o---o---o---o---o---o---o--
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Collecting Files via FTP...........\n\n')

% Contacting FTP site

    nasa = 'cddis.gsfc.nasa.gov';
    FTP_NASA = ftp(nasa);
    
    fprintf('\tSelecting for Date:\t %s\n\n',sim_date_str)
    for k = 1:num_monu
        fprintf('\tDownloading Ephemeris Data:\t %s;\t\t %s',monu(k,:),monu_info(k,:))
        mget(FTP_NASA,ftp_monu(k,:));
        fprintf('\tDone.\n')
    end
    
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---Move Data---o--o--o---o---o---o---o---o---o---o--
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Moving Files Around.............\n\n')

  % Determining Data Locations downloaded from FTP Site:
    for k = 1:num_monu 
        data_location(k,:) = strcat('pub\gps\data\daily\',Y_comp,'\',Day_count,'\',yy,'n\',monu_filename(k,:),'.Z');
    end        
   

  % Moving Files to CD
    for k = 1:num_monu
        movefile(data_location(k,:));
    end 
    
  % Deleting Files
    Current_Directory = cd;
    Path_folder       = strcat(Current_Directory,'\pub');
    rmdir(Path_folder,'s')
    
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o--GZIP---o---o---o---o---o---o---o---o---o---o---o--
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Unzipping Files...........\n\n')

  % Creating Callouts for Gzip Program
    monu_gzip1      = blanks(5);
    monu_gzip2      = blanks(5);
    monu_gzip3      = blanks(5);
    monu_gzip1(2:5) = monu(1,:);
    monu_gzip2(2:5) = monu(2,:);
    monu_gzip3(2:5) = monu(3,:);

    callup          = 'gzip -d';
    monu_file_name1 = strcat(monu_gzip1(1,:),Day_count,'0.',yy,'n');
    monu_file_name2 = strcat(monu_gzip2(1,:),Day_count,'0.',yy,'n');
    monu_file_name3 = strcat(monu_gzip3(1,:),Day_count,'0.',yy,'n');

    Gzip_callout1   = strcat(callup,monu_file_name1);
    Gzip_callout2   = strcat(callup,monu_file_name2);
    Gzip_callout3   = strcat(callup,monu_file_name3);
    
% Unzipping  Files

    dos(Gzip_callout1)
    dos(Gzip_callout2)
    dos(Gzip_callout3)
    
% Move Files to Ephemeris Data Folder

  % Current Data Location
    Current_Directory      = cd;
    CD_Data_file_location1 = strcat(Current_Directory,'\',monu_filename(1,:));
    CD_Data_file_location2 = strcat(Current_Directory,'\',monu_filename(2,:));
    CD_Data_file_location3 = strcat(Current_Directory,'\',monu_filename(3,:));
  % Creating Ephemeris Data Folder 
    Data_file_location = strcat(Current_Directory,'\Ephemeris Data CDDIS');
    
    movefile(CD_Data_file_location1,Data_file_location);
    movefile(CD_Data_file_location2,Data_file_location);
    movefile(CD_Data_file_location3,Data_file_location);

clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%---o---o---o---o---o---END--o--o---o--o--o---o---o---o---o---o---o---o--
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

output = monu_filename;

end
